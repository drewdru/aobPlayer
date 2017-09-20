import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "./footer.js" as ThisJs
ToolBar {
    RowLayout {
        anchors.fill: parent
        ToolButton {
            Image {
                anchors.centerIn: parent
                source: ThisJs.getPlayPauseIconSource()
                width: parent.width/1.5
                height: parent.height/1.5
            }
            onClicked: mainFrame.pause()
        }
        Slider {
            id: slider
            Layout.fillWidth: true
            from: 0
            value: mainFrame.position
            to: mainFrame.duration
            onValueChanged: { if (slider.pressed) mainFrame.setPosition(value) }
            ToolTip {
                parent: slider.handle
                visible: slider.pressed
                text: ThisJs.intToTime(slider.valueAt(slider.position))
            }
        }

        Text {
            id: name2
            text: "%1 / %2  ".arg(ThisJs.intToTime(mainFrame.position))
                    .arg(ThisJs.intToTime(mainFrame.duration))
        }
        ToolButton {
            id: volumMenu
            Image {
                anchors.centerIn: parent
                source: ThisJs.getVolumIconSource(volumSlider.value)
                width: parent.width/1.5
                height: parent.height/1.5
            }
            onClicked: {

            }
        }
        Slider {
            id: volumSlider
            from: 0
            value: 100
            to: 100
            onValueChanged: { mainFrame.setVolume(value/100) }
        }
        Text { text: qsTr("    ") }
    }
}
