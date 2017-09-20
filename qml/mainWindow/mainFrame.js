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
        recentFilesMenu.x = mouse.x
        recentFilesMenu.y = mouse.y
        recentFilesMenu.open()
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

function catchVideoError() {
    var temp = mainFrame.position
    mediaplayer.play()
    mediaplayer.seek(temp)
}

function isPlayerPaused() {
    return mediaplayer.playbackState === MediaPlayer.PausedState
}

