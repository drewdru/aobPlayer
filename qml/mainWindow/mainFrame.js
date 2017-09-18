function onVideoOutputMouseClick(mouse) {
    if (mouse.button === Qt.LeftButton) {
        balanceYUV.setResult(mouse.x, mouse.y);
    }
    else if (mouse.button === Qt.RightButton) {
        balanceYUV.setResult(-1., -1.);
    }
}

function onVideoOutputMouseDoubleClick(mouse){
    if (mouse.button === Qt.LeftButton) {
        root.visibility = root.visibility !== Window.FullScreen ?
                Window.FullScreen : Window.AutomaticVisibility
    }
}
