set(MODULE_NAME MMaterial)
set(LIB_NAME ${MODULE_NAME}Lib)

qt_add_library(${LIB_NAME} STATIC)

set_target_properties(${LIB_NAME} PROPERTIES AUTOMOC ON)
target_link_libraries(${LIB_NAME} PRIVATE Qt6::Quick)

set(PNG_PATH Icons/assets/png)
set(SVG_PATH Icons/assets/svg)

list(APPEND MODULE_ASSETS
    # Fonts
    Fonts/Families/PublicSans/PublicSans-ExtraBold.ttf
    Fonts/Families/PublicSans/PublicSans-Bold.ttf
    Fonts/Families/PublicSans/PublicSans-SemiBold.ttf
    Fonts/Families/PublicSans/PublicSans-Medium.ttf
    Fonts/Families/PublicSans/PublicSans-Regular.ttf
    Fonts/Families/PublicSans/PublicSans-Light.ttf
    Fonts/Families/PublicSans/PublicSans-ExtraLight.ttf

    Icons/assets/icomoon.ttf

    # Icons
    ${SVG_PATH}/android.svg
    ${SVG_PATH}/mail.svg
    ${SVG_PATH}/arrow.svg
    ${SVG_PATH}/logo.svg
    ${SVG_PATH}/alternativeLogo.svg
    ${SVG_PATH}/alert.svg
    ${SVG_PATH}/info.svg
    ${SVG_PATH}/success.svg
    ${SVG_PATH}/closeX.svg
    ${SVG_PATH}/menu.svg
    ${SVG_PATH}/sun.svg
    ${SVG_PATH}/moon.svg
    ${SVG_PATH}/star.svg
    ${SVG_PATH}/avatar.svg
    ${SVG_PATH}/font.svg
    ${SVG_PATH}/palette.svg
    ${SVG_PATH}/verified.svg
    ${SVG_PATH}/checkmark.svg
    ${SVG_PATH}/list.svg
    ${SVG_PATH}/search.svg
    ${SVG_PATH}/send.svg
    ${SVG_PATH}/stonks.svg
    ${SVG_PATH}/call.svg
    ${SVG_PATH}/pages.svg
    ${SVG_PATH}/gamepad.svg
    ${SVG_PATH}/settings.svg
    ${SVG_PATH}/edit.svg
    ${SVG_PATH}/dashedCircle.svg
    ${SVG_PATH}/addPhoto.svg

    # Images
    ${PNG_PATH}/programmer-female.png
    ${PNG_PATH}/programmer-female2.png
    ${PNG_PATH}/programmer-male.png
    ${PNG_PATH}/programmer-male2.png
    ${PNG_PATH}/abstract_futuristic_3D_shape_1.jpeg
    ${PNG_PATH}/abstract_futuristic_3D_shape_2.jpeg
    ${PNG_PATH}/abstract_futuristic_3D_shape_3.jpeg
)

