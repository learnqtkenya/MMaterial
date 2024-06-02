import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls

import MMaterial as MMaterial
import QtQuick.Controls.Material

Item {
    id: root

    property Component nextView: null

    function openView() {
        stackView.replace(root.nextView)
    }

    function scheduleNextView(view) {
        root.nextView = view
        nextAnimation.restart()
    }

    Controls.StackView {
        id: stackView

        anchors.fill: root
        initialItem: simpleDialogs

        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200
            }
        }

        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
            }
        }
    }

    SequentialAnimation {
        id: nextAnimation

        ScriptAction {
            script: stackView.currentItem.closeDialogs()
        }

        PauseAnimation {
            duration: 250
        }

        ScriptAction {
            script: root.openView()
        }
    }

    RowLayout {
        id: paginator

        spacing: MMaterial.Size.pixel8

        anchors {
            horizontalCenter: root.horizontalCenter
            bottom: root.bottom
        }

        MMaterial.MButton {
            text: qsTr("Simple dialogs")
            type: stackView.currentItem.objectName === "simpleDialogs"? MMaterial.MButton.Type.Contained : MMaterial.MButton.Type.Outlined

            onClicked: root.scheduleNextView(simpleDialogs)
        }

        MMaterial.MButton {
            text: qsTr("Image dialogs")
            type: stackView.currentItem.objectName === "imageDialogs" ? MMaterial.MButton.Type.Contained : MMaterial.MButton.Type.Outlined

            onClicked: root.scheduleNextView(imageDialogs)
        }

        MMaterial.MButton {
            text: qsTr("Input dialogs")
            type: stackView.currentItem.objectName === "inputDialogs" ? MMaterial.MButton.Type.Contained : MMaterial.MButton.Type.Outlined

            onClicked: root.scheduleNextView(inputDialogs)
        }
    }

    Component {
        id: simpleDialogs

        Item {
            objectName: "simpleDialogs"

            function closeDialogs() {
                deleteDialog.close()
                simpleDialog.close()
            }

            MMaterial.MButton {
                y: deleteDialog.y + MMaterial.Size.pixel8
                x: deleteDialog.x + MMaterial.Size.pixel8
                text: qsTr("Open")
                type: MMaterial.MButton.Type.Outlined

                onClicked: deleteDialog.open()
            }

            MMaterial.MButton {
                y: simpleDialog.y + MMaterial.Size.pixel8
                x: simpleDialog.x + MMaterial.Size.pixel8
                text: qsTr("Open")
                type: MMaterial.MButton.Type.Outlined

                onClicked: simpleDialog.open()
            }

            MMaterial.Dialog {
                id: deleteDialog

                y: parent.height / 2 - height / 2
                width: Math.min (440 * MMaterial.Size.scale, root.width / 2 - MMaterial.Size.pixel10)
                title: qsTr("Delete Files?")
                closePolicy: MMaterial.Dialog.NoAutoClose
                iconData: MMaterial.Icons.light.alert
                text: qsTr("This is a destructive action, are you sure you want to delete those files?")

                Component.onCompleted: open()

                Item { Layout.fillWidth: true }

                MMaterial.Dialog.DialogCloseButton {
                    Layout.maximumWidth: parent.width / 2 - MMaterial.Size.pixel10
                    text: qsTr("Cancel")
                    onClicked: deleteDialog.close()
                }

                MMaterial.Dialog.DialogAlertButton {
                    Layout.maximumWidth: parent.width / 2 - MMaterial.Size.pixel10
                    text: qsTr("Delete")
                    onClicked: deleteDialog.close()
                }
            }

            MMaterial.Dialog {
                id: simpleDialog

                width: Math.min (440 * MMaterial.Size.scale, root.width / 2 - MMaterial.Size.pixel10)
                y: parent.height / 2 - height / 2
                x: deleteDialog.x + deleteDialog.width + MMaterial.Size.pixel20
                closePolicy: MMaterial.Dialog.NoAutoClose
                text: qsTr("Did you know that the first 1GB hard drive, introduced by IBM in 1980, weighed over 500 pounds and cost $40,000? It was a significant advancement at the time, although today, 1GB of storage is considered quite small and can be found on tiny, inexpensive flash drives.")

                Component.onCompleted: open()

                Item { Layout.fillWidth: true }

                MMaterial.Dialog.DialogCloseButton {
                    Layout.maximumWidth: parent.width / 2 - MMaterial.Size.pixel10
                    text: qsTr("Close")
                    onClicked: simpleDialog.close()

                }

                MMaterial.Dialog.DialogButton {
                    Layout.maximumWidth: parent.width / 2 - MMaterial.Size.pixel10
                    text: qsTr("Good to know!")
                    onClicked: simpleDialog.close()
                }

            }
        }
    }

    Component {
        id: imageDialogs

        Item {
            objectName: "imageDialogs"

            function closeDialogs() {
                largeImageDialog.close()
                mediumImageDialog.close()
            }

            MMaterial.MButton {
                y: largeImageDialog.y + MMaterial.Size.pixel8
                x: largeImageDialog.x + MMaterial.Size.pixel8
                text: qsTr("Open")
                type: MMaterial.MButton.Type.Outlined

                onClicked: largeImageDialog.open()
            }

            MMaterial.MButton {
                y: mediumImageDialog.y + MMaterial.Size.pixel8
                x: mediumImageDialog.x + MMaterial.Size.pixel8
                text: qsTr("Open")
                type: MMaterial.MButton.Type.Outlined

                onClicked: mediumImageDialog.open()
            }

            MMaterial.LargeImageDialog {
                id: largeImageDialog

                y: parent.height / 2 - height / 2

                width: Math.min (440 * MMaterial.Size.scale, root.width / 2 - MMaterial.Size.pixel10)
                text: qsTr("This is an amazing update that will fix all the problems in your life. Are you interested?")
                title: qsTr("We have an update to offer!")
                visible: true
                imageSource: MMaterial.Images.realisticShape3.path

                MMaterial.Dialog.DialogCloseButton {
                    Layout.fillWidth: true
                    text: qsTr("Cancel")
                    onClicked: largeImageDialog.close()
                }

                MMaterial.Dialog.DialogButton {
                    Layout.fillWidth: true
                    text: qsTr("Install")
                    onClicked: largeImageDialog.close()
                }
            }

            MMaterial.MediumImageDialog {
                id: mediumImageDialog

                y: parent.height / 2 - height / 2
                x: largeImageDialog.x + largeImageDialog.width + MMaterial.Size.pixel20

                title: qsTr("Hold Up")
                text: qsTr("We are promoting something that you need to see first! Check out our shop.")
                visible: true
                imageSource: MMaterial.Images.realisticShape2.path

                MMaterial.Dialog.DialogButton {
                    Layout.fillWidth: true
                    size: MMaterial.Size.Grade.L
                    text: qsTr("Shop")
                    onClicked: mediumImageDialog.close()
                }
            }
        }
    }

    Component {
        id: inputDialogs

        Item {
            objectName: "inputDialogs"

            function closeDialogs() {
                inputDialog.close()
                inputDialog2.close()
            }

            MMaterial.MButton {
                y: inputDialog.y + MMaterial.Size.pixel8
                x: inputDialog.x + MMaterial.Size.pixel8
                text: qsTr("Open")
                type: MMaterial.MButton.Type.Outlined

                onClicked: inputDialog.open()
            }

            MMaterial.MButton {
                y: inputDialog2.y + MMaterial.Size.pixel8
                x: inputDialog2.x + MMaterial.Size.pixel8
                text: qsTr("Open")
                type: MMaterial.MButton.Type.Outlined

                onClicked: inputDialog2.open()
            }

            MMaterial.InputDialog {
                id: inputDialog

                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height - MMaterial.Size.pixel20

                imageSource: MMaterial.Images.realisticShape1.path
                title: qsTr("Sign up")
                text: qsTr("We have a newsletter that you can sign up for. Enter your email below.")
                visible: true
                placeholder: qsTr("your-email@.com")
            }

            MMaterial.InputDialog {
                id: inputDialog2

                x: parent.width / 2 - width / 2
                y: inputDialog.y + inputDialog.height + MMaterial.Size.pixel20

                title: qsTr("Sign up")
                text: qsTr("We have a newsletter that you can sign up for. Enter your email below.")
                visible: true
                placeholder: qsTr("your-email@.com")
            }
        }
    }
}
