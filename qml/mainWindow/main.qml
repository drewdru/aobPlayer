import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

import "../drawers/FeatureListDrawer/"
import "../drawers/MethodsDrawer"

ApplicationWindow {
    id: root
    title: "aobPlayer"
    visible: true
    visibility: Window.Windowed
    x: initialX
    y: initialY
    width: initialWidth
    height: initialHeight
    minimumHeight: 280
    minimumWidth: 280
    footer: Footer {
        id: footerId
    }
    MainShortcuts {}

    MainFrame {
        id: mainFrame
        anchors.fill: parent
    }

    FeatureListDrawer {
        id: drawerFeatureList
        MainShortcuts {}
    }
    MethodsDrawer {
        id: methodsDrawer
        MainShortcuts {}
    }

    Menu {
        id: recentFilesMenu
        MenuItem {
            text: "Clear menu"
        }
        MenuSeparator {
        }
        MenuItem {
            text: "Clear menu"
        }
    }
}
