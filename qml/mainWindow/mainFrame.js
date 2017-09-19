function pause() {
    if(mediaplayer.playbackState === MediaPlayer.PlayingState)
        mediaplayer.pause()
    else
        mediaplayer.play()
}

function onVideoOutputMouseClick(mouse) {
    if (mouse.button === Qt.LeftButton) {
//        balanceYUV.setResult(mouse.x, mouse.y);
        pause()
    }
    else if (mouse.button === Qt.RightButton) {
//        balanceYUV.setResult(-1., -1.);
    }
}

function onVideoOutputMouseDoubleClick(mouse){
    if (mouse.button === Qt.LeftButton) {
        if (root.visibility !== Window.FullScreen) {
            root.visibility = Window.FullScreen
        } else {
            root.visibility = Window.AutomaticVisibility
        }
    }
}

