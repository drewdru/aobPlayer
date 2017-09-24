import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import "../ChannelBalanceSlider"
import "colorModelBalance.js" as ThisJs
ColumnLayout {
    id: colorModelBalance
    property string colorModelTag: "YUV"
    property bool isColorModelTagVisible: true
    property int currentImageChannelIndex: 0
    property bool isOriginalImage: true
    signal updateProcessingImage()
    function onAllUpdate() { ThisJs.onAllUpdate() }
    function onUpdateColorModel() { ThisJs.onUpdateColorModel() }

    ColumnLayout {
        GroupBox {
            // anchors.fill: parent
            visible: isColorModelTagVisible
            Layout.fillWidth: true
            title: qsTr("Choose color model")
            ColumnLayout {
                RadioButton {
                    id: isYuvModel
                    checked: true
                    text: qsTr("YUV")
                    onClicked: onUpdateColorModel(text, "Y", "U", "V", 255, 128, 128)
                }
                RadioButton {
                    id: isRgbModel
                    text: qsTr("RGB")
                    onClicked: {
                        onUpdateColorModel(text, "R", "G", "B", 255, 255, 255)
                    }
                }
                RadioButton {
                    id: isHslModel
                    text: qsTr("HSL")
                    onClicked: onUpdateColorModel(text, "H", "S", "L", 360, 100, 100)
                }
            }
        }
        GroupBox {
            Layout.fillWidth: true
            title: qsTr("Choose color channel")
            visible: isColorModelTagVisible
            ColumnLayout {
                RadioButton {
                    id: isAllImageChannel
                    checked: true
                    text: qsTr("YUV")
                    onClicked: {
                        colorModelBalance.currentImageChannelIndex = 0
                        colorModelBalance.onAllUpdate()
                    }
                }
                RadioButton {
                    id: isFirstImageChannel
                    text: qsTr("Y")
                    onClicked: {
                        colorModelBalance.currentImageChannelIndex = 1
                        colorModelBalance.onAllUpdate()
                    }
                }
                RadioButton {
                    id: isSecondImageChannel
                    text: qsTr("U")
                    onClicked: {
                        colorModelBalance.currentImageChannelIndex = 2
                        colorModelBalance.onAllUpdate()
                    }
                }
                RadioButton {
                    id: isThirdImageChannel
                    text: qsTr("V")
                    onClicked: {
                        colorModelBalance.currentImageChannelIndex = 3
                        colorModelBalance.onAllUpdate()
                    }
                }
            }
        }
        GroupBox {
            // anchors.fill: parent
            Layout.fillWidth: true
            title: qsTr("Color balance")
            ColumnLayout {
                anchors.fill: parent
                RowLayout {
                    Label {
                        text: isFirstImageChannel.text
                    }
                    ChannelBalanceSlider {
                        id: firstChannelBalance
                        to: 255
                        name: isFirstImageChannel.text
                        onValueChanged: {
                            colorModelBalance.onAllUpdate()
                        }
                    }
                }
                RowLayout {
                    Label {
                        text: isSecondImageChannel.text
                    }
                    ChannelBalanceSlider {
                        id: secondChannelBalance
                        to: 255
                        name: isSecondImageChannel.text
                        onValueChanged: {
                            colorModelBalance.onAllUpdate()
                        }
                    }
                }
                RowLayout {
                    Label {
                        text: isThirdImageChannel.text
                    }
                    ChannelBalanceSlider {
                        id: thirdChannelBalance
                        to: 255
                        name: isThirdImageChannel.text
                        onValueChanged: {
                            colorModelBalance.onAllUpdate()
                        }
                    }
                }
            }
        }
    }
}

