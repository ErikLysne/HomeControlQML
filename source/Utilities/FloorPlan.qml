import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    property real scaleFactor
    property real outlineLineWidth
    property real roomLineWidth

    id: floorPlan
    height: parent.height
    width: parent.width
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: width * 0.5 - (815 * scaleFactor * 0.5)
    anchors.topMargin: height * 0.5 - (400 * scaleFactor * 0.5)

    // Bedroom
    Room {
        id: bedroom
        coordinates:
        [
            [0,     50],
            [0,     150],
            [0,     235],
            [225,   235],
            [300,   235],
            [315,   235],
            [315,   0]
        ]

        paintRules:
        [
            1,
            0,
            1,
            1,
            0,
            1,
            1
        ]

        roomHeight: 235
        roomWidth: 315
        roomXShift: 0
        roomYShift: 0
        scaleFactor: floorPlan.scaleFactor
        roomLineWidth: floorPlan.roomLineWidth
        outlineLineWidth: floorPlan.outlineLineWidth

        Image {
            id: bedroomIcon
            anchors.centerIn: parent
            source: "../icons/Rooms/roomsBedroom.svg"
        }
    }

    // Hallway
    Room {
        id: hallway
        coordinates:
        [
            [0,     15],
            [0,     90],
            [0,     165],
            [295,   165],
            [295,   80],
            [295,   15],
            [295,   0],
            [280,   0],
            [200,   0],
            [170,   0],
            [95,    0]
        ]

        paintRules:
        [
            1,
            0,
            1,
            1,
            1,
            0,
            1,
            1,
            0,
            1,
            0,
        ]

        roomHeight: 170
        roomWidth: 295
        roomXShift: 130
        roomYShift: 235
        scaleFactor: floorPlan.scaleFactor
        roomLineWidth: floorPlan.roomLineWidth
        outlineLineWidth: floorPlan.outlineLineWidth

        Image {
            id: hallwayIcon
            anchors.centerIn: parent
            source: "../icons/Rooms/roomsFrontdoor.svg"
        }
    }

    // Living room
    Room {
        id: livingRoom
        coordinates:
        [
            [40,    0],
            [40,    235],
            [0,     235],
            [0,     250],
            [0,     315],
            [0,     400],
            [390,   400],
            [390,   215],
            [390,   135],
            [390,   0],
            [40,    0],
            [40,    235],
            [125,   235],
            [40,    235],
            [40,    0],
        ]

        paintRules:
        [
            0,
            0,
            0,
            1,
            0,
            1,
            1,
            1,
            0,
            1,
            1,
            1,
            1,
            0,
            0
        ]

        roomHeight: 400
        roomWidth: 390
        roomXShift: 425
        roomYShift: 0
        scaleFactor: floorPlan.scaleFactor
        roomLineWidth: floorPlan.roomLineWidth
        outlineLineWidth: floorPlan.outlineLineWidth

        Image {
            id: livingRoomIcon
            anchors.centerIn: parent
            source: "../icons/Rooms/roomsLiving.svg"
        }
    }

    // Bathroom
    Room {
        id: bathroom
        coordinates:
        [
            [0,     235],
            [15,    235],
            [95,    235],
            [150,   235],
            [150,   0]
        ]

        paintRules:
        [
            1,
            1,
            0,
            1,
            1
        ]

        roomHeight: 235
        roomWidth: 150
        roomXShift: 315
        roomYShift: 0
        scaleFactor: floorPlan.scaleFactor
        roomLineWidth: floorPlan.roomLineWidth
        outlineLineWidth: floorPlan.outlineLineWidth

        Image {
            id: bathroomIcon
            anchors.centerIn: parent
            source: "../icons/Rooms/roomsBathroom.svg"
        }
    }

    // Outline
    FloorOutline {
        scaleFactor: floorPlan.scaleFactor
        outlineLineWidth: floorPlan.outlineLineWidth
    }

}
