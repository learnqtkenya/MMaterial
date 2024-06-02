pragma Singleton

import QtQuick

import "./BaseObjects"
import "./Themes"

ThemeBase{
    property ThemeBase currentTheme: LightTheme

    function setTheme(theme: ThemeBase) : void {
        console.log("Theme switched to " + theme.objectName)
        currentTheme = theme;
    }

    primary: currentTheme?.primary ?? null
    secondary: currentTheme?.secondary ?? null
    info: currentTheme?.info ?? null
    success: currentTheme?.success ?? null
    warning: currentTheme?.warning ?? null
    error: currentTheme?.error ?? null
    main: currentTheme?.main ?? null
    social: currentTheme?.social ?? null
    background: currentTheme?.background ?? null
    other: currentTheme?.other ?? null
    text: currentTheme?.text ?? null
    action: currentTheme?.action ?? null
    common: currentTheme?.common ?? null
    defaultNeutral: currentTheme?.defaultNeutral ?? null
    passive: currentTheme?.passive ?? null
}
