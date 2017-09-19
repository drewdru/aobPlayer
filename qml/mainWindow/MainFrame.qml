import QtQuick 2.6
import QtQuick.Controls 2.0
import QtMultimedia 5.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import drewdru.BalanceYUV 1.0
import "./mainFrame.js" as ThisJs
Item {
    id: mainFrame
    property int position: 0
    property int duration: mediaplayer.duration
    function setPosition(value) {mediaplayer.seek(value)}
    function pause() {ThisJs.pause()}
    MediaPlayer {
        id: mediaplayer
        source: appDir + "/flawless.mp4"
        autoPlay: true
        loops: MediaPlayer.Infinite
        onError: {
            var temp = mainFrame.position
            mediaplayer.play()
            mediaplayer.seek(temp)
        }
        onPositionChanged: {
            mainFrame.position = mediaplayer.position
        }
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
