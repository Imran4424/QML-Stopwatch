import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: root

    hoverEnabled: false // to disable mouse hovering

    // Public knobs
    property string variant: "primary"    // "primary" | "secondary" | "danger" | "tonal" | "outline"
    property string size: "regular"       // "regular" | "large"

    // Resolve palette via safe ternaries
    readonly property string _bg: (variant === "primary")   ? "#4F46E5"
                               : (variant === "secondary") ? "#0EA5E9"
                               : (variant === "danger")    ? "#EF4444"
                               : (variant === "outline")   ? "transparent"
                               : "#F8FAFC"
    readonly property string _fg: (variant === "tonal" || variant === "outline") ? "#0F172A" : "#FFFFFF"
    readonly property int _radius: 12

    implicitHeight: size === "large" ? 44 : 40
    implicitWidth: Math.max(100, contentItem.implicitWidth + (size === "large" ? 28 : 24))

    // Centered label
    contentItem: Text {
        anchors.centerIn: parent
        text: root.text
        font.pixelSize: size === "large" ? 16 : 14
        font.bold: true
        color: _fg
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // Simple background (no Gradient — keeps parsers happy)
    background: Rectangle {
        radius: _radius
        color: root.enabled ? _bg : "#DE3163"
        border.width: variant === "outline" ? 1 : 0
        border.color: variant === "outline" ? "#CBD5E1" : "transparent"
    }

    // Press micro-interaction
    scale: root.down ? 0.98 : 1.0
    Behavior on scale { NumberAnimation { duration: 90 } }

    // Disabled look
    opacity: enabled ? 1.0 : 0.6
}
