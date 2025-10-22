// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: arcadeMenu

    property string currentPath: "NOT SET"

    width: 854
    height: 480

    function setupPath(path){

        var component = Qt.createComponent(Qt.resolvedUrl('LevelView.qml'));

        if(component.status == Component.Ready){
            var page = component.createObject(parent);
            page.path = path;

            pageStack.push(page);
        }else
            console.log(component.errorString())
    }

    function getMainPage(){
        return pageStack.find(function(page){
                           return page.message == "1";
                       });
    }

    function playTapSoundEffect(){
        var page = getMainPage();

        if(page != null)
            page.audioController.playTapSoundEffect();
    }

    Image{
        anchors.fill: parent
        source:"assets/images/background/level_background_Harmattan.png"
    }

    Image{
        source: "assets/images/night.png"
        anchors.fill: parent
        z: 200
    }

    ClassSelectView{
        id: classSelectView
        anchors.fill: parent

        onUnlockedModeClicked: arcadeMenu.state = 'dialog'
    }

    Connections{
        target: XmlUtility

        onClassUnlocked: { classSelectView.classModel.reload(); }
    }

    Item{
        id: failDialog
        opacity: 0
        anchors.fill: parent
        anchors.margins:60

        Column{
            anchors.centerIn: parent
            spacing: 6

            Text{
                id: failText
                text: "Clear all stages fist"
                font.pointSize: 30
                font.bold: true
                font.family: arcadeCanvas.localFont.name
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -45
                wrapMode: Text.WordWrap
            }

            Text{
                text: "+"
                font.pointSize: 30
                font.bold: true
                font.family: arcadeCanvas.localFont.name
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -45
                wrapMode: Text.WordWrap
            }

            Row{
                spacing: 6
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -45

                Text{
                    text: "collect at least 11 "
                    font.pointSize: 30
                    font.bold: true
                    font.family: arcadeCanvas.localFont.name
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    wrapMode: Text.WordWrap
                }

                Image{
                    source: "assets/images/menu/button/scores.png"
                    width: 40
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }



        MouseArea{
            anchors.fill: parent
            enabled: failDialog.opacity == 1? true: false

            onClicked: arcadeMenu.state = ''
        }
    }

    Column{
        width: 100
        height: 97
        spacing: 6
        anchors.right: parent.right
        anchors.rightMargin: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        z:201

        Image {
            id: backtitle
            source: "assets/images/menu/button/back_title.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image{
            id: backIcon
            source: backArea.pressed? "assets/images/menu/button/back_pressed.png": "assets/images/menu/button/back.png"
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: backIconShadow
                anchors.rightMargin: 3
                anchors.topMargin: 3
                source: "assets/images/menu/button/shadowed_buttons.png"
                anchors.fill: parent
                visible: !backArea.pressed
            }
        }

        MouseArea
        {
            id: backArea
            anchors.fill: parent
            onClicked: { playTapSoundEffect(); console.log('pageStack depth : ' + pageStack.depth); pageStack.pop() }
        }
    }

    states: [
        State{
            name: "dialog"

            StateChangeScript{ script: failText.text = "Clear all " + classSelectView.getPreviousClassName() + ' classes first' }

            PropertyChanges{ target: classSelectView; opacity: 0 }
            PropertyChanges{ target: failDialog; opacity: 1}
        }
    ]

    transitions:[
        Transition{
            ParallelAnimation{
                NumberAnimation{ target: classSelectView; property: "opacity"; duration: 250 }
                NumberAnimation{ target: failDialog; property: "opacity"; duration: 250 }
            }
        }
    ]
}
