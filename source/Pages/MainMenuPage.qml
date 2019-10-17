import QtQuick 2.0
import QtQuick.Controls 2.2

import Buttons 1.0

Page {
    id: mainMenuPage
    background: null

    Grid {
        anchors.centerIn: parent
        rows: 2
        columns: 3

        MainMenuButton {
            buttonText: "HOME"
            buttonIcon: "../icons/Home.png"
            onClicked: mainMenuPage.StackView.view.push("qrc:/Pages/HomePage.qml")
        }
        MainMenuButton {
            buttonText: "LIGHTS"
            buttonIcon: "../icons/Light.png"
            onClicked: mainMenuPage.StackView.view.push("qrc:/Pages/LightsPage.qml")
        }
        MainMenuButton {buttonText: "ROUTINES"; buttonIcon: "../icons/Clock.png"}
        MainMenuButton {buttonText: "RULES";    buttonIcon: "../icons/Blocks.png"}
        MainMenuButton {buttonText: "ACTIVITY"; buttonIcon: "../icons/Chart.png"}
        MainMenuButton {buttonText: "SETTINGS"; buttonIcon: "../icons/Gear.png"}

    }

    // Exit button
    ExitButton {
        buttonSize: 100
        anchors.top: parent.top
        anchors.topMargin: 10

        onClicked: Qt.quit()
    }
}
