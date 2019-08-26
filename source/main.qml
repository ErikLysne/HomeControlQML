import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 1080
    height: 720
    title: qsTr("Home Control")

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, parent.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 1.0) }
            GradientStop { position: 1.0; color: Qt.rgba(0.1, 0.1, 0.25, 1.0) }
        }
    }

    Canvas {
        anchors.fill: parent

        onPaint: {
            var cont = getContext("2d");
            cont.reset();

            cont.beginPath();
            cont.lineWidth = 1.0;

            cont.lineTo(width, 0);
            cont.lineTo(0, height);
            cont.lineTo(0, 0);

            cont.fillStyle = "rgba(255, 255, 255, 0.02)";
            cont.fill();
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MainMenuPage {}

    }

    TopStatusBar {}
}
