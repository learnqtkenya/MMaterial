pragma Singleton

import QtQuick

Item {
    id: root
    // can't set a webfont path as there is a race in qt (request sent, then the user might set a font,
    // request comes back. when offline, an error is reported and the user font is not set).
    // can't set an empty string either, as this is treated as a webfont (at the time of writing).
    property string normalFamilyPath:    "qrc:/qt/qml/MMaterial/UI/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf"
    property string bodyFamilyPath:      "qrc:/qt/qml/MMaterial/UI/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf"
    property string italicFamilyPath:    "qrc:/qt/qml/MMaterial/UI/fonts/Public_Sans/PublicSans-Italic-VariableFont_wght.ttf"
    property string monospaceFamilyPath: "qrc:/qt/qml/MMaterial/UI/fonts/Roboto_Mono/RobotoMono-VariableFont_wght.ttf"

    readonly property string normalFamily: normalFamilyLoader.name
    readonly property string bodyFamily: bodyFamilyLoader.name
    readonly property string italicFamily: italicFamilyLoader.name
    readonly property string monospaceFamily: monospaceFamilyLoader.name

    FontLoader{ id: normalFamilyLoader; source: root.normalFamilyPath; }
    FontLoader{ id: bodyFamilyLoader; source: root.bodyFamilyPath;}
    FontLoader{ id: italicFamilyLoader; source: root.italicFamilyPath; }
    FontLoader{ id: monospaceFamilyLoader; source: root.monospaceFamilyPath; }
}
