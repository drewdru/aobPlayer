import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "./featureListDrawer.js" as ThisJs

Drawer {
    id: drawer
    width: parent.width/2
    height: parent.height
    function openDrawer() { ThisJs.openDrawer() }

    Flickable {
        focus: true
        anchors.fill: parent
        contentWidth: preferenceColorPanel.width
        contentHeight: preferenceColorPanel.height
        // contentY : 20
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
        anchors.margins: 10
        ColumnLayout {
            id: preferenceColorPanel
            width: drawer.width - 20
            GroupBox {
                title: "List of methods"
                Layout.fillWidth: true
                ColumnLayout {
                    width: drawer.width - 70
                    Button {
                        id: colorCorrectorButton
                        Layout.fillWidth: true
                        text: qsTr("View color corrector methods")
                        onClicked: {
                            drawer.close()
                            methodsDrawer.open()
                            methodsDrawer.loadMethods(
                                "ColorCorrector/ColorCorrector.qml")
                            methodsDrawer.drawerName = "ColorCorrector"
                        }
                    }
                }
            }
        }
    }
}
