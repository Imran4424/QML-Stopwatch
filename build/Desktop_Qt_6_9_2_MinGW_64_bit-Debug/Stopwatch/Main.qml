import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// ApplicationWindow is always preferred over window
ApplicationWindow {
    // each element should have unique id
    id: rootWindow
    minimumWidth: 360
    minimumHeight: 560
    visible: true
    title: "Stopwatch"

    property int elapsedMiliSeconds: 0
    property bool isRunning: false

    Timer {
        // each element should have unique id
        id: tick
        interval: 10
        repeat: true
        running: rootWindow.isRunning
        onTriggered: rootWindow.elapsedMiliSeconds += interval
    }

    // VStack in SwiftUI
    ColumnLayout {
        id: rootLayout
        anchors.fill: parent
        anchors.margins: 24
        spacing: 16

        // Spacer() in SwiftUI
        // Spacer to push buttons toward the bottom on taller windows
        Item { Layout.fillWidth: true; Layout.fillHeight: true }

        // Text in SwiftUI
        Label {
            id: timeLabel
            Layout.fillWidth: true
            // Let it take some vertical space but not all
            Layout.preferredHeight: implicitHeight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap

            // Scale the font with window width (clamped to a sane range)
            font.pixelSize: Math.round(Math.max(24, Math.min(rootWindow.width * 0.12, 72)))

            text: {
                const miliSeconds = rootWindow.elapsedMiliSeconds % 1000
                const totalSeconds = Math.floor(rootWindow.elapsedMiliSeconds / 1000)
                const seconds = totalSeconds % 60
                const minutes = Math.floor(totalSeconds / 60)

                function pad(n, w = 2) {
                    return n.toString().padStart(w, "0")
                }

                return `${pad(minutes)}:${pad(seconds)}.${(miliSeconds/10|0).toString().padStart(2,"0")}`
            }
        }

        // Spacer() in SwiftUI
        // Spacer to push buttons toward the bottom on taller windows
        Item { Layout.fillWidth: true; Layout.fillHeight: true }

        // HStack in SwiftUI
        RowLayout {
            id: controlsRow
            Layout.fillWidth: true
            spacing: 12

            Button {
                text: rootWindow.isRunning ? "Pause" : "Start"
                Layout.fillWidth: true
                onClicked: rootWindow.isRunning = !rootWindow.isRunning
            }

            Button {
                text: "Reset"
                enabled: !rootWindow.isRunning && rootWindow.elapsedMiliSeconds > 0
                Layout.fillWidth: true
                onClicked: rootWindow.elapsedMiliSeconds = 0
            }
        }

        // Spacer() in SwiftUI
        // Spacer to push buttons toward the bottom on taller windows
        Item { Layout.fillWidth: true; Layout.fillHeight: true }
    }
}
