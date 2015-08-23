import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    
    property alias cfg_fullCircles: fullCircles.checked
    property alias cfg_squareLayout: squareLayout.checked
    property alias cfg_showLabels: showLabels.checked

    GridLayout {
        Layout.fillWidth: true
        columns: 2
        
        CheckBox {
            id: fullCircles
            text: i18n('Full Circles')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: squareLayout
            text: i18n('Square Layout')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: showLabels
            text: i18n('Show Labels')
            Layout.columnSpan: 2
        }
    }
    
}
