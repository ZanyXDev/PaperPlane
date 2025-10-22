// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Page {
    orientationLock: PageOrientation.LockLandscape

    Rectangle{
        id: background
        anchors.fill: parent
        anchors.margins: 2
        border.color: "white"
        radius: 6
        color: "black"
    }

    function currentDate(){
        return new Date();
    }

    function defaultText(){
        return "IDEAL APPS<br/>This is a 1 day trial version of Saita @ School.<br/>" + DaysLeft + " day left to end the trial version period.<br/>Tap on the button TRIAL in order to continue to use the trial version or tap the button EXIT to exit the game."
    }


    Item{
        id: container

        anchors.verticalCenter: parent.verticalCenter
        width: parent.width- 12
        height: column.height
        anchors.left: parent.left
        anchors.leftMargin: 6
        anchors.rightMargin: 6

        Column{
            id: column
            width: parent.width
            //anchors.centerIn: parent.horizontalCenter
            spacing: 10

            // Given text, centered within the dialog.
            Text {
                id: dlgText
                width: parent.width
                text: defaultText();
                color: "white"
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }

            // Under the text field there's two clickable buttons.
            Row {
                spacing: 10
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottomMargin: 25
                }

                Button {
                    id: okButton
                    text: "TRIAL"
                    width: 150
                    onClicked: { if(TrialVersionUtiltity.isExpired){ pageMain.state = '' } else { expiredDialog.show() } }
                }

                Button {
                    id: cancelButton
                    text: qsTr("EXIT")
                    width: 150

                    // On click emit "cancelled" signal via the main level dialog Item
                    // and hide the dialog.
                    onClicked: { Qt.quit() }
                }
            } // Row

            Button{
                text: qsTr("Exit")
                width: 150
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.quit()
            }
        }
    }

    // Visual is an item that defines some constants for the application
    // look and feel, e.g. the font sizes & colors etc.
    Visual {
        id: visual
    }

    Connections{
        target: PurchaseUtility

        onAppExpired: expiredDialog.show()
    }

    ModalDialog {
        id: expiredDialog
        opacity: 1

        // Shown text can be set by modifying "text" property.
        text: qsTr("IDEAL APPS<br/>The game is expired.<br/>You can download the premium version from Nokia Store.<br/>Please tap the button Ok in order to go to Nokia Store or tap Cancel to exit game.")

        // Always remember to define the size for the dialog.
        anchors.fill: parent

        z: 20

        // Demonstrating how one could keep application wide variables saved
        // in one place and use them conveniently all around the application.
        fontName: visual.defaultFontFamily
        fontColor: visual.defaultFontColor
        fontColorButton: visual.defaultFontColorButton
        fontSize: visual.defaultFontSize

        onAccepted: {
            // When dialog is accepted, e.g. the data model could be updated.
            // Just debug print here to show how to use the ModalDialog signals.
            Qt.openUrlExternally("http://store.ovi.mobi/content/232884")

        }

        onCancelled: Qt.quit();
    }
}
