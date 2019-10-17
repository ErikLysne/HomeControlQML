import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    property variant coordinates
    property variant paintRules
    property real roomHeight
    property real roomWidth
    property real roomXShift
    property real roomYShift
    property real scaleFactor
    property real roomLineWidth
    property real outlineLineWidth

    id: room
    height: roomHeight * scaleFactor + outlineLineWidth
    width: roomWidth * scaleFactor + outlineLineWidth
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: roomXShift * scaleFactor
    anchors.topMargin: roomYShift * scaleFactor

    style: ButtonStyle {
        background: Canvas {
            id: roomStyle
            height: parent.height
            width: parent.width
            anchors.top: parent.top
            anchors.left: parent.left

            property bool fillRoom: control.pressed ? true : false
            onFillRoomChanged: requestPaint()


            onPaint: {
                console.assert(room.coordinates.length === room.paintRules.length,
                               "Number of paint rules must match number of coordinates");

                var offsetX = room.outlineLineWidth * 0.5;
                var offsetY = room.outlineLineWidth * 0.5;

                var context = getContext("2d");
                context.reset();

                // Room fill
                context.beginPath();
                for (var j = 0; j < room.coordinates.length; j++) {
                    console.assert(room.coordinates[j].length === 2,
                                   "Coordinates must contain exactly two values");
                    const x = room.coordinates[j][0] * room.scaleFactor + offsetX;
                    const y = room.coordinates[j][1] * room.scaleFactor + offsetY;
                    context.lineTo(x, y);
                }
                context.lineTo(offsetX, offsetY);

                context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
                context.fill();

                // Highlight selected room
                if (roomStyle.fillRoom) {
                    var midX = room.width * 0.5;
                    var midY = room.height * 0.5;
                    var radius = room.width > room.height ? room.width : room.height;

                    var gradient = context.createRadialGradient(midX, midY, 0, midX, midY, radius);
                    gradient.addColorStop(0.0, Qt.rgba(1.0, 1.0, 1.0, 1.0));
                    gradient.addColorStop(0.65, Qt.rgba(1.0, 1.0, 1.0, 0.0));
                    context.fillStyle = gradient;
                    context.fill();
                }

                context.lineWidth = room.roomLineWidth * 0.1;
                context.strokeStyle = Qt.rgba(1.0, 1.0, 1.0, 0.5);
                context.stroke();

                // Room outline
                context.beginPath();
                context.moveTo(offsetX, offsetY);
                for (var i = 0; i < room.coordinates.length; i++) {
                    const x = room.coordinates[i][0] * room.scaleFactor + offsetX;
                    const y = room.coordinates[i][1] * room.scaleFactor + offsetY;

                    if (room.paintRules[i] === 1)
                        context.lineTo(x, y);
                    else
                        context.moveTo(x, y);
                }
                context.lineTo(offsetX, offsetY);
                context.lineWidth = room.roomLineWidth;
                context.strokeStyle = Qt.rgba(1.0, 1.0, 1.0, 0.25);
                context.stroke();

                context.lineWidth = room.roomLineWidth * 0.33;
                context.strokeStyle = Qt.rgba(0.18, 0.23, 0.32, 1.0);
                context.stroke();
            }
        }
    }
}
