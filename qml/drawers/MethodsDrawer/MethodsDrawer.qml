import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
Drawer {
    id: drawer
    width: parent.width/2
    height: parent.height
    modal: false

    property string drawerName: ""
    function backClicked() {
        drawer.close()
        drawerFeatureList.open()
    }

    function loadMethods(viewPath) {
        viewData.source = "./views/" + viewPath
    }

    StackLayout {
        id: view
        Layout.fillWidth: true
        y: tabBar.height + tabBar.y
        height: parent.height - y
        width: parent.width

        currentIndex: tabBar.currentIndex
        Flickable {
            focus: true
            anchors.fill: parent
            contentWidth: viewData.width
            contentHeight: viewData.height
            boundsBehavior: Flickable.StopAtBounds
            Keys.onUpPressed: verticalScrollBar.decrease()
            Keys.onDownPressed: verticalScrollBar.increase()
            ScrollBar.vertical: ScrollBar {
                id: verticalScrollBar
                Binding {
                    target: verticalScrollBar
                    property: "active"
                    value: verticalScrollBar.hovered
                }
            }
            Loader {
                id: viewData
                width: drawer.width
                anchors.margins: 20
                asynchronous: true
            }
        }
    }
    TabBar {
        id: tabBar
        width: parent.width
        TabButton {
            Text {
                anchors.centerIn: parent
                text: qsTr("    ← " + drawerName)
                color: "white"
            }
            onClicked: drawer.backClicked()
        }
    }
}
