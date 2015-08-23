import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    
    property alias cfg_squareLayout: squareLayout.checked
    
    property alias cfg_fullCircles: fullCircles.checked
    property alias cfg_showNumbers: showNumbers.checked
    property alias cfg_showLabels: showLabels.checked
    
    property alias cfg_enableSeconds: enableSeconds.checked
    property alias cfg_showSecondsNumber: showSecondsNumber.checked

    GridLayout {
        
        columns: 2
        
        CheckBox {
            id: squareLayout
            text: i18n('Square Layout')
            Layout.columnSpan: 2
        }
        
        Item {
            width: 2
            height: 10
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: fullCircles
            text: i18n('Full Circles')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: showNumbers
            text: i18n('Show Numbers')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: showLabels
            text: i18n('Show Labels')
            Layout.columnSpan: 2
        }
        
        Item {
            width: 2
            height: 10
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: enableSeconds
            text: i18n('Enable Seconds')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: showSecondsNumber
            text: i18n('Show Seconds Number')
            Layout.columnSpan: 2
            enabled: enableSeconds.checked
        }
    }
    
}
