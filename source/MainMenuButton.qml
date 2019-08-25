import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: button
    width: 200
    height : width

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
                    var cont = getContext("2d");
                    cont.reset();

                    cont.beginPath();
                    cont.lineWidth = height * 0.05;
                    cont.roundedRect(cont.lineWidth  * 0.5, cont.lineWidth * 0.5,
                                     width - cont.lineWidth, height - cont.lineWidth,
                                     button.buttonRadius, button.buttonRadius);

                    var gradient = cont.createLinearGradient(0, 0, 0, height);
                    gradient.addColorStop(0, "rgb(30, 30, 35)");
                    gradient.addColorStop(0.6, "rgb(45, 45, 60)");
                    cont.fillStyle = gradient;
                    cont.fill();
                }
            }

            // Icon window layer
            Canvas {
                id: iconWindow
                height: button.iconSize
                width: button.iconSize
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -button.height * 0.10

                onPaint: {
                    var cont = getContext("2d");
                    cont.reset();

                    cont.beginPath();
                    cont.lineWidth = height * 0.05;
                    cont.roundedRect(cont.lineWidth, cont.lineWidth,
                                     button.iconSize - 2*cont.lineWidth,
                                     button.iconSize - 2*cont.lineWidth,
                                     button.iconRadius, button.iconRadius)

                    cont.strokeStyle = "rgba(0, 0, 0, 0.25)";
                    cont.stroke();

                    cont.fillStyle = "rgba(0, 0, 0, 0.5)";
                    cont.fill();
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
            }

            // Text layer
            Label {
                text: button.text
                font.pixelSize: button.height * 0.10
                anchors.centerIn: parent
                anchors.verticalCenterOffset: button.height * 0.25

                color: button.hovered && !button.pressed ? "white" : "#ddd";
            }

            // Shine layer
            Canvas {
                height: button.iconSize
                width: button.iconSize
                anchors.centerIn: iconWindow
                onPaint: {
                    var cont = getContext("2d");
                    cont.reset();

                    cont.beginPath();
                    cont.lineWidth = height * 0.05;
                    cont.roundedRect(cont.lineWidth, cont.lineWidth,
                                     button.iconSize - 2*cont.lineWidth,
                                     button.iconSize - 2*cont.lineWidth,
                                     button.iconRadius, button.iconRadius)


                    cont.moveTo(0, height * 0.4);
                    cont.bezierCurveTo(width * 0.25, height * 0.6, width * 0.75, height * 0.6, width, height * 0.4);
                    cont.lineTo(width, height);
                    cont.lineTo(0, height);
                    cont.lineTo(0, height * 0.4);
                    cont.clip();

                    cont.beginPath();
                    cont.roundedRect(cont.lineWidth, cont.lineWidth,
                                     button.iconSize - 2*cont.lineWidth,
                                     button.iconSize - 2*cont.lineWidth,
                                     button.iconRadius, button.iconRadius);

                    var gradient = cont.createLinearGradient(0, 0, 0, height);
                    gradient.addColorStop(0, "rgba(255, 255, 255, 0.5)");
                    gradient.addColorStop(0.6, "rgba(255, 255, 255, 0)");
                    cont.fillStyle = gradient;
                    cont.fill();
                }

                opacity: !button.pressed ? 1 : 0.75
            }
        }
        label: null
    }
}
