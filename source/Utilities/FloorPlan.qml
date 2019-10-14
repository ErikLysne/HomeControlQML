import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Canvas {
    id: floorPlan
    height: parent.height
    width: parent.width
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: width * 0.5 - (815 * scaleFactor * 0.5)
    anchors.topMargin: height * 0.5 - (400 * scaleFactor * 0.5)

    property real scaleFactor
    property real outlineLineWidth
    property real roomLineWidth

    // Bedroom
    Button {
        id: bedroom
        height: 235 * scaleFactor + outlineLineWidth
        width: 315 * scaleFactor + outlineLineWidth
        anchors.top: parent.top
        anchors.left: parent.left

        style: ButtonStyle {
            background: Canvas {
                id: bedroomStyle
                height: parent.height
                width: parent.width
                anchors.top: parent.top
                anchors.left: parent.left

                property color fillColor: bedroom.pressed ? Qt.rgba(1.0, 1.0, 1.0, 0.6) : Qt.rgba(1.0, 1.0, 1.0, 0.0);
                onFillColorChanged: requestPaint()

                onPaint: {
                    var context = getContext("2d");
                    context.reset();

                    var coordinates = [
                        [[0,    0],     1],
                        [[0,    235],   1],
                        [[225,  235],   1],
                        [[300,  235],   0],
                        [[315,  235],   1],
                        [[315,  0],     1]
                    ];

                    context.lineWidth = floorPlan.roomLineWidth;
                    context.beginPath();
                    for (var i = 0; i < coordinates.length; i++) {
                        const x = coordinates[i][0][0] * floorPlan.scaleFactor + floorPlan.outlineLineWidth;
                        const y = coordinates[i][0][1] * floorPlan.scaleFactor + floorPlan.outlineLineWidth;

                        if (coordinates[i][1] === 1)
                            context.lineTo(x, y);
                        else
                            context.moveTo(x, y);
                    }
                    context.lineTo(floorPlan.outlineLineWidth, floorPlan.outlineLineWidth);

                    context.strokeStyle = Qt.rgba(0.0, 0.0, 0.0, 0.75);
                    context.stroke();

                    context.lineWidth = floorPlan.roomLineWidth * 0.5;
                    context.beginPath();
                    for (var j = 0; j < coordinates.length; j++) {
                        const x = coordinates[j][0][0] * floorPlan.scaleFactor + floorPlan.outlineLineWidth;
                        const y = coordinates[j][0][1] * floorPlan.scaleFactor + floorPlan.outlineLineWidth;
                        context.lineTo(x, y);
                    }
                    context.lineTo(floorPlan.outlineLineWidth, floorPlan.outlineLineWidth);

                    context.fillStyle = bedroomStyle.fillColor;
                    context.fill();

                    context.strokeStyle = Qt.rgba(0.0, 0.0, 0.0, 0.5);
                    context.stroke();

                    console.log(bedroomStyle.fillColor);
                }
            }
        }
    }

    // Outline
    onPaint: {
        var context = getContext("2d");
        context.reset();

        var coordinates = [
            [0,     0],
            [815,   0],
            [815,   400],
            [135,   400],
            [135,   235],
            [0,     235],
        ];

        context.lineWidth = outlineLineWidth;
        context.beginPath();
        for (var i = 0; i < coordinates.length; i++) {
            const x = scaleFactor*coordinates[i][0] + context.lineWidth;
            const y = scaleFactor*coordinates[i][1] + context.lineWidth;
            context.lineTo(x, y);
        }
        context.lineTo(context.lineWidth, context.lineWidth);

        context.strokeStyle = Qt.rgba(0.0, 0.0, 0.0, 1);
        context.stroke();
    }
}
