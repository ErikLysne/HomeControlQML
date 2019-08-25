import QtQuick 2.0

Rectangle {
    id: statusBar
    height: 30
    width: parent.width
    anchors.top: parent.top
    anchors.left: parent.left
    color: Qt.rgba(0, 0, 0.2, 1.0)

    property string timeString;

    function timeChanged() {
        var date = new Date;
        timeString = date.toLocaleTimeString();
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: statusBar.timeChanged()
    }

    Text {
        text: timeString
        font.pixelSize: parent.height * 0.75
        anchors.top: parent.top
        anchors.right: parent.right
        color: "white"
    }
}
