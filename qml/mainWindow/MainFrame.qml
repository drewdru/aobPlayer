import QtQuick 2.6
import QtQuick.Controls 2.0
import QtMultimedia 5.8
import QtQuick.Window 2.2
import drewdru.BalanceYUV 1.0
import "./mainFrame.js" as ThisJs
Item {
    MediaPlayer {
        id: mediaplayer
        source: appDir + "/flawless.mp4"
        autoPlay: true
        loops: MediaPlayer.Infinite
    }
    VideoOutput {
        id: videoOutput
        x: 0
        y: 0
        anchors.fill: parent
        source: mediaplayer
        autoOrientation: true
        filters: [ balanceYUV ]
        fillMode: VideoOutput.PreserveAspectFit
        MouseArea {
            id: videoOutputMouse
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: ThisJs.onVideoOutputMouseClick(mouse)
            onDoubleClicked: ThisJs.onVideoOutputMouseDoubleClick(mouse)
        }
    }
    BalanceYUV {
        id: balanceYUV
        onFinished: {
//            console.log("finished! " + result.x + " " + result.y);
        }
    }
}
