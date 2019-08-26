import QtQuick 2.0

Rectangle {
    id: statusBar
    height: 30
    width: parent.width
    anchors.top: parent.top
    anchors.left: parent.left
    color: Qt.rgba(0, 0, 0.1, 1.0)

    property string timeString;
    property string dayString;

    function timeChanged() {
        var date = new Date;
        var weekdays =
                [
                    'Monday',
                    'Tuesday',
                    'Wednesday',
                    'Thursday',
                    'Friday',
                    'Saturday',
                    'Sunday'
                ];

        timeString = date.toLocaleTimeString();
        dayString = weekdays[date.getDay()];
    }

    // Display HomeControl
    Text {
        text: "Home Control v1.0"
        font.pixelSize: parent.height * 0.75
        anchors.top: parent.top
        anchors.left: parent.left
        color: "gray"
    }

    // Get time
    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: statusBar.timeChanged()
    }

    // Display time
    Text {
        text: timeString
        font.pixelSize: parent.height * 0.75
        anchors.top: parent.top
        anchors.right: parent.right
        color: "gray"
    }

    // Display day
    Text {
        text: dayString
        font.pixelSize: parent.height * 0.75
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "gray"
    }


}