list(APPEND MODULE_QML_FILES
    # Fonts
    Fonts/PublicSans.qml
    Fonts/BaseFont.qml
    Fonts/Texts/H1.qml
    Fonts/Texts/H2.qml
    Fonts/Texts/H3.qml
    Fonts/Texts/H4.qml
    Fonts/Texts/H5.qml
    Fonts/Texts/H6.qml
    Fonts/Texts/Subtitle1.qml
    Fonts/Texts/Subtitle2.qml
    Fonts/Texts/B1.qml
    Fonts/Texts/B2.qml
    Fonts/Texts/Caption.qml
    Fonts/Texts/Overline.qml
    Fonts/Texts/BaseText.qml

    # Colors / Themes
    Colors/Theme.qml
    Colors/ThemeList.qml
    Colors/BaseObjects/PaletteTransparent.qml
    Colors/BaseObjects/PaletteCommon.qml
    Colors/BaseObjects/PaletteBackground.qml
    Colors/BaseObjects/PaletteText.qml
    Colors/BaseObjects/PaletteBasic.qml
    Colors/BaseObjects/PaletteGrey.qml
    Colors/BaseObjects/PaletteSocial.qml
    Colors/BaseObjects/PaletteOther.qml
    Colors/BaseObjects/PaletteAction.qml
    Colors/BaseObjects/ThemeBase.qml
    Colors/Themes/DarkTheme.qml
    Colors/Themes/LightTheme.qml
    Colors/BasicPalettes/BasicRed.qml
    Colors/BasicPalettes/BasicGreen.qml
    Colors/BasicPalettes/BasicPurple.qml
    Colors/BasicPalettes/BasicBlue.qml
    Colors/BasicPalettes/BasicOrange.qml
    Colors/BasicPalettes/BasicLightBlue.qml

    # Icons
    Icons/Icon.qml
    Icons/Icons.qml
    Icons/Images.qml
    Icons/LightIcon.qml
    Icons/IconFont.qml
    Icons/IconData.qml
    Icons/HeavyIcon.qml
    Icons/IconBase.qml

    # Components
    Components/Badge/BadgeNumber.qml
    Components/Badge/BadgeDot.qml
    Components/Badge/Badge.qml
    Components/Accordion.qml
    Components/Alerts/Alert.qml
    Components/Alerts/AlertController.qml
    Components/Avatar.qml
    Components/Pagination/Paginator.qml
    Components/Progress/MProgressBar.qml
    Components/Progress/MCircularProgressBar.qml
    Components/Inputs/MTextField.qml
    Components/Inputs/MDropdown.qml
    Components/Common/MScrollIndicator.qml
    Components/Common/MToolTip.qml
    Components/Common/MLoader.qml
    Components/Common/MSlider.qml
    Components/MRectangle.qml
    Components/MBorder.qml
    Components/CornerRadii.qml
    Components/Inputs/AvatarInput.qml
    Components/Common/MaskedImage.qml

    # Settings
    Settings/Size.qml

    # Buttons
    Buttons/MButton.qml
    Buttons/MToggleButton.qml
    Buttons/MFabButton.qml
    Buttons/MCheckbox.qml
    Buttons/CheckedGroup.qml
    Buttons/Checkable.qml
    Buttons/MRadioButton.qml
    Buttons/MSwitch.qml
    Buttons/MTabButton.qml
    Buttons/MTabs.qml

    # Sidebar
    Sidebar/Sidebar.qml
    Sidebar/SidebarCategoryLabel.qml
    Sidebar/SidebarExtendedItem.qml
    Sidebar/CompactSidebar.qml
    Sidebar/SidebarCompactItem.qml
    Sidebar/SidebarSeparator.qml
    Sidebar/ExtendedSidebar.qml
    Sidebar/SidebarItem.qml
    Sidebar/SidebarData.qml

    # Lists
    Lists/ListItem.qml
    Lists/ListItemContact.qml
    Lists/AbstractListItem.qml

    # Pagination
    Components/Pagination/PaginatorSimple.qml
    Components/Pagination/PaginatorBubble.qml
    Components/Pagination/PaginatorArrows.qml

    # Animations
    Animations/EasedAnimation.qml
    Animations/ElasticAnimation.qml

    # Menu
    Components/Menu/Menu.qml
    Components/Menu/MenuItem.qml
    Components/Menu/MenuSeparator.qml

    # Dialogs
    Components/Dialogs/Dialog.qml
    Components/Dialogs/DialogButtonBox.qml
    Components/Dialogs/LargeImageDialog.qml
    Components/Dialogs/MediumImageDialog.qml
    Components/Dialogs/InputDialog.qml
)

set_source_files_properties(
    Colors/Theme.qml
    Colors/Themes/DarkTheme.qml
    Colors/Themes/LightTheme.qml
    Colors/ThemeList.qml
    Colors/BasicPalettes/BasicRed.qml
    Colors/BasicPalettes/BasicGreen.qml
    Colors/BasicPalettes/BasicPurple.qml
    Colors/BasicPalettes/BasicBlue.qml
    Colors/BasicPalettes/BasicOrange.qml
    Colors/BasicPalettes/BasicLightBlue.qml

    Icons/IconFont.qml
    Fonts/PublicSans.qml
    Icons/Icons.qml
    Icons/Images.qml
    Settings/Size.qml
    Sidebar/SidebarData.qml

    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(${LIB_NAME}
    URI ${MODULE_NAME}
    VERSION 1.0
    QML_FILES ${MODULE_QML_FILES}
    RESOURCES ${MODULE_ASSETS}
    OUTPUT_DIRECTORY
    "${CMAKE_BINARY_DIR}/${MODULE_NAME}"
)
