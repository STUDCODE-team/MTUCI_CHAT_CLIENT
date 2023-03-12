import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15



Item {
    id: topMenu
    property string title: ""
    property string extraInfo: ""
    property bool settingsPressed: false
    property bool searchPressed: false
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

    Rectangle {
        id: bakcRectSearch

        width: 30
        height: 30
        radius: 20
        color: searchPressed ? "#ffffff" : "transparent"
        opacity: 0.1

        anchors.verticalCenter: searchInChat.verticalCenter
        anchors.horizontalCenter: searchInChat.horizontalCenter

        MouseArea {
            id: mouseAreaSearch

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
            onPressed: searchPressed ? searchPressed=false : searchPressed=true
        }
    }

    Image {
        id: searchInChat
        source: "/img/searchInChat.svg"

        width: 16
        height:16
        opacity: mouseAreaSearch.containsMouse ? 1 : 0.7

        anchors.right: chatSettings.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
    }

    Rectangle {
        id: bakcRectSettings

        width: 30
        height: 30
        radius: 20
        color: settingsPressed ? "#ffffff" : "transparent"
        opacity: 0.1

        anchors.verticalCenter: chatSettings.verticalCenter
        anchors.horizontalCenter: chatSettings.horizontalCenter

        MouseArea {
            id: mouseAreaSettings

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
            onPressed: settingsPressed ? settingsPressed=false : settingsPressed=true
        }
    }


    Image {
        id: chatSettings
        source: "/img/chatSettings.svg"

        width: 16
        height:16
        opacity: mouseAreaSettings.containsMouse ? 1 : 0.7

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
    }
}
