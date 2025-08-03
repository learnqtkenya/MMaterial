pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs

FocusScope {
    id: root

    property int segmentCount: 5
    property int maxLength: 1
    property string text: ""
    property string placeholderText: ""
    property color placeholderTextColor: UI.Theme.text.disabled
    property UI.PaletteBasic accent: UI.Theme.primary
    property int type: Inputs.TextField.Type.Outlined
    property bool enabled: true
    property bool acceptableInput: true
    property alias validator: d.validator
    property alias inputMask: d.inputMask
    property real spacing: UI.Size.pixel8
    property real segmentSize: UI.Size.pixel48

    signal editingFinished()
    signal inputTextChanged(string text)

    function clear() {
        for (let i = 0; i < segmentGrid.count; i++) {
            let item = segmentGrid.itemAtIndex(i);
            if (item) {
                let textInput = d.findTextInput(item);
                if (textInput) {
                    textInput.text = "";
                }
            }
        }
        d.updateText();
        d.focusSegment(0);
    }

    function focusSegment(index) {
        if (index >= 0 && index < segmentGrid.count) {
            let item = segmentGrid.itemAtIndex(index);
            if (item) {
                let textInput = d.findTextInput(item);
                if (textInput) {
                    textInput.forceActiveFocus();
                }
            }
        }
    }

    Layout.fillWidth: true

    implicitWidth: d.idealWidth
    implicitHeight: d.calculatedHeight

    QtObject {
        id: d

        property var validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        property string inputMask: ""

        readonly property real idealWidth: root.segmentCount * (root.segmentSize + root.spacing) - root.spacing

        readonly property real effectiveWidth: {
            if (root.parent && root.parent.width > 0) {
                return Math.min(idealWidth, root.parent.width);
            }
            return idealWidth;
        }

        readonly property real calculatedHeight: {
            let availableWidth = Math.max(effectiveWidth, root.segmentSize);
            let segmentWidth = root.segmentSize + root.spacing;
            let maxCols = Math.max(1, Math.floor((availableWidth + root.spacing) / segmentWidth));
            let rows = Math.ceil(root.segmentCount / maxCols);
            return rows * (root.segmentSize + root.spacing) - root.spacing;
        }

        function findTextInput(item) {
            // Structure: Item -> Rectangle -> TextInput
            if (item && item.children && item.children.length > 0) {
                let rectangle = item.children[0]; // segmentContainer (Rectangle)
                if (rectangle && rectangle.children && rectangle.children.length > 0) {
                    for (let i = 0; i < rectangle.children.length; i++) {
                        let child = rectangle.children[i];
                        if (child && child.hasOwnProperty("text") && child.hasOwnProperty("maximumLength")) {
                            return child; // This is our TextInput
                        }
                    }
                }
            }
            return null;
        }

        function updateText() {
            let newText = "";
            for (let i = 0; i < segmentGrid.count; i++) {
                let item = segmentGrid.itemAtIndex(i);
                if (item) {
                    let textInput = findTextInput(item);
                    if (textInput) {
                        newText += textInput.text;
                    }
                }
            }
            if (root.text !== newText) {
                root.text = newText;
                root.inputTextChanged(newText);
            }
        }

        function moveToNext(currentIndex) {
            if (currentIndex < segmentGrid.count - 1) {
                focusSegment(currentIndex + 1);
            } else {
                root.editingFinished();
            }
        }

        function moveToPrevious(currentIndex) {
            if (currentIndex > 0) {
                focusSegment(currentIndex - 1);
            }
        }

        function focusSegment(index) {
            if (index >= 0 && index < segmentGrid.count) {
                let item = segmentGrid.itemAtIndex(index);
                if (item) {
                    let textInput = findTextInput(item);
                    if (textInput) {
                        textInput.forceActiveFocus();
                    }
                }
            }
        }

        function isComplete() {
            for (let i = 0; i < segmentGrid.count; i++) {
                let item = segmentGrid.itemAtIndex(i);
                if (item) {
                    let textInput = findTextInput(item);
                    if (textInput && textInput.text === "") {
                        return false;
                    }
                }
            }
            return true;
        }
    }

    GridView {
        id: segmentGrid

        anchors.fill: root
        cellWidth: root.segmentSize + root.spacing
        cellHeight: root.segmentSize + root.spacing
        model: root.segmentCount
        interactive: false
        flow: GridView.FlowLeftToRight

        delegate: Item {
            id: cellContainer

            required property int index

            width: segmentGrid.cellWidth
            height: segmentGrid.cellHeight

            Rectangle {
                id: segmentContainer

                anchors.centerIn: cellContainer
                width: root.segmentSize
                height: root.segmentSize

                radius: root.type === Inputs.TextField.Type.Outlined ? UI.Size.pixel8 : 0
                color: {
                    if (!root.enabled) return UI.Theme.action.disabledBackground;
                    if (root.type === Inputs.TextField.Type.Filled) {
                        return segmentInput.activeFocus ? UI.Theme.main.transparent.p16 : UI.Theme.main.transparent.p8;
                    }
                    return UI.Theme.background.paper;
                }

                border {
                    width: root.type === Inputs.TextField.Type.Outlined ? 1 : 0
                    color: {
                        if (!root.enabled) return UI.Theme.action.disabledBackground;
                        if (!root.acceptableInput) return UI.Theme.error.main;
                        if (segmentInput.activeFocus) return root.accent.main;
                        return UI.Theme.action.disabledBackground;
                    }
                }

                Rectangle {
                    anchors.bottom: segmentContainer.bottom
                    width: segmentContainer.width
                    height: root.type === Inputs.TextField.Type.Standard ? 2 : 0
                    color: segmentContainer.border.color
                    visible: root.type === Inputs.TextField.Type.Standard
                }

                TextInput {
                    id: segmentInput

                    anchors.centerIn: segmentContainer

                    text: ""
                    maximumLength: root.maxLength
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    enabled: root.enabled
                    validator: d.validator
                    inputMask: d.inputMask

                    color: root.enabled ? UI.Theme.text.primary : UI.Theme.text.disabled
                    selectionColor: root.acceptableInput ? root.accent.main : UI.Theme.error.main
                    selectedTextColor: root.acceptableInput ? root.accent.contrastText : UI.Theme.error.contrastText

                    font {
                        family: UI.Font.normal
                        pixelSize: UI.Size.pixel16
                        bold: true
                    }

                    onTextChanged: {
                        d.updateText();
                        if (text.length === root.maxLength && text !== "") {
                            d.moveToNext(cellContainer.index);
                        }
                    }

                    onActiveFocusChanged: {
                        if (activeFocus) {
                            selectAll();
                        }
                    }

                    Keys.onPressed: (event) => {
                        if (event.key === Qt.Key_Backspace && text === "") {
                            event.accepted = true;
                            d.moveToPrevious(cellContainer.index);
                        } else if (event.key === Qt.Key_Left) {
                            event.accepted = true;
                            d.moveToPrevious(cellContainer.index);
                        } else if (event.key === Qt.Key_Right) {
                            event.accepted = true;
                            d.moveToNext(cellContainer.index);
                        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            event.accepted = true;
                            if (d.isComplete()) {
                                root.editingFinished();
                            } else {
                                d.moveToNext(cellContainer.index);
                            }
                        }
                    }

                    UI.B2 {
                        anchors.centerIn: segmentInput
                        text: cellContainer.index < root.placeholderText.length ? root.placeholderText[cellContainer.index] : ""
                        color: root.placeholderTextColor
                        visible: segmentInput.text === "" && !segmentInput.activeFocus
                        font: segmentInput.font
                    }
                }

                Rectangle {
                    anchors.fill: segmentContainer
                    anchors.margins: -UI.Size.pixel2
                    radius: segmentContainer.radius + UI.Size.pixel2
                    color: "transparent"
                    border {
                        width: segmentInput.activeFocus ? UI.Size.pixel2 : 0
                        color: root.accent.main
                    }
                    visible: segmentInput.activeFocus && root.type !== Inputs.TextField.Type.Outlined
                    opacity: 0.6
                }

                MouseArea {
                    anchors.fill: segmentContainer
                    onClicked: segmentInput.forceActiveFocus()
                }
            }
        }
    }

    Component.onCompleted: {
        d.focusSegment(0);
    }
}
