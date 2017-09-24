import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.0
import "../../../../components/ChannelBalanceSlider"
import "../../../../components/HueSlider"

GroupBox {
    ColumnLayout {
        id: preferenceColorPanel
        anchors.fill: parent
        ChannelBalanceSlider {
            id: channelY
            name: "Y"
            stepSize: 1
            to: 255
            onPositionChanged: balanceYUV.setY(position)
        }
        ChannelBalanceSlider {
            id: channelU
            name: "U"
            stepSize: 1
            to: 255
            onPositionChanged: balanceYUV.setU(position)
        }
        ChannelBalanceSlider {
            id: channelV
            name: "V"
            stepSize: 1
            to: 255
            onPositionChanged: balanceYUV.setV(position)
        }
        RowLayout {
            Label {
                text: qsTr("Gamma:")
            }
            Slider {
                id: gammaSlider
                from: 0
                value: 1
                to: 5
                Layout.fillWidth: true
                ToolTip {
                    visible: parent.pressed
                    text: qsTr("Max deviation is " + parent.valueAt(parent.position).toFixed(1) + "%")
                }
            }
        }
        RowLayout {
            Label {
                text: qsTr("Hue:")
            }
            HueSlider {
                id: hueSlider

                onPositionChanged: {
//                    if (!pressed) {
                        Slider.running = true
                        preferenceColorPanel.enabled = false
    //                    colorCorrectorController.changeHue(isOriginalImage.checked, value)
                        preferenceColorPanel.enabled = true
                        Slider.running = false
//                    }
                }
            }
        }
    }
}
