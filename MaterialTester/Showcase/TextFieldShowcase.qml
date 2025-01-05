pragma ComponentBehavior: Bound

import QtQuick

import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs

Item {
    objectName: "Textfield"

    ListView {
        id: listView

        anchors.fill: parent

        spacing: 80 * UI.Size.scale
        clip: true

        model: [
			{ "type": Inputs.MTextField.Type.Outlined, "name" : "Outlined" },
			{ "type": Inputs.MTextField.Type.Filled, "name" : "Filled" },
			{ "type": Inputs.MTextField.Type.Standard, "name" : "Standard" }
        ]

        delegate: Item {
			id: del

			required property int index

            width: listView.width
            height: buttonGroup.height

            TextFieldGroup {
                id: buttonGroup

                width: 1000

				type: listView.model[del.index].type
				title: listView.model[del.index].name
            }
        }
    }
}