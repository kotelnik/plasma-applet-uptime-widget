/*
 * Copyright 2015  Martin Kotelnik <clearmartin@seznam.cz>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http: //www.gnu.org/licenses/>.
 */
import QtQuick 2.2
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: main
    
    anchors.fill: parent
    
    property bool vertical: (plasmoid.formFactor == PlasmaCore.Types.Vertical)
    
    property bool squareLayout: plasmoid.configuration.squareLayout
    
    property bool fullCirclesSetting: plasmoid.configuration.fullCircles
    property bool showLabels: plasmoid.configuration.showLabels
    property bool showNumbers: plasmoid.configuration.showNumbers
    
    property bool enableSeconds: plasmoid.configuration.enableSeconds
    property bool showSecondsNumber: plasmoid.configuration.showSecondsNumber
    
    property double secondsValue: 0
    
    property Component cr: CompactRepresentation {
        seconds: secondsValue
        fullCircles: fullCirclesSetting
    }
    
    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
    Plasmoid.compactRepresentation: cr
    Plasmoid.fullRepresentation: cr
    
    PlasmaCore.DataSource {
        id: dataSource
        engine: "systemmonitor"

        connectedSources: [ 'system/uptime' ]
        
        onNewData: {
            if (data.value === undefined) {
                return
            }
            if (sourceName === 'system/uptime') {
                var seconds = Math.round(data.value)
                secondsValue = seconds
            }
        }
        interval: 1000
    }
    
}
