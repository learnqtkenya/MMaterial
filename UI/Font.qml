pragma Singleton

import QtQuick

Item {
    id: root
    // can't set a webfont path by default as there is a race in qt (request sent, the app might set a font during startup,
    // request comes back and thinks it is important. e.g., when offline, an error is reported and the app font is not set).
    // can't set an empty string either, as this is treated as a webfont (at the time of writing).
    // we don't want to ship a qrc font by default in the lib, as this increases the library size even if the user doesn't
    // want to use it.
    property string normalFamilyPath:    "qrc:/set/your/own/path"
    property string bodyFamilyPath:      "qrc:/set/your/own/path"
    property string italicFamilyPath:    "qrc:/set/your/own/path"
    property string monospaceFamilyPath: "qrc:/set/your/own/path"

    readonly property string normal: normalFamilyLoader.name
    readonly property string body: bodyFamilyLoader.name
    readonly property string italic: italicFamilyLoader.name
    readonly property string monospace: monospaceFamilyLoader.name

    FontLoader{ id: normalFamilyLoader; source: root.normalFamilyPath; }
    FontLoader{ id: bodyFamilyLoader; source: root.bodyFamilyPath;}
    FontLoader{ id: italicFamilyLoader; source: root.italicFamilyPath; }
    FontLoader{ id: monospaceFamilyLoader; source: root.monospaceFamilyPath; }
}
