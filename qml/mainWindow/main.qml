import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
ApplicationWindow {
    id: root
    visible: true
    visibility: Window.Windowed

    title: "aobPlayer"
    x: initialX
    y: initialY
    width: initialWidth
    height: initialHeight
    minimumHeight: 280
    minimumWidth: 280

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    Component.onCompleted: {
        console.log("Loaded")
    }
    MainFrame {
        anchors.fill: parent
    }
}
