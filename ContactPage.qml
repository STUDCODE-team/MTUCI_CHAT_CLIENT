import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
    anchors.fill: parent
    function init(sessionInfo){
        console.log("[init session]", sessionInfo)
    }

    LinearGradient{
        anchors.fill: parent
        source: parent
        start: Qt.point(0,0)
        end: Qt.point(parent.width, parent.height)
        gradient: Gradient{
            GradientStop{position: 0.0; color: "#515DC7"}
            GradientStop{position: 1.0; color: "#2636C5"}
        }
    }
    ListModel{
        id: chatListModel
        ListElement{

        }
    }

    ListView{
        id: chatList
        anchors.top: parent.top
        width: 250
//        background: Rectangle{}
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 60
        model: chatListModel
        delegate: Rectangle{
            width: parent.width
            height: 50
            opacity: 0.2
        }
    }

    SeparatorLine {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: chatList.left
    }
    SeparatorLine {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: chatList.right
    }


}
