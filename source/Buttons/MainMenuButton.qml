import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: button
    width: 200
    height: width

    property alias buttonIcon: button.iconSource
    property alias buttonText: button.text

    readonly property real buttonRadius: 15
    readonly property real iconRadius: height * 0.5
    readonly property real iconSize: height * 0.5

    onClicked: {
        console.log(buttonText);
    }

    style: ButtonStyle {
        background:  Item {

            // Main button layer
            Canvas {
                anchors.fill: parent

                onPaint: {
                    var context = getContext("2d");
                    context.reset();

                    context.beginPath();
                    context.lineWidth = height * 0.05;
                    context.roundedRect(context.lineWidth  * 0.5, context.lineWidth * 0.5,
                                        width - context.lineWidth, height - context.lineWidth,
                                        button.buttonRadius, button.buttonRadius);

                    var gradient = context.createLinearGradient(0, 0, 0, height);
                    gradient.addColorStop(0, Qt.rgba(0.12, 0.12, 0.14, 1.0));
                    gradient.addColorStop(0.6, Qt.rgba(0.18, 0.18, 0.24, 1.0));
                    context.fillStyle = gradient;
                    context.fill();
                }
            }

            // Icon window layer
            Canvas {
                id: iconWindow
                height: button.iconSize
                width: button.iconSize
                anchors.centerIn: parent
                anchors.verticalCenterOffset: button.height * -0.10

                onPaint: {
                    var context = getContext("2d");
                    context.reset();

                    context.beginPath();
                    context.lineWidth = height * 0.05;
                    context.roundedRect(context.lineWidth, context.lineWidth,
                                        button.iconSize - 2*context.lineWidth,
                                        button.iconSize - 2*context.lineWidth,
                                        button.iconRadius, button.iconRadius)

                    context.strokeStyle = Qt.rgba(0, 0, 0, 0.25);
                    context.stroke();

                    context.fillStyle = Qt.rgba(0, 0, 0, 0.5);
                    context.fill();
                }
            }

            // Icon layer
            Image {
                fillMode: Image.PreserveAspectFit
                height: button.iconSize * 0.5
                width: button.iconSize * 0.5
                anchors.centerIn: iconWindow
                sourceSize.height: iconWindow * 0.5
                source: button.iconSource

                // Shine layer
                IconShine {
                }
            }

            // Text layer
            Label {
                text: button.text
                font.pixelSize: button.height * 0.10
                anchors.centerIn: parent
                anchors.verticalCenterOffset: button.height * 0.25

                color: button.hovered && !button.pressed ? "white" : "#ddd"
            }

        }
        label: null
    }
}
