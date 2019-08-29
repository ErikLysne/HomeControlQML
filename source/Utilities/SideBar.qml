import QtQuick 2.0
import QtQuick.Controls 2.2

import Buttons 1.0

Rectangle {
    id: sideBar
    width: 75
    height: parent.height
    anchors.top: parent.top
    anchors.left: parent.left
    color: Qt.rgba(0, 0, 0.1, 1.0)

    property var currentPage
    property string currentPageName


    Grid {
        anchors.centerIn: parent
        rows: 7
        columns: 1

        // Back button
        SideBarButton {
            buttonIcon: "../icons/Back.png"
            onClicked: currentPage.StackView.view.pop()
        }

        // Home page button
        SideBarButton {
            buttonIcon: "../icons/Home.png"
            onClicked: currentPage.StackView.view.push("qrc:/HomePage.qml")
            visible: sideBar.currentPageName !== "homepage"
        }

        // Lights page button
        SideBarButton {
            buttonIcon: "../icons/Light.png"
            onClicked: currentPage.StackView.view.push("qrc:/LightsView.qml")
            visible: sideBar.currentPageName !== "lightspage"
        }

        // Routines page button
        SideBarButton {
            buttonIcon: "../icons/Clock.png"
            visible: sideBar.currentPageName !== "routinespage"
        }

        // Rules page button
        SideBarButton {
            buttonIcon: "../icons/Blocks.png"
            visible: sideBar.currentPageName !== "rulespage"
        }

        // Activity page button
        SideBarButton {
            buttonIcon: "../icons/Chart.png"
            visible: sideBar.currentPageName !== "activitypage"
        }

        // Settings page button
        SideBarButton {
            buttonIcon: "../icons/Gear.png"
            visible: sideBar.currentPageName !== "settingspage"
        }
    }

}
