import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15



Item {
    id: topMenu
    property string title: ""
    property string extraInfo: ""
//    function setData(userName, info){
//        chatUserName.text = userName
//        chatUserOnlineInfo.text = info
//    }
    height: 58
    anchors.left: rightSep.right
    anchors.right: parent.right
    Item {
        id: infoUser

        height: 38
        width: chatUserName.width

        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: chatUserName

            text: title
            font.pointSize: 16
            color: "white"

            anchors.leftMargin: 36
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: chatUserOnlineInfo
            text: extraInfo
            font.pointSize: 10
            color: "white"
            opacity: 0.7

            anchors.verticalCenter: chatUserName.verticalCenter
            anchors.left: chatUserName.right
            anchors.leftMargin: 20
        }
    }

    Image {
        id: searchInChat
        source: "/img/searchInChat.svg"

        width: 16
        height:16
        opacity: 0.8

        anchors.right: chatSettings.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
    }

    Image {
        id: chatSettings
        source: "/img/chatSettings.svg"

        width: 16
        height:16

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 36

    }
}
