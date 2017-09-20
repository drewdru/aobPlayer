function intToTime(value) {
    var seconds = ((value / 1000) % 60).toFixed(0) ;
    var minutes = (((value / (1000*60)) % 60)).toFixed(0);
    var hours   = (((value / (1000*60*60)) % 24)).toFixed(0);
    var timeText = ""
    if (hours > 0)
        timeText += "%1:".arg(hours)
    return "%1:%2".arg(minutes).arg(seconds)
}

function getVolumIconSource(value) {
    if (value > 60)
        return "qrc:///images/volume-high.svg"
    else if (value === 0)
        return "qrc:///images/volume-off.svg"
    else
        return "qrc:///images/volume-medium.svg"
}
