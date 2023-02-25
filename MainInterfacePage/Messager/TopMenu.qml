import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15



Item {
    id: topMenu

    width: 584
    height: 58

    anchors.left: rightSep.right

    Item {
        id: infoUser

        height: 38
        width: chatUserName.width

        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: chatUserName

            text: "Игнатий Глушков"
            font.pointSize: 16
            color: "white"

            anchors.leftMargin: 36
            anchors.left: parent.left
            anchors.top: parent.top

        }

        Text {
            text: "был(а) 8 минут назад"
            font.pointSize: 10
            color: "white"
            opacity: 0.7

            anchors.leftMargin: 36
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
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

        width: 4
        height:16

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 36

    }
}
