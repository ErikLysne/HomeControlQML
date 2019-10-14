import QtQuick 2.0

Canvas {
    id: shine
    height: button.height * 0.5
    width: button.width * 0.5
    anchors.centerIn: parent

    property var icon

    onPaint: {
        var context = getContext("2d");
        context.reset();

        context.beginPath();
        context.lineWidth = height * 0.05;
        context.roundedRect(context.lineWidth, context.lineWidth,
                            button.iconSize - 2*context.lineWidth,
                            button.iconSize - 2*context.lineWidth,
                            button.iconRadius, button.iconRadius)

        context.moveTo(0, height * 0.4);
        context.bezierCurveTo(width * 0.25, height * 0.6, width * 0.75, height * 0.6, width, height * 0.4);
        context.lineTo(width, height);
        context.lineTo(0, height);
        context.lineTo(0, height * 0.4);
        context.clip();

        context.beginPath();
        context.roundedRect(context.lineWidth, context.lineWidth,
                            button.iconSize - 2*context.lineWidth,
                            button.iconSize - 2*context.lineWidth,
                            button.iconRadius, button.iconRadius);

        var gradient = context.createLinearGradient(0, 0, 0, height);
        gradient.addColorStop(0, "rgba(255, 255, 255, 0.5)");
        gradient.addColorStop(0.6, "rgba(255, 255, 255, 0)");
        context.fillStyle = gradient;
        context.fill();
    }

    opacity: !button.pressed ? 1 : 0.75
}
