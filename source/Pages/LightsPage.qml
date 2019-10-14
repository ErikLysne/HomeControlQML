import QtQuick 2.0
import QtQuick.Controls 2.2

import Utilities 1.0
import Buttons 1.0

Page {
    id: lightsPage
    background: null
    readonly property real boxRadius: 15

    // Light map box
    Canvas {
        id: lightMapBox
        height: parent.height * 0.5
        width: parent.width * 0.65
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.10
        anchors.leftMargin: parent.width * 0.05


        onPaint: {
            var context = getContext("2d");
            context.reset();

            context.beginPath();
            context.lineWidth = 1.0;
            context.roundedRect(context.lineWidth  * 0.5, context.lineWidth * 0.5,
                                width - context.lineWidth, height - context.lineWidth,
                                lightsPage.boxRadius, lightsPage.boxRadius);

            context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
            context.fill();
        }

        // Floor plan
        FloorPlan {
            scaleFactor: 0.75
            outlineLineWidth: 10.0
            roomLineWidth: 8.0
        }
    }

    // Slider box
    Canvas {
        id: sliderBox
        height: parent.height * 0.3
        width: lightMapBox.width
        anchors.top: lightMapBox.bottom
        anchors.left: lightMapBox.left
        anchors.topMargin: parent.height * 0.01

        onPaint: {
            var context = getContext("2d");
            context.reset();

            context.beginPath();
            context.lineWidth = 1;
            context.roundedRect(context.lineWidth  * 0.5, context.lineWidth * 0.5,
                                width - context.lineWidth, height - context.lineWidth,
                                lightsPage.boxRadius, lightsPage.boxRadius);

            context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
            context.fill();
        }
    }

    // Modes box
    Canvas {
        id: modesBox
        height: lightMapBox.height + sliderBox.anchors.topMargin + sliderBox.height
        width: parent.width - lightMapBox.width - anchors.leftMargin - lightMapBox.anchors.leftMargin * 2
        anchors.top: lightMapBox.top
        anchors.left: lightMapBox.right
        anchors.leftMargin: sliderBox.anchors.topMargin

        onPaint: {
            var context = getContext("2d");
            context.reset();

            context.beginPath();
            context.lineWidth = 1;
            context.roundedRect(context.lineWidth  * 0.5, context.lineWidth * 0.5,
                                width - context.lineWidth, height - context.lineWidth,
                                lightsPage.boxRadius, lightsPage.boxRadius);

            context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
            context.fill();
        }
    }

    // Back Button
    BackButton {
        buttonSize: 75
        anchors.top: parent.top
        anchors.topMargin: 10

        onClicked: lightsPage.StackView.view.pop()
    }
}
