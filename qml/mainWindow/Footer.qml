import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "./footer.js" as ThisJs
ToolBar {
    function volumUp() { ThisJs.volumUp() }
    function volumDown() { ThisJs.volumDown() }
    function positionToRight() { ThisJs.positionToRight() }
    function positionToLeft() { ThisJs.positionToLeft() }
    RowLayout {
        anchors.fill: parent
        ToolButton {
            Image {
                anchors.centerIn: parent
                source: ThisJs.getPlayPauseIconSource()
                width: parent.width / 1.5
                height: parent.height / 1.5
            }
            onClicked: mainFrame.pause()
        }
        Slider {
            id: positionSlider
            Layout.fillWidth: true
            from: 0
            value: mainFrame.position
            to: mainFrame.duration
            onValueChanged: mainFrame.setPosition(value)
            ToolTip {
                parent: positionSlider.handle
                visible: positionSlider.pressed
                text: ThisJs.intToTime(positionSlider.valueAt(
                        positionSlider.position))
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
                width: parent.width / 1.5
                height: parent.height / 1.5
            }
            onClicked: ThisJs.volumeMute()
        }
        Slider {
            id: volumSlider
            from: 0
            value: 100
            to: 100
            stepSize: 10
            wheelEnabled: true
            onValueChanged: { mainFrame.setVolume(value/100) }
            ToolTip {
                parent: volumSlider.handle
                visible: volumSlider.pressed
                text: volumSlider.value.toFixed(0)
            }
        }
        Text { text: qsTr("    ") }
    }
}
