// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: shareMenu

    width: 412
    height: 240

    signal backClicked()

    property string facebook_feed_app_id: "109618152487924"
    property string facebook_feed_picture: "http://idealapps.gr/wp-content/uploads/2011/10/finddifferenceslite_50x50.png"
    property string facebook_feed_name: "Saita"
    property string facebook_feed_caption: "Saita"
    property string facebook_feed_description: "An action game for Nokia mobile devices"
    property string facebook_feed_message: "NOT SET"
    property string facebook_feed_link: "http://idealapps.gr"
    property string facebook_redirect_uri: "http://idealapps.gr"

    property string twitter_tweet_inreplyto: "144742593874497537"
    property string twitter_tweet_related: "idealapps_gr,IdealApps.gr,idealapps.gr"

    property string twitter_follow_screen_name: "idealapps_gr"

    property string email_body: "Hey!\nPlaying the game Saita was fun!Check Saita game at Nokia store\nhttp://store.ovi.com/publisher/ideal apps/"
    property string email_subject: "Mobile game Saita"

    function sendEmail(){

        Qt.openUrlExternally('mailto:?subject='+ email_subject + '&body=' + email_body)
    }

    function shareOnFacebook()
    {
        var url = "http://www.facebook.com/dialog/feed?"
        url += "app_id=" + facebook_feed_app_id + "&link=" + facebook_feed_link +"&picture=" + facebook_feed_picture +"&"
        url += "name=" + facebook_feed_name + "&caption=" + facebook_feed_caption + "&description=" + facebook_feed_description +"&"
        url += "message=" + facebook_feed_message + "&redirect_uri=" + facebook_redirect_uri

        console.log(url)

        Qt.openUrlExternally(url)
    }

    function tweet(){
        var url = "https://twitter.com/intent/tweet?in_reply_to=" + twitter_tweet_inreplyto + "&related=" + twitter_tweet_related

        Qt.openUrlExternally(url)
    }

    function followOnTwitter(){
        var url = 'https://twitter.com/intent/user?screen_name=' + twitter_follow_screen_name

        Qt.openUrlExternally(url)
    }

    function shareOnGooglePlus(){
        var url = 'https://plusone.google.com/_/+1/confirm?hl=en&url=http://idealapps.gr/?p=1494/&title=Saita @School'

        Qt.openUrlExternally(url);
    }

    Column{
        spacing: 6
        anchors.centerIn: parent

        Row{
            spacing: 15
            anchors.horizontalCenter: parent.horizontalCenter

            Column{
                width: 150
                height: 100
                spacing: 6

                Image {
                    id: facebooktitle
                    source: "assets/images/menu/share_menu/facebook_title.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image{
                    id: facebookIcon
                    source: facebookArea.pressed? "assets/images/menu/share_menu/facebook_pressed.png": "assets/images/menu/share_menu/facebook.png"
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        id: facebookIconShadow
                        anchors.rightMargin: 2
                        anchors.leftMargin: 0
                        anchors.topMargin: 2
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !facebookArea.pressed
                    }
                }

                MouseArea
                {
                    id: facebookArea
                    anchors.fill: parent
                    onClicked: { pageMain.audioController.playTapSoundEffect(); shareOnFacebook(); }
                }
            }

            Column{
                width: 150
                height: 100
                spacing: 6

                Image {
                    id: twittertitle
                    source: "assets/images/menu/share_menu/twitter_title.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image{
                    id: twitterIcon
                    source: twitterArea.pressed? "assets/images/menu/share_menu/twitter_pressed.png": "assets/images/menu/share_menu/twitter.png"
                    anchors.horizontalCenter: parent.horizontalCenter


                    Image {
                        id: twitterIconShadow
                        anchors.rightMargin: 2
                        anchors.topMargin: 2
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !twitterArea.pressed
                    }
                }

                MouseArea
                {
                    id: twitterArea
                    anchors.fill: parent
                    onClicked: { pageMain.audioController.playTapSoundEffect(); tweet(); }
                }
            }
        }

        Row{
            spacing: 6

            Column{
                width: 150
                height: 100
                spacing: 6

                Image {
                    id: gplustitle
                    source: "assets/images/menu/share_menu/g_plus_text.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image{
                    id: gplusIcon
                    source: gplusArea.pressed? "assets/images/menu/share_menu/g_plus_pressed.png": "assets/images/menu/share_menu/g_plus.png"
                    anchors.horizontalCenter: parent.horizontalCenter


                    Image {
                        id: gplusIconShadow
                        anchors.rightMargin: 2
                        anchors.topMargin: 2
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !gplusArea.pressed
                    }
                }

                MouseArea
                {
                    id: gplusArea
                    anchors.fill: parent
                    onClicked: { pageMain.audioController.playTapSoundEffect(); shareOnGooglePlus(); }
                }
            }

            Column{
                width: 125
                height: 100
                spacing: 6

                Image {
                    id: emailtitle
                    source: "assets/images/menu/share_menu/e_mail_title.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image{
                    id: emailIcon
                    source: emailArea.pressed? "assets/images/menu/share_menu/e_mail_pressed.png": "assets/images/menu/share_menu/e_mail.png"
                    anchors.horizontalCenter: parent.horizontalCenter


                    Image {
                        id: emailIconShadow
                        anchors.rightMargin: 2
                        anchors.topMargin: 2
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !emailArea.pressed
                    }
                }

                MouseArea
                {
                    id: emailArea
                    anchors.fill: parent
                    onClicked: { pageMain.audioController.playTapSoundEffect(); sendEmail() }
                }
            }

            Column{
                width: 125
                height: 100
                spacing: 6

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
                    onClicked: backClicked()
                }
            }
        }
    }
}
