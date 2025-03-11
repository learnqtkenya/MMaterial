import QtQuick
import MMaterial.UI as UI

Canvas {
    id: dashedLine

    property int lineWidth: 1
    property color lineColor: UI.Theme.other.divider
    property var dashPattern: [2, 2]
    property bool horizontal: true

    height: horizontal ? lineWidth : undefined
    width: horizontal ? undefined : lineWidth

    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = lineWidth;
        ctx.strokeStyle = lineColor;
        ctx.setLineDash(dashPattern);
        ctx.beginPath();

        if (horizontal) {
            ctx.moveTo(0, 0);
            ctx.lineTo(width, 0);
        } else {
            ctx.moveTo(0, 0);
            ctx.lineTo(0, height);
        }

        ctx.stroke();
    }
}
