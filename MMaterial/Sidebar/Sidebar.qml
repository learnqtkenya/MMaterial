import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    id: _root

    default property list<SidebarItem> sidebarItems

    property alias loader: _loader

    property string name
    property string role

    property int currentIndex: -1

    implicitHeight: parent.height

    color: Theme.background.main
    state: ""

    layer{
        enabled: true
        effect: MultiEffect{
            shadowEnabled: true
            shadowBlur: 3
            shadowHorizontalOffset: 2
            shadowVerticalOffset: 5
        }
    }

    states: [
        State {
            name: "extended"
            when: Size.format == Size.Format.Extended
        },
        State {
            name: "compact"
            when: true //Size.format == Size.Format.Contained
        }
    ]

    onStateChanged: _swapAnimation.restart()

    SequentialAnimation {
        id: _swapAnimation

        ParallelAnimation {
            NumberAnimation { target: _root; properties: "width"; to: Size.format == Size.Format.Extended ? 280 * Size.scale : 86 * Size.scale; duration: 220; easing.type: Easing.InOutQuad }
            NumberAnimation { target: _loader; properties: "opacity"; to: 0; duration: 200; easing.type: Easing.OutQuad }
        }
        ScriptAction { script: d.swapSources() }
    }

    NumberAnimation {
        id: _showAnimation

        target: _loader
        properties: "opacity"
        to: 1
        duration: 200
        easing.type: Easing.OutQuad
    }

    Loader {
        id: _loader

        anchors.fill: _root
        asynchronous: true

        onStatusChanged: {
            if (status == Loader.Ready) {
                _showAnimation.restart()
            }
        }
    }

    Component {
        id: _extendedSidebar

        ExtendedSidebar{
            title.text: _root.name
            subtitle.text: _root.role

            model: _root.sidebarItems
        }
    }

    Component {
        id: _compactSidebar

        CompactSidebar{
            model: _root.sidebarItems
        }
    }

    QtObject {
        id: d

        function swapSources() {
            if ( Size.format == Size.Format.Extended )
                _loader.sourceComponent = _extendedSidebar
            else
                _loader.sourceComponent = _compactSidebar
        }
    }
}
