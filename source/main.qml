import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import Utilities 1.0
import Pages 1.0

Window {
    visible: true
    width: 1080
    height: 720
    //visibility: "FullScreen"
    title: qsTr("Home Control")

    // Background
    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, parent.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.0, 0.0, 0.0, 1.0) }
            GradientStop { position: 1.0; color: Qt.rgba(0.18, 0.23, 0.32, 1.0) }
        }
    }


    // Triangle
    Canvas {
        anchors.fill: parent

        onPaint: {
            var context = getContext("2d");
            context.reset();

            context.beginPath();
            context.lineWidth = 1.0;

            context.lineTo(width, 0);
            context.lineTo(0, height);
            context.lineTo(0, 0);

            context.fillStyle = "rgba(255, 255, 255, 0.02)";
            context.fill();
        }
    }

    // Stack
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MainMenuPage {}

        pushEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }
            pushExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 200
                }
            }
            popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 200
                }
            }
            popExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 200
                }
            }
    }

    TopStatusBar {}
}
