pragma Singleton

import QtQuick

QtObject{
    id: _root

    property QtObject heavy: QtObject {
        id: _heavyRoot

        readonly property string iconBasePath: Qt.resolvedUrl("./assets/svg/")

        readonly property IconData android: IconData { path: _heavyRoot.iconBasePath + "android.svg"; type: IconData.Heavy }
        readonly property IconData settings: IconData { path: _heavyRoot.iconBasePath + "settings.svg"; type: IconData.Heavy }
        readonly property IconData mail: IconData { path: _heavyRoot.iconBasePath + "mail.svg"; type: IconData.Heavy }
        readonly property IconData arrow: IconData { path: _heavyRoot.iconBasePath + "arrow.svg"; type: IconData.Heavy }
        readonly property IconData logo: IconData { path: _heavyRoot.iconBasePath + "logo.svg"; type: IconData.Heavy }
        readonly property IconData alternativeLogo: IconData { path: _heavyRoot.iconBasePath + "alternativeLogo.svg"; type: IconData.Heavy }
        readonly property IconData closeX: IconData { path: _heavyRoot.iconBasePath + "closeX.svg"; type: IconData.Heavy }
        readonly property IconData menu: IconData { path: _heavyRoot.iconBasePath + "menu.svg"; type: IconData.Heavy }
        readonly property IconData sun: IconData { path: _heavyRoot.iconBasePath + "sun.svg"; type: IconData.Heavy }
        readonly property IconData moon: IconData { path: _heavyRoot.iconBasePath + "moon.svg"; type: IconData.Heavy }
        readonly property IconData star: IconData { path: _heavyRoot.iconBasePath + "star.svg"; type: IconData.Heavy }
        readonly property IconData avatar: IconData { path: _heavyRoot.iconBasePath + "avatar.svg"; type: IconData.Heavy }
        readonly property IconData font: IconData { path: _heavyRoot.iconBasePath + "font.svg"; type: IconData.Heavy }
        readonly property IconData palette: IconData { path: _heavyRoot.iconBasePath + "palette.svg"; type: IconData.Heavy }
        readonly property IconData verified: IconData { path: _heavyRoot.iconBasePath + "verified.svg"; type: IconData.Heavy }
        readonly property IconData checkmark: IconData { path: _heavyRoot.iconBasePath + "checkmark.svg"; type: IconData.Heavy }
        readonly property IconData list: IconData { path: _heavyRoot.iconBasePath + "list.svg"; type: IconData.Heavy }
        readonly property IconData search: IconData { path: _heavyRoot.iconBasePath + "search.svg"; type: IconData.Heavy }
        readonly property IconData stonks: IconData { path: _heavyRoot.iconBasePath + "stonks.svg"; type: IconData.Heavy }
        readonly property IconData send: IconData { path: _heavyRoot.iconBasePath + "send.svg"; type: IconData.Heavy }
        readonly property IconData call: IconData { path: _heavyRoot.iconBasePath + "call.svg"; type: IconData.Heavy }
        readonly property IconData pages: IconData { path: _heavyRoot.iconBasePath + "pages.svg"; type: IconData.Heavy }
        readonly property IconData gamepad: IconData { path: _heavyRoot.iconBasePath + "gamepad.svg"; type: IconData.Heavy }
        readonly property IconData edit: IconData { path: _heavyRoot.iconBasePath + "edit.svg"; type: IconData.Heavy }
        readonly property IconData info: IconData { path: _heavyRoot.iconBasePath + "info.svg"; type: IconData.Heavy }
        readonly property IconData success: IconData { path: _heavyRoot.iconBasePath + "success.svg"; type: IconData.Heavy }
        readonly property IconData alert: IconData { path: _heavyRoot.iconBasePath + "alert.svg"; type: IconData.Heavy }
        readonly property IconData dashedCircle: IconData { path: _heavyRoot.iconBasePath + "dashedCircle.svg"; type: IconData.Heavy }
        readonly property IconData addPhoto: IconData { path: _heavyRoot.iconBasePath + "addPhoto.svg"; type: IconData.Heavy }

        function getAll() : list<string> {
            return _root.getPropertyNames(this);
        }
    }

    property QtObject light: QtObject {
        readonly property IconData android: IconData { path: "\ue927"; type: IconData.Light }
        readonly property IconData settings: IconData { path: "\ue916"; type: IconData.Light }
        readonly property IconData mail: IconData { path: "\ue90e"; type: IconData.Light }
        readonly property IconData arrow: IconData { path: "\ue928"; type: IconData.Light }
        readonly property IconData logo: IconData { path: "\ue907"; type: IconData.Light }
        readonly property IconData alternativeLogo: IconData { path: "\ue926"; type: IconData.Light }
        readonly property IconData closeX: IconData { path: "\ue901"; type: IconData.Light }
        readonly property IconData menu: IconData { path: "\ue90f"; type: IconData.Light }
        readonly property IconData sun: IconData { path: "\ue908"; type: IconData.Light }
        readonly property IconData moon: IconData { path: "\ue910"; type: IconData.Light }
        readonly property IconData star: IconData { path: "\ue917"; type: IconData.Light }
        readonly property IconData avatar: IconData { path: "\ue929"; type: IconData.Light }
        readonly property IconData font: IconData { path: "\ue903"; type: IconData.Light }
        readonly property IconData palette: IconData { path: "\ue913"; type: IconData.Light }
        readonly property IconData verified: IconData { path: "\ue924"; type: IconData.Light }
        readonly property IconData checkmark: IconData { path: "\ue900"; type: IconData.Light }
        readonly property IconData list: IconData { path: "\ue906"; type: IconData.Light }
        readonly property IconData search: IconData { path: "\ue914"; type: IconData.Light }
        readonly property IconData stonks: IconData { path: "\ue919"; type: IconData.Light }
        readonly property IconData send: IconData { path: "\ue915"; type: IconData.Light }
        readonly property IconData call: IconData { path: "\ue92a"; type: IconData.Light }
        readonly property IconData pages: IconData { path: "\ue912"; type: IconData.Light }
        readonly property IconData gamepad: IconData { path: "\ue904"; type: IconData.Light }
        readonly property IconData edit: IconData { path: "\ue902"; type: IconData.Light }

        readonly property IconData info: IconData { path: "\ue905"; type: IconData.Light }
        readonly property IconData success: IconData { path: "\ue91a"; type: IconData.Light }
        readonly property IconData alert: IconData { path: "\ue925"; type: IconData.Light }

        function getAll() : list<string> {
            return _root.getPropertyNames(this);
        }
    }

    function getPropertyNames(iconContainer: QtObject) : list<string> {
        var names = [];
        for (var key in iconContainer) {
            if (iconContainer.hasOwnProperty(key) && typeof iconContainer[key] == "object") {
                names.push(key);
            }
        }
        return names;
    }
}
