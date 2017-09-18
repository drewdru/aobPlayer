import QtQuick 2.6
import QtQuick.Controls 2.0
import QtMultimedia 5.8
import my.filter 1.0


ApplicationWindow {
    id: root
    visible: true
    title: "aobPlayer"
    x: initialX
    y: initialY
    width: initialWidth
    height: initialHeight
    minimumHeight: 280
    minimumWidth: 280

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    Component.onCompleted: {
        console.log(mediaplayer.source)
    }

    MediaPlayer {
        id: mediaplayer
        source: appDir + "/flawless.mp4"
        autoPlay: true
    }

    VideoOutput {
        x: 0
        y: 0
        anchors.fill: parent

        source: mediaplayer
        autoOrientation: true

        filters: [ myCoolFilter ]
        fillMode: VideoOutput.PreserveAspectFit

        MouseArea {
            anchors.fill: parent

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: {
                if (mouse.button === Qt.LeftButton) {
                    myCoolFilter.setResult(mouseX, mouseY);
                }
                else if (mouse.button === Qt.RightButton) {
                    myCoolFilter.setResult(-1., -1.);
                }
            }
        }
        RotationAnimation on rotation {
            loops: Animation.Infinite
            from: 0
            to: 20
        }
    }

    MyFilter {
        id: myCoolFilter

        onFinished: {
            console.log("finished! " + result.x + " " + result.y);
        }
    }

//    VideoOutput {
//        id: videoOutput
//        anchors.fill: parent
//        source: mediaplayer
//        filters: [ myFilter ]
//    }

//    MyFilter {
//        id: myFilter
//        // set properties, they can also be animated
//        onFinished: console.log("results of the computation: " + result)
//    }

//    ShaderEffectSource {
//        id: slides
//        x: 600
//        width:250
//        height: 250
//        sourceItem: videoOutput
//        visible: true
//    }

//    MouseArea {
//        id: playArea
//        anchors.fill: parent
//        onPressed: mediaplayer.play();
//    }

//    BackEnd {
//        id: backend
//    }

//    TextField {
//        text: backend.userName
//        placeholderText: qsTr("User name")
//        anchors.centerIn: parent

//        onTextChanged: backend.userName = text
//    }
}
