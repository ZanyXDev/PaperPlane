// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
//import QtMultimediaKit 1.1
//import GEAudio 1.0

Item {
    id: winMenu
    width: 366
    height: 218

    property int currentLevel: 0

    property int bonusItems: 0

    property string sufficientText: "Sufficient"
    property string sufficientDescription: "You need more practice.."

    property string satisfactoryText: "Satisfactory !"
    property string satisfactoryDescription: "Getting better ! still a newbie.."

    property string goodText: "Good !!"
    property string goodDescription: "You are good ! but not perfect.."

    property string excellectText: "Excellent !!!"
    property string excellectDescription: "Congradulations ! a new badge.."

    property bool buttonsDisabled: false

    signal restart()
    signal backToMenu()
    signal nameChanged(string name);
    signal nextLevel();

    property int adsCounter: 0

    function start(){
        if(bonusItems == 3){
            gradeText.text = excellectText
            gradeDescriptionText.text = excellectDescription
        } else if(bonusItems == 2){
            gradeText.text = goodText
            gradeDescriptionText.text = goodDescription
        } else if(bonusItems == 1){
            gradeText.text = satisfactoryText
            gradeDescriptionText.text = satisfactoryDescription
        } else{
            gradeText.text = sufficientText
            gradeDescriptionText.text = sufficientDescription
        }

        playWinMusic();

        for(var j = 0; j < appleModel.count; j++)
            appleModel.get(j).path = "assets/images/extras/apple_bitten.png"

        for(var i = 0; i < bonusItems; i++){
            appleModel.get(i).path = "assets/images/extras/apple.png"
        }

        XmlUtility.setApplesValue(levelView.getCurrentPath(),currentLevel,bonusItems);

        XmlUtility.setLevelState(levelView.getCurrentPath(),currentLevel,1);

        console.log('finished win menu setup');

        if(bonusItems>0)
            animation.start()
    }

    ListModel{
        id: appleModel
        ListElement{ no: "0"; fill: false; path: "assets/images/extras/apple_bitten.png" }
        ListElement{ no: "1"; fill: false; path: "assets/images/extras/apple_bitten.png" }
        ListElement{ no: "2"; fill: false; path: "assets/images/extras/apple_bitten.png" }
    }

    Image{
        id:backgroundWinMenu
        source: "assets/images/menu/lost_menu/lost_menu_wall.png"
        anchors.fill: parent
        opacity: 0.90
    }

    Image{
        id: badgeImage
        width: 48
        height: 48
        rotation: -10
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        source: "assets/images/menu/button/scores.png"
        visible: bonusItems == 3? true: false
    }

    Column{
        anchors.centerIn: parent
        spacing: 10

        ListView{
            id: listView
            width: 80
            height: 24
            model:appleModel
            spacing: 4
            anchors.horizontalCenter: parent.horizontalCenter
            interactive: false
            orientation: ListView.Horizontal
            delegate: Image {
                source: path
                width: ListView.view.height
                height: ListView.view.height
            }
        }

        Row{
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Item{
                width: 80
                height: 80
                opacity: replayArea.enabled? 1.0: 0.5

                Image{
                    source: replayArea.pressed? "assets/images/menu/lost_menu/replay_pressed.png": "assets/images/menu/lost_menu/replay.png"
                    anchors.centerIn: parent

                    Image {
                        id: replayIconShadow
                        anchors.rightMargin: 3
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !replayArea.pressed
                    }
                }

                MouseArea{
                    id: replayArea
                    anchors.fill: parent
                    enabled: animation.running || animation2.running || buttonsDisabled? false: true

                    onClicked: { stopWinMusic(); playTapSoundEffect(); winMenu.restart() }
                }
            }

            Item{
                width: 80
                height: 80
                z:300
                opacity: backToMenuArea.enabled? 1.0: 0.5

                Image{
                    source: backToMenuArea.pressed? "assets/images/buttons/main_menu_pressed.png": "assets/images/buttons/main_menu_shaded.png"
                    anchors.centerIn: parent

                    Image {
                        id: backToMenuIconShadow
                        anchors.rightMargin: 3
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !backToMenuArea.pressed
                    }
                }

                MouseArea{
                    id: backToMenuArea
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    enabled: animation.running || animation2.running || buttonsDisabled? false: true

                    onClicked: { stopWinMusic(); playTapSoundEffect(); winMenu.backToMenu() }
                }
            }

            Item{
                width: 80
                height: 80
                z:300
                opacity: nextLevelArea.enabled? 1.0: 0.5

                Image{
                    source: nextLevelArea.pressed? "assets/images/buttons/next_level.png": "assets/images/buttons/next_level.png"
                    anchors.centerIn: parent

                    Image {
                        id: nextLevelIconShadow
                        anchors.rightMargin: 3
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !backToMenuArea.pressed
                    }
                }

                MouseArea{
                    id: nextLevelArea
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    enabled: animation.running || animation2.running || buttonsDisabled? false: true

                    onClicked: { stopWinMusic(); playTapSoundEffect(); nextLevel(); buttonsDisabled = false }
                }
            }
        }

        Text{
            id: gradeText
            text: "Sufficient.."
            font.pointSize: 26
            font.bold: true
            font.family: arcadeCanvas.localFont.name
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text{
            id: gradeDescriptionText
            text: "You need practice.."
            font.bold: true
            font.pointSize: 18
            font.family: arcadeCanvas.localFont.name
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    SequentialAnimation{
        id: animation
        ParallelAnimation{
            NumberAnimation{ target: listView; duration: 400; properties: "height"; from: 24; to: 36; easing.type: Easing.OutQuad }
            NumberAnimation{ target: listView; duration: 400; properties: "width"; from: 80; to: 110; easing.type: Easing.OutQuad }
        }

        ParallelAnimation{
            NumberAnimation{ target: listView; duration: 400; properties: "height"; from: 36; to: 24; easing.type: Easing.InCubic }
            NumberAnimation{ target: listView; duration: 400; properties: "width"; from: 110; to: 80; easing.type: Easing.InCubic }
        }

        NumberAnimation{ target: gradeText; duration: 300; properties: "font.pointSize"; from: 26; to: 30; easing.type: Easing.OutQuad}
        NumberAnimation{ target: gradeText; duration: 300; properties: "font.pointSize"; from: 30; to: 26; easing.type: Easing.InCubic}
    }

    SequentialAnimation{
        id: animation2;

        NumberAnimation{ loops: 2; target: badgeImage; duration: 150; properties: "rotation"; from: 0; to: 360; easing.type: Easing.OutQuad}
        NumberAnimation{ target: badgeImage; duration: 300; properties: "width,height"; from: 48; to: 64; easing.type: Easing.OutQuad }
        NumberAnimation{ target: badgeImage; duration: 300; properties: "width,height"; from: 64; to: 48; easing.type: Easing.InCubic }
    }
}
