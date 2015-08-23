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

Item {
    
    property double proportion
    property string valueLabel
    property string value
    property bool isDays: false
    property double circleOpacity: 1
    
    property double stdThickness: partSize/2.1
    property double circleThicknessAttr: fullCircles && !isDays ? 0 : stdThickness * 0.9
    
    Layout.preferredWidth: partSize
    Layout.preferredHeight: partSize
    
    width: partSize
    height: partSize

    onProportionChanged: {
        repaint()
    }
    
    function repaint() {
        canvas.requestPaint()
    }
    
    Canvas {
        id: canvas

        property int lineWidth: 1
        property bool fill: true
        property bool stroke: true
        property real alpha: 1.0

        // This fixes edge bleeding
        readonly property double filler: 0.01

        width: parent.width
        height: parent.height
        antialiasing: true
        opacity: circleOpacity * ((fullCircles && mouseIn && !isDays) ? 0.5 : 1)

        onPaint: {
            var ctx = getContext('2d')
            ctx.save()
            ctx.clearRect(0,0,canvas.width, canvas.height)
            ctx.strokeStyle = theme.textColor
            ctx.globalAlpha = canvas.alpha

            // Start from 6 o'clock
            var currentRadian = Math.PI/2

            // Draw the sectors
            var radians = proportion * 2 * Math.PI
            ctx.fillStyle = theme.highlightColor
            ctx.beginPath();
            
            ctx.arc(width/2, height/2, stdThickness, currentRadian, currentRadian + radians + filler, false)
            
            ctx.arc(width/2, height/2, circleThicknessAttr, currentRadian + radians + filler, currentRadian, true)
            
            currentRadian += radians - filler
            ctx.closePath()
            ctx.fill()

        }
    }
    
    Text {
        id: valueText
        anchors.centerIn: parent
        text: value
        font.pointSize: fontPointSize
        visible: !fullCircles || (fullCircles && mouseIn) || isDays
    }
    
    Text {
        id: valueTextLabel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -2
        anchors.right: parent.right
        text: valueLabel
        font.pointSize: fontPointSize * 0.65
        visible: showLabels || mouseIn
    }
}
