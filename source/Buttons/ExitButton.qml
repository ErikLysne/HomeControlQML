import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: button

    property alias buttonSize: button.width

    readonly property real iconRadius: button.buttonSize * 0.5
    readonly property real iconSize: button.buttonSize * 0.5

    height: buttonSize

    style: ButtonStyle {
        background:  Item {
            // Icon window layer
            Canvas {
                id: iconWindow
                height: iconSize
                width: iconSize
                anchors.centerIn: parent

                onPaint: {
                    var context = getContext("2d");
                    context.reset();

                    context.beginPath();
                    context.lineWidth = height * 0.05;
                    context.roundedRect(context.lineWidth, context.lineWidth,
                                        button.iconSize - 2*context.lineWidth,
                                        button.iconSize - 2*context.lineWidth,
                                        button.iconRadius, button.iconRadius)

                    context.fillStyle = "rgb(30, 30, 30)";
                    context.fill();
                }
            }

            // Icon layer
            Image {
                fillMode: Image.PreserveAspectFit
                height: iconSize * 0.5
                width: iconSize * 0.5
                anchors.centerIn: parent
                source: "../icons/Exit.png"

                // Shine layer
                IconShine{
                }
            }
        }
        label: null
    }

}
