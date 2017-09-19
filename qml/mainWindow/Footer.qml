import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ToolBar {
    RowLayout {
        anchors.fill: parent
        Text {
            id: name3
            text: qsTr("    ")
        }
        Text {
            id: name1
            text: qsTr("0")
        }
        Slider {
            id: slider
            Layout.fillWidth: true
            from: 0
            value: mainFrame.position
            to: mainFrame.duration
            onValueChanged: {
                if (slider.pressed) {
                    console.log(value)
                    mainFrame.setPosition(value)
                }
            }
            ToolTip {
                visible: parent.pressed
                text: (parent.valueAt(parent.position)/1000/60)
                    .toFixed(2)
            }
        }
        Text {
            id: name2
            text: (mainFrame.duration / 1000 / 60).toFixed(2)
        }
        Text {
            id: name4
            text: qsTr("    ")
        }
    }
}
