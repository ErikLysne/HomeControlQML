import QtQuick 2.0
import QtQuick.Controls 2.2

import Utilities 1.0
import Buttons 1.0

Page {
    id: root
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
                                root.boxRadius, root.boxRadius);

            context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
            context.fill();
        }

        // Floor plan
        FloorPlan {
            scaleFactor: 0.75
            outlineLineWidth: 15.0
            roomLineWidth: 8.0
        }
    }

    // Light box
    Canvas {
        id: lightBox
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
                                root.boxRadius, root.boxRadius);

            context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
            context.fill();
        }

        function updateColorPreview() {
            colorPreview.requestPaint();
        }

        Grid {
            id: sliderGrid
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 30
            anchors.leftMargin: 30
            rows: 6
            columns: 1

            Label {
                text: "Brightness"
                color: "white"
            }

            Slider {
                id: brightnessSlider
                width: lightBox.width * 0.5
                from: 1
                to: 100
                value: 50

                onValueChanged: lightBox.updateColorPreview()
            }

            Label {
                text: "Hue"
                color: "white"
            }

            Slider {
                id: hueSlider
                width: lightBox.width * 0.5
                from: 1
                to: 100
                value: 50

                onValueChanged: lightBox.updateColorPreview()
            }

            Label {
                text: "Saturation"
                color: "white"
            }

            Slider {
                id: saturationSlider
                width: lightBox.width * 0.5
                from: 1
                to: 100
                value: 50

                onValueChanged: lightBox.updateColorPreview()
            }
        }

        Canvas {
            id: colorPreview
            anchors.top: parent.top
            anchors.left: sliderGrid.right
            anchors.topMargin: (parent.height - height) * 0.5 + 15
            anchors.leftMargin: 10
            height: parent.height * 0.65
            width: height * 0.5

            onPaint: {
                var context = getContext("2d");
                context.reset();
                context.beginPath();
                context.lineWidth = 2.0;
                context.roundedRect(context.lineWidth * 0.5, context.lineWidth * 0.5,
                                    width - context.lineWidth, height - context.lineWidth,
                                    root.boxRadius, root.boxRadius);
                const hue = hueSlider.value / (hueSlider.to - hueSlider.from);
                const saturation = saturationSlider.value / (saturationSlider.to - saturationSlider.from);
                const brightness = brightnessSlider.value / (brightnessSlider.to - brightnessSlider.from);
                context.fillStyle = Qt.hsva(hue, saturation, brightness, 1.0);
                context.fill();
                context.strokeStyle = Qt.rgba(1.0, 1.0, 1.0, 0.5);
                context.stroke();
            }
        }
    }

    // Modes box
    Canvas {
        id: modesBox
        height: lightMapBox.height + lightBox.anchors.topMargin + lightBox.height
        width: parent.width - lightMapBox.width - anchors.leftMargin - lightMapBox.anchors.leftMargin * 2
        anchors.top: lightMapBox.top
        anchors.left: lightMapBox.right
        anchors.leftMargin: lightBox.anchors.topMargin

        onPaint: {
            var context = getContext("2d");
            context.reset();
            context.beginPath();
            context.lineWidth = 1;
            context.roundedRect(context.lineWidth  * 0.5, context.lineWidth * 0.5,
                                width - context.lineWidth, height - context.lineWidth,
                                root.boxRadius, root.boxRadius);
            context.fillStyle = Qt.rgba(1.0, 1.0, 1.0, 0.1);
            context.fill();
        }
    }

    // Back Button
    BackButton {
        buttonSize: 75
        anchors.top: parent.top
        anchors.topMargin: 10

        onClicked: root.StackView.view.pop()
    }
}
