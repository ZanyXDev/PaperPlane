import QtQuick 1.1
import "inneractive"

Item {
    id: bannerDialog
    width: 400
    height: 220
//    color: "#f4eef7"
//    border.color: "#5b2477"
//    border.width: 2
//    radius: 10
//    visible: wonTimer.running

    property bool exitMode: false

    property int seconds: 0

    signal errorReturned(string error)
    signal modelReady()
    signal skipped()

    Image{
        id: background
        anchors.fill: parent
        source: "assets/images/background/level_background_Harmattan.png"
    }

    function reload(){
        bannerFrame.reload()
    }

    Timer{ id: wonTimer; interval: 1000; running: bannerDialog.seconds < 0? false: true; repeat: true; onTriggered: { bannerDialog.seconds = bannerDialog.seconds - 1 } }

    Column{
        spacing: 10
        anchors.centerIn: parent

        Text{
            id: helperText
            text: "We were able to provide you a full free version of the game thanks to our sponsors,<br/>please support us by taping on the banner"
            width: bannerDialog.width * 0.87
            color: "white"
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font{ pointSize: 22; /*bold: true;*/ family: "Comic Sans MS" }
            z:101
        }

        AdItem {
            id: adItem
            parameters: AdParameters {
            applicationId: "POLYHEDRON_SaitaSchool_OVI"
            }
            retryOnError: true
            reloadInterval: 100
            anchors.horizontalCenter: parent.horizontalCenter
            z:101
        }

        Item{
            id: skipRect
            width: 250
            height: 65
//            border.color: "white"
//            color: skipArea.pressed? "magenta":"transparent"
//            radius: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Text{
                text: seconds>0?"Skip in " + seconds : "Skip now!"
                color: seconds>=0?"grey":"white"
                font{ pointSize: 26; bold: true; family: "Comic Sans MS" }
                anchors.centerIn: parent
            }

            MouseArea{
                id: skipArea
                anchors.fill: parent
                enabled: seconds>=0? false:true
                onClicked: { console.log('skip button clicked..'); if(exitMode){ Qt.quit() }else { skipped() } }
            }
        }
    }


}
