import QtQuick
import QtQuick.Layouts

import MMaterial

Item {
    id: _root

    property string category

    property alias icon: _icon
    property alias text: _title.text
    property alias model: _listView.model
    property alias list: _listView

    property bool checked: ListView.isCurrentItem
    property bool isOpen: false

    property real openingSpeed: 150

    function selectItem(subindex) : void {
        if(typeof index !== "undefined")
            ListView.view.currentIndex = index;
        else if(typeof ObjectModel.index !== "undefined")
            ListView.view.currentIndex = ObjectModel.index;

        if (ListView.view) {
            SidebarData.currentIndex = ListView.view.currentIndex;

            if (subindex)
                SidebarData.currentSubIndex = subindex;
        }
    }

    signal clicked

    height: _listView.height + _listView.anchors.topMargin + _mainItem.height
    width: ListView.view ? ListView.view.width : 0

    states: [
        State{
            when: _root.isOpen
            name: "open"
            PropertyChanges{ target: _listView; height: _listView.count * (_listView.delegateHeight + _listView.spacing) - _listView.spacing; }
        },
        State{
            when: !_root.isOpen
            name: "closed"
            PropertyChanges{ target: _listView; height: 0; }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "open"
            NumberAnimation { target: _listView; property: "height"; duration: _root.openingSpeed; easing.type: Easing.InOutQuad }
        },
        Transition {
            from: "*"
            to: "closed"
            NumberAnimation { target: _listView; property: "height"; duration: _root.openingSpeed; easing.type: Easing.InOutQuad }
        }
    ]

    Checkable {
        id: _mainItem

        height: 50 * Size.scale
        width: _root.width

        customCheckImplementation: true
        radius: 8

        onClicked: {
            if (_root.model && _root.model.length > 0) {
                _root.isOpen = !_root.isOpen;
            } else {
                _root.selectItem();
            }
            _root.clicked();
        }

        states: [
            State {
                name: "disabled"
                when: !_root.enabled
                PropertyChanges{ target: _mainItem; color: "transparent"; opacity: 0.64; }
                PropertyChanges { target: _title; font.family: PublicSans.regular; color: Theme.text.secondary }
                PropertyChanges{ target: _icon; color: Theme.text.secondary }
                PropertyChanges{ target: _arrow; color: Theme.text.secondary }
            },
            State {
                name: "checked"
                when: _root.checked
                PropertyChanges{ target: _mainItem; color: _mainItem.mouseArea.containsMouse ? Theme.primary.transparent.p16 : Theme.primary.transparent.p8; opacity: 1;}
                PropertyChanges { target: _title; font.family: PublicSans.semiBold; color: Theme.primary.main; }
                PropertyChanges{ target: _icon; color: Theme.primary.main }
                PropertyChanges{ target: _arrow; color: Theme.primary.main; }
            },
            State {
                name: "unchecked"
                when: !_root.checked
                PropertyChanges{ target: _mainItem; color: _mainItem.mouseArea.containsMouse ? Theme.background.neutral : "transparent"; opacity: 1;}
                PropertyChanges { target: _title; font.family: PublicSans.regular; color: Theme.text.secondary }
                PropertyChanges{ target: _icon; color: Theme.text.secondary }
                PropertyChanges{ target: _arrow; color: Theme.text.secondary }
            }
        ]

        RowLayout {
            anchors{
                fill: _mainItem
                leftMargin: Size.pixel16
                rightMargin: Size.pixel12
            }

            spacing: Size.pixel8

            Icon {
                id: _icon

                Layout.alignment: Qt.AlignVCenter

                visible: iconData.path != ""
                size: Size.pixel24
                color: _title.color
            }

            Subtitle2 {
                id: _title

                Layout.leftMargin: _icon.visible ? Size.pixel8 : 0
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                verticalAlignment: Qt.AlignVCenter
            }

            Icon {
                id: _arrow

                Layout.alignment: Qt.AlignVCenter

                visible: _root.model ? _root.model.length > 0 : 0
                iconData: Icons.light.arrow
                rotation: _root.isOpen ? 0 : -90

                size: Size.pixel10

                Behavior on rotation { SmoothedAnimation { duration: _root.openingSpeed;} }
            }
        }
    }

    ListView {
        id: _listView

        property real delegateHeight: 36 * Size.scale

        anchors{
            top: _mainItem.bottom; topMargin: Size.pixel4
            left: _root.left; right: _root.right
        }

        currentIndex: _root.checked ? SidebarData.currentSubIndex : -1
        spacing: Size.pixel4
        interactive: false
        clip: true

        delegate: Rectangle {
            id: _subItem

            property bool checked: ListView.isCurrentItem
            property string text: modelData.text

            enabled: modelData.enabled === undefined ? true : modelData.enabled
            radius: _mainItem.radius
            height: _listView.delegateHeight
            width: _listView.width
            color: _subItemMouseArea.containsMouse ? Theme.background.neutral : "transparent"

            states: [
                State {
                    name: "disabled"
                    when: !_subItem.enabled
                    PropertyChanges{ target: _subItem; opacity: 0.68; }
                    PropertyChanges{ target: _dot; color: Theme.text.secondary; scale: 1 }
                    PropertyChanges{ target: _label; color: Theme.text.secondary; font.family: PublicSans.regular }
                },
                State {
                    name: "checked"
                    when: _listView.currentIndex === index
                    PropertyChanges{ target: _subItem; opacity: 1; }
                    PropertyChanges{ target: _dot; color: Theme.primary.main; scale: 3 }
                    PropertyChanges{ target: _label; color: Theme.text.primary; font.family: PublicSans.semiBold }
                },
                State {
                    name: "unchecked"
                    when: _listView.currentIndex !== index
                    PropertyChanges{ target: _subItem; opacity: 1; }
                    PropertyChanges{ target: _dot; color: Theme.text.secondary; scale: 1 }
                    PropertyChanges{ target: _label; color: Theme.text.secondary; font.family: PublicSans.regular }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "checked"
                    ColorAnimation { target: _dot; duration: 300; easing.type: Easing.InOutQuad }
                    ColorAnimation { target: _label; duration: 0; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: _dot; property: "scale"; duration: 300; easing.type: Easing.InOutQuad }
                },
                Transition {
                    from: "*"
                    to: "unchecked"
                    ColorAnimation { target: _dot; duration: 300; easing.type: Easing.InOutQuad }
                    ColorAnimation { target: _label; duration: 0; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: _dot; property: "scale"; duration: 300; easing.type: Easing.InOutQuad }
                }
            ]

            RowLayout {
                anchors {
                    fill: _subItem
                    leftMargin: Size.pixel16
                    rightMargin: Size.pixel12
                }

                spacing: Size.pixel16

                Item {
                    id: _dotContainer

                    Layout.preferredHeight: Size.pixel24
                    Layout.preferredWidth: height
                    Layout.alignment: Qt.AlignVCenter

                    Rectangle { id: _dot; height: Size.pixel4; width: Size.pixel4; anchors.centerIn: _dotContainer; radius: 100 }
                }

                Subtitle2 {
                    id: _label

                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter

                    verticalAlignment: Qt.AlignVCenter

                    text: _subItem.text
                }

            }
            MouseArea {
                id: _subItemMouseArea

                anchors.fill: _subItem

                hoverEnabled: _subItem.enabled
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    _listView.currentIndex = index;
                    _root.selectItem(index);
                    modelData.onClicked();
                }
            }
        }
    }
}
