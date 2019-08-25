import QtQuick 2.9
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Home Control")

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, parent.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 1.0) }
            GradientStop { position: 1.0; color: Qt.rgba(0.1, 0.1, 0.15, 1.0) }
        }
    }

    TopStatusBar {}

    Grid {
        id: buttonGrid
        anchors.centerIn: parent
        rows: 3
        columns: 2

        MainMenuButton {buttonText: "HOME"; buttonIcon: "icons/Home.png"}
        MainMenuButton {buttonText: "LIGHTS"; buttonIcon: "icons/Light.png"}
        MainMenuButton {buttonText: "ROUTINES"; buttonIcon: "icons/Clock.png"}
        MainMenuButton {buttonText: "SETTINGS"; buttonIcon: "icons/Gear.png"}

    }
}
