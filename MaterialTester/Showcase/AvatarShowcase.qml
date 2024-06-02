import QtQuick
import QtQuick.Layouts

import MMaterial

Item {
    id: root

    RowLayout {
        anchors.centerIn: root
        spacing: Size.pixel48 * 2

        ColumnLayout {
            spacing: Size.pixel20

            Overline { text: qsTr("Avatar Input\n(Drag or click)"); color: Theme.text.disabled; horizontalAlignment: Qt.AlignHCenter; Layout.alignment: Qt.AlignHCenter }

            AvatarInput {
                id: avatarInput

                Layout.alignment: Qt.AlignHCenter
            }

            MButton {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Clear")
                accent: Theme.error

                onClicked: avatarInput.removeImage()
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            spacing: Size.pixel20

            Overline { text: qsTr("Avatar\n(Preview)"); color: Theme.text.disabled; horizontalAlignment: Qt.AlignHCenter; Layout.alignment: Qt.AlignHCenter }

            Avatar {
                id: avatar

                Layout.alignment: Qt.AlignHCenter
                source: avatarInput.source
            }
        }
    }
}
