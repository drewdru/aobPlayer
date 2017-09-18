import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import "../../components"
import "../../views"

Drawer {
    id: drawer

    width: parent.width/2
    // height: parent.height

    signal updateProcessingImage()
    signal backClicked()


    StackLayout {
        id: view
        Layout.fillWidth: true
        y: tabBar.height + tabBar.y
        height: parent.height - y
        width: parent.width

        currentIndex: tabBar.currentIndex

        ColorCorrector {
            id: colorCorrectorId
            width: drawer.width
            height: drawer.height
            onUpdateProcessingImage: drawer.updateProcessingImage()
        }
    }
    TabBar {
        id: tabBar
        width: parent.width
        TabButton {       
            Text {
                text: qsTr("    ← Color corrector")
                color: "white"
            }
            background: Rectangle {                
                anchors.fill: parent                
                color: Qt.lighter("#333333", parent.hovered ? 2 : 1.0)
            }   
            onClicked: drawer.backClicked()
        }
    }
}
