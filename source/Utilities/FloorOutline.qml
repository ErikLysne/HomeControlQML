import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Canvas {
    property real scaleFactor
    property real outlineLineWidth

    id: floorOutline
    height: parent.height
    width: parent.width
    anchors.top: parent.top
    anchors.left: parent.left

    onPaint: {
        var context = getContext("2d");
        context.reset();

        var coordinates = [
            [0, 50],
            [0, 150],
            [0, 235],
            [130, 235],
            [130, 250],
            [130, 325],
            [130, 400],
            [815, 400],
            [815, 215],
            [815, 135],
            [815, 0]
        ];

        var paintRules = [
            1,
            0,
            1,
            1,
            1,
            0,
            1,
            1,
            1,
            0,
            1,
            1
        ];

        var offsetX = floorOutline.outlineLineWidth * 0.5;
        var offsetY = floorOutline.outlineLineWidth * 0.5;

        // transparent outline
        context.beginPath();
        context.moveTo(offsetX, offsetY);
        for (var i = 0; i < coordinates.length; i++) {
            const x = coordinates[i][0] * floorOutline.scaleFactor + offsetX;
            const y = coordinates[i][1] * floorOutline.scaleFactor + offsetY;
            if (paintRules[i] === 1)
                context.lineTo(x, y);
            else
                context.moveTo(x, y);
        }
        context.lineTo(0, 0);

        context.lineWidth = floorOutline.outlineLineWidth;
        context.strokeStyle = Qt.rgba(1.0, 1.0, 1.0, 0.25);
        context.stroke();

        // opaque outline
        context.lineWidth = floorOutline.outlineLineWidth;
        context.beginPath();
        context.moveTo(offsetX, offsetY);
        for (var j = 0; j < coordinates.length; j++) {
            const x = coordinates[j][0] * floorOutline.scaleFactor + offsetX;
            const y = coordinates[j][1] * floorOutline.scaleFactor + offsetY;
            if (paintRules[j] === 1)
                context.lineTo(x, y);
            else
                context.moveTo(x, y);
        }
        context.lineTo(offsetX, offsetY);
        context.lineWidth = floorOutline.outlineLineWidth * 0.33;
        context.strokeStyle = Qt.rgba(0.18, 0.23, 0.32, 1.0);
        context.stroke();
    }
}
