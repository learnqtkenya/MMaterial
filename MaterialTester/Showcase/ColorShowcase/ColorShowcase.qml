import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MMaterial

Item {
    objectName: "Colors"

    ColumnLayout {
        id: rootLayout

        anchors.fill: parent

        GridLayout {
            id: grid

            property int preferredColumnSpan: Window.width > 900 ? 1 : 2

            Layout.preferredHeight: parent.height * 0.66
            Layout.fillWidth: true
            uniformCellWidths: true

            columns: 4

            rowSpacing: Size.pixel40
            columnSpacing: Size.pixel40

            PaletteBasicView {
                id: primaryView

                Layout.columnSpan: 2

                title: "Primary"
                palette: Theme.primary
            }

            PaletteBasicView {
                Layout.columnSpan: 2

                title: "Secondary"
                palette: Theme.secondary
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Info"
                palette: Theme.info
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Success"
                palette: Theme.success
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Warning"
                palette: Theme.warning
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Error"
                palette: Theme.error
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.34
            Layout.topMargin: Size.pixel40

            H6 {
                Layout.minimumHeight: 18
                Layout.fillWidth: true

                text: "Grey"
                verticalAlignment: Qt.AlignVCenter
            }

            RowLayout {
                id: greyLayout

                Layout.fillHeight: true
                Layout.fillWidth: true

                Repeater {
                    property var colors: Theme.main

                    model: [colors.p100, colors.p200, colors.p300, colors.p400, colors.p500, colors.p600, colors.p700, colors.p800, colors.p900]

                    delegate: ColorRect {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignBottom
                        Layout.fillHeight: true
                        Layout.minimumWidth: Size.pixel10

                        color: modelData
                    }
                }
            }
        }
    }
}
