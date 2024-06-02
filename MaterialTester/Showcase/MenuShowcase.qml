import QtQuick
import QtQuick.Controls

import MMaterial

Item {
    id: _root

    B1 {
        text: qsTr("Right click anywhere")
        anchors.fill: _root
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        color: Theme.text.primary
    }

    TapHandler {
        acceptedButtons: Qt.RightButton
        onTapped: (eventPoint, button) => _menu.popup(eventPoint)
    }

    Menu {
        id: _menu

        Action {
            text: "Action"
        }

        MenuItem {
            text: "Menu Item"
        }

        MenuItem {
            enabled: false
            text: "Disabled Menu Item"
        }

        MenuItem {
            text: "Icon Menu Item"
            iconData: Icons.light.stonks
        }

        MenuItem {
            enabled: false
            text: "Disabled Icon Menu Item"
            iconData: Icons.light.stonks
        }

        MenuSeparator {}

        MenuItem {
            text: "Menu Item Checked"
            checked: true
            checkable: true
        }

        MenuItem {
            text: "Icon Menu Item Checked"
            iconData: Icons.light.stonks
            checkable: true
            checked: true
        }

        MenuItem {
            text: "Disabled Icon Menu Item Checked"
            iconData: Icons.light.stonks
            checkable: true
            checked: true
            enabled: false
        }

        MenuSeparator {}

        Menu {
            title: "Nested menu"

            MenuItem {
                text: "Nested item"
            }
        }

        Menu {
            title: "Double Nested menu"

            Menu {
                title: "First Layer"

                MenuItem {
                    text: "Nested item"
                }
            }
        }
    }
}
