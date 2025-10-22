// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: arcadeCanvas

    orientationLock: PageOrientation.LockLandscape

    property int message: 2

    property alias localFont: localFont

    signal backClicked()

    property string levelNo: '0'

    width: 854
    height: 480

    ArcadeMenu{
        id: arcadeMenu
        anchors.fill: parent
    }

    FontLoader { id: localFont; source: "assets/fonts/Stylus_BT.ttf" }
}
