import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }
    Shortcut {
        sequence: "Space"
        onActivated: mainFrame.pause()
    }
    Shortcut {
        sequence: "Ctrl+D"
        onActivated: {
            methodsDrawer.close()
            drawerFeatureList.openDrawer()
        }
    }
    Shortcut {
        sequence: "Up"
        onActivated: footerId.volumUp()
    }
    Shortcut {
        sequence: "Down"
        onActivated: footerId.volumDown()
    }
    Shortcut {
        sequence: "Right"
        onActivated: footerId.positionToRight()
    }
    Shortcut {
        sequence: "Left"
        onActivated: footerId.positionToLeft()
    }
}
