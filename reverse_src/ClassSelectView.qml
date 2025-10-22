// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0

Item {
    id: container
    width: 100
    height: 62

    signal backClicked()
    signal unlockedModeClicked()

    property string sufficientText: "Sufficient"

    property string satisfactoryText: "Satisfactory !"

    property string goodText: "Good !!"

    property alias classModel: classesModel

    property string excellectText: "Excellent !!!"

    function getPreviousClassName(){
        return classesModel.get(classesView.currentIndex-1).name;
    }

    function getCurrentClassName(){
        return classesModel.get(classesView.currentIndex).name;
    }

    XmlListModel{
        id: classesModel
        source: "assets/levels/classes.xml"

        query: "/classes/class"

        XmlRole{ name: "name"; query: "@name/string()" }
        XmlRole{ name: "description"; query: "@description/string()" }
        XmlRole{ name: "lockedstate"; query: "@lockedstate/string()" }
        XmlRole{ name: "levelcount"; query: "@levelcount/string()" }
        XmlRole{ name: "badges"; query: "@badges/string()" }
        XmlRole{ name: "filename"; query: "@filename/string()" }
        XmlRole{ name: "grade"; query: "@grade/number()" }
    }

    Connections{
        target: XmlUtility
        onBadgesChanged: { console.log('badges changed ..'); classesModel.reload() }
        onGradeChanged: { console.log('grade changed..'); classesModel.reload() }
    }

    Component{
        id: delegateComponent

        Item{
//            radius: 160
//            color: "transparent"
//            border.color: "lightgrey"
            id: container

            function getText(){
                var val = grade;
                if(grade <= 4 && grade >= 3.7 )
                    return val.toFixed(1) + ' " ' + excellectText + ' "';
                else if(grade < 3.7 && grade >= 3)
                    return val.toFixed(1) + ' " ' + goodText + ' "';
                else if(grade < 3 && grade >= 2)
                    return val.toFixed(1) + ' " ' + satisfactoryText+ ' "';
                else
                    return val.toFixed(1) + ' " ' + sufficientText + ' "';
            }

            width: ListView.view.width - (ListView.view.width/20)
            height: width * 0.66667

            opacity: ListView.isCurrentItem? 1.0: 0.8
            anchors.verticalCenter: parent.verticalCenter

            Column{
                anchors.centerIn: parent
                spacing: 10

                Text {
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: container.opacity==1.0? 45: 40
                    font.family: arcadeCanvas.localFont.name
                    font.bold: container.opacity==1.0?true:false
                    color: "white"
                }

                Text {
                    text: description
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: container.opacity==1.0? 28: 25
                    font.bold: container.opacity==1.0? true: false
                    font.family: arcadeCanvas.localFont.name
                    color: "white"
                }

                Image{
                    source: "assets/images/locked.png"
                    width: 64
                    height: 64
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: lockedstate === '0'? true: false
                }

                Row{
                    spacing: 10;
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: lockedstate === '0'? false: true

                    Text{
                        id: gradeText
                        text: 'Score: ' + getText()
                        color: "white";
                        anchors.verticalCenter: parent.verticalCenter
                        font { pointSize: container.opacity==1.0?20:18; bold:container.opacity==1.0?true:false; family: arcadeCanvas.localFont.name }
                    }

//                    RatingIndicator{ maximumValue: 4; ratingValue: 2; inverted: true; anchors.verticalCenter: parent.verticalCenter }
                }


                Row{
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: lockedstate === '0'? false: true
                    Image {
                        source: "assets/images/menu/button/scores.png"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 32
                        height: 32
                    }

                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text: badges + ' / ' + levelcount
                        font { pointSize: container.opacity==1.0?20:18; bold: container.opacity==1.0?true:false; family: arcadeCanvas.localFont.name }
                        color: "lightgrey"
                    }
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: { if(classesView.currentIndex == index) { if(lockedstate === '0') { unlockedModeClicked(); }else { setupPath(filename); } } else { classesView.currentIndex = index; } }
            }
        }
    }

    ListView{
        id: classesView
        width: parent.height * 0.8
        height: width
        anchors.centerIn: parent
        z: 200
        model: classesModel
        delegate: delegateComponent
        orientation: ListView.Horizontal
        spacing: 6

        Component.onCompleted: currentIndex = 0
    }
}
