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
import QtQuick.Controls 1.3

Item {
    id: compactRepresentation

    property bool fullCircles
    
    property double ratio: squareLayout ? 1 : 4
    property double itemWidth:  parent === null ? 0 : (vertical ? parent.width : parent.height) * ratio
    property double itemHeight: itemWidth / ratio
    
    property double partSize: squareLayout ? itemHeight / 2 : itemHeight
    property double seconds
    
    Layout.preferredWidth: itemWidth
    Layout.preferredHeight: itemHeight
    
    property double fontPointSize: partSize * 0.4
    
    property bool mouseIn: false
    
    Component.onCompleted: {
        print('uptime width: ' + itemWidth + ', height: '+ itemHeight + ', partSize: ' + partSize)
    }
    
    onFullCirclesChanged: {
        repaint()
    }
    
    onSecondsChanged: {
        print('changed: ' + seconds)
        var secs = seconds
        var mins = 0
        if (secs >= 60) {
            mins = Math.floor(secs / 60)
            secs = secs - mins * 60
        }
        var hours = 0
        if (mins >= 60) {
            hours = Math.floor(mins / 60)
            mins = mins - hours * 60
        }
        var days = 0
        if (hours >= 24) {
            days = Math.floor(hours / 24)
            hours = hours - days * 24
        }
        
        daysCircle.proportion = days / 7
        daysCircle.value = days
        
        hoursCircle.proportion = hours / 24
        hoursCircle.value = hours
        
        minsCircle.proportion = mins / 60
        minsCircle.value = mins
        
        secsCircle.proportion = secs / 60
        secsCircle.value = secs
    }
    
    GridLayout {
        
        Layout.preferredWidth: itemWidth
        Layout.preferredHeight: itemHeight
        
        columns: squareLayout ? 2 : 4
        columnSpacing: 0
        rowSpacing: 0
        
        CircleText {
            id: daysCircle
            valueLabel: 'd'
            isDays: true
        }
        
        CircleText {
            id: hoursCircle
            valueLabel: 'h'
            circleOpacity: 0.8
        }
        
        CircleText {
            id: minsCircle
            valueLabel: 'm'
            circleOpacity: 0.5
        }
        
        CircleText {
            id: secsCircle
            valueLabel: 's'
            circleOpacity: 0.2
        }
    }
    
    
    MouseArea {
        anchors.fill: parent
        
        hoverEnabled: true
        
        onEntered: {
            mouseIn = true
        }
        
        onExited: {
            mouseIn = false
        }
    }
    
    function repaint() {
        print('repainting')
        hoursCircle.repaint()
        minsCircle.repaint()
        secsCircle.repaint()
    }
    
}
