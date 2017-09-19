import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

import "../views/AppMenu/"
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
    Component.onCompleted: {
        console.log("Loaded")
    }
    header: Header {}
    Menu {
        id: recentFilesMenu
        x: root.width
        MenuItem {
            text: "Clear menu"
        }
        MenuSeparator {
        }
        MenuItem {
            text: "Clear menu"
        }
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }
    Shortcut {
        sequence: "Space"
        onActivated: mainFrame.pause()
    }
    MainFrame {
        id: mainFrame
        anchors.fill: parent
    }

    footer: Footer {}
}
