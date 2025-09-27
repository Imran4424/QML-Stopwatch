pragma Singleton
import QtQuick

QtObject {
    // Palette
    readonly property color primary:   "#4F46E5"   // indigo-600
    readonly property color primaryHi: "#6366F1"   // indigo-500
    readonly property color primaryLo: "#4338CA"   // indigo-700

    readonly property color secondary: "#0EA5E9"   // sky-500
    readonly property color secondaryHi: "#38BDF8" // sky-400
    readonly property color secondaryLo: "#0284C7" // sky-600

    readonly property color danger:    "#EF4444"   // red-500
    readonly property color dangerHi:  "#F87171"   // red-400
    readonly property color dangerLo:  "#DC2626"   // red-600

    readonly property color textOnDark: "#FFFFFF"
    readonly property color textOnLight: "#0F172A" // slate-900
    readonly property color subtleStroke: "#00000022"

    // Sizing
    readonly property int  btnHeight: 40
    readonly property real btnRadius: 12
    readonly property real btnPaddingX: 16
}
