function intToTime(value) {
    var seconds = ((value / 1000) % 60).toFixed(0)
    var minutes = (((value / (1000*60)) % 60)).toFixed(0)
    var hours   = (((value / (1000*60*60)) % 24)).toFixed(0)
    var timeText = ""
    if (hours > 0)
        timeText += "%1:".arg(hours)
    return timeText + "%1:%2".arg(minutes).arg(seconds)
}

function getPlayPauseIconSource() {
    if (mainFrame.isPaused)
        return "qrc:///images/play-box-outline.svg"
    else
        return "qrc:///images/pause.svg"
}

function positionToRight() {
    positionSlider.value += 10000
}

function positionToLeft() {
    positionSlider.value -= 10000
}

// volumSlider Methods
function getVolumIconSource(value) {
    if (value > 60)
        return "qrc:///images/volume-high.svg"
    else if (value === 0)
        return "qrc:///images/volume-off.svg"
    else
        return "qrc:///images/volume-medium.svg"
}

function volumeMute() {
    if (volumSlider.value !== 0)
        volumSlider.value = 0
    else
        volumSlider.value = 100
}

function volumUp() {
    volumSlider.value += 10
}

function volumDown() {
    volumSlider.value -= 10
}

