import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

RowLayout {
    id: sliderRow
    property string name
    property double stepSize: 0.1
    property double to: 1
    signal positionChanged(double position)

    Label {
        text: sliderRow.name
    }
    Slider {
        id: channelBalance
        value: 0
        stepSize: sliderRow.stepSize
        from: -sliderRow.to
        to: sliderRow.to
        Layout.fillWidth: true
        ToolTip {
            parent: channelBalance.handle
            visible: channelBalance.pressed
            text: qsTr(sliderRow.name + " is " + channelBalance.valueAt(channelBalance.position).toFixed(1))
        }
        onPositionChanged: sliderRow.positionChanged(value)
    }
}

