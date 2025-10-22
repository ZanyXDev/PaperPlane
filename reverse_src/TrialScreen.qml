// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
//import com.nokia.meego 1.0

Item {
    id: purchaseScreen
    width: 600
    height: 400

    signal okClicked()

    property string mode: "trial"
    property string trialString: "IDEAL APPS<br/><br/>This is a 1 day trial version of Saita @ School.<br/>Please tap the button OK to play the trial<br/>or tap PREMIUM in order to upgrade to the premium version."
    property string expiredString: "IDEAL APPS<br/><br/>The trial version of Saita @ School is expired!<br/>If you liked the game you can upgrade to the premium version.<br/>Please tap the button OK to EXIT the game or <br/>tap PREMIUM in order to go to Nokia Store and get the game."

    Rectangle{
        id: background
        color: "black"
        anchors.fill: parent
        border.color: "white"
        radius: 6
    }


    Column{
        id: column
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width - 60
        spacing: 20

        Text{
            id: text
            text: mode === "trial"? trialString: expiredString
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            wrapMode: Text.WordWrap
            font.pointSize: 7
            color: "white"
        }

        Row{
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Button{
                anchors.verticalCenter: parent.verticalCenter
                height: 70
                text: "OK"
                width: 140

                onClicked: mode === "trial"? purchaseScreen.okClicked() : Qt.quit()
            }

            Button{
                anchors.verticalCenter: parent.verticalCenter
                height: 70
                text: "PREMIUM"
                width: 140

                onClicked: Qt.openUrlExternally("http://store.ovi.com/content/232884")
            }
        }

        Text{
            id: helpText
            text: "<br/>** In order to install the premium version, please uninstall the trial version first. **"
            font.pointSize: 13
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "lightgrey"
        }
    }
}
