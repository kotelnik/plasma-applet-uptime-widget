import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    
    property alias cfg_squareLayout: squareLayout.checked
    
    property alias cfg_enableDays: enableDays.checked
    property alias cfg_daysFullCircle: daysFullCircle.checked
    property alias cfg_daysShowNumber: daysShowNumber.checked
    property alias cfg_daysShowLabel: daysShowLabel.checked
    
    property alias cfg_enableHours: enableHours.checked
    property alias cfg_hoursFullCircle: hoursFullCircle.checked
    property alias cfg_hoursShowNumber: hoursShowNumber.checked
    property alias cfg_hoursShowLabel: hoursShowLabel.checked
    
    property alias cfg_enableMinutes: enableMinutes.checked
    property alias cfg_minutesFullCircle: minutesFullCircle.checked
    property alias cfg_minutesShowNumber: minutesShowNumber.checked
    property alias cfg_minutesShowLabel: minutesShowLabel.checked
    
    property alias cfg_enableSeconds: enableSeconds.checked
    property alias cfg_secondsFullCircle: secondsFullCircle.checked
    property alias cfg_secondsShowNumber: secondsShowNumber.checked
    property alias cfg_secondsShowLabel: secondsShowLabel.checked

    Column {
        spacing: 15
        
        CheckBox {
            id: squareLayout
            text: i18n('Square layout')
        }
        
        GridLayout {
            
            columns: 2
            
            rowSpacing: 15
            columnSpacing: 15
            
            GridLayout {
                
                columns: 2
                
                CheckBox {
                    id: enableDays
                    text: i18n("Enable days")
                    Layout.columnSpan: 2
                }
                
                Item {
                    width: 10
                    Layout.rowSpan: 3
                }
                
                CheckBox {
                    id: daysFullCircle
                    text: i18n('Full circle')
                    enabled: enableDays.checked
                }
                CheckBox {
                    id: daysShowNumber
                    text: i18n('Show number')
                    enabled: enableDays.checked
                }
                CheckBox {
                    id: daysShowLabel
                    text: i18n('Show label')
                    enabled: enableDays.checked
                }
            }
            
            GridLayout {
                
                columns: 2
                
                CheckBox {
                    id: enableHours
                    text: i18n("Enable hours")
                    Layout.columnSpan: 2
                }
                
                Item {
                    width: 10
                    Layout.rowSpan: 3
                }
                
                CheckBox {
                    id: hoursFullCircle
                    text: i18n('Full circle')
                    enabled: enableHours.checked
                }
                CheckBox {
                    id: hoursShowNumber
                    text: i18n('Show number')
                    enabled: enableHours.checked
                }
                CheckBox {
                    id: hoursShowLabel
                    text: i18n('Show label')
                    enabled: enableHours.checked
                }
            }
            
            GridLayout {
                
                columns: 2
                
                CheckBox {
                    id: enableMinutes
                    text: i18n("Enable minutes")
                    Layout.columnSpan: 2
                }
                
                Item {
                    width: 10
                    Layout.rowSpan: 3
                }
                
                CheckBox {
                    id: minutesFullCircle
                    text: i18n('Full circle')
                    enabled: enableMinutes.checked
                }
                CheckBox {
                    id: minutesShowNumber
                    text: i18n('Show number')
                    enabled: enableMinutes.checked
                }
                CheckBox {
                    id: minutesShowLabel
                    text: i18n('Show label')
                    enabled: enableMinutes.checked
                }
            }
            
            GridLayout {
                
                columns: 2
                
                CheckBox {
                    id: enableSeconds
                    text: i18n("Enable seconds")
                    Layout.columnSpan: 2
                }
                
                Item {
                    width: 10
                    Layout.rowSpan: 3
                }
                
                CheckBox {
                    id: secondsFullCircle
                    text: i18n('Full circle')
                    enabled: enableSeconds.checked
                }
                CheckBox {
                    id: secondsShowNumber
                    text: i18n('Show number')
                    enabled: enableSeconds.checked
                }
                CheckBox {
                    id: secondsShowLabel
                    text: i18n('Show label')
                    enabled: enableSeconds.checked
                }
            }
            
        }
        
    }
}
