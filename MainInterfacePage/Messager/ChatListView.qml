import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


ListView {
    id: chatList

    width: 258
    height: parent.height - searchBlock.height
    spacing: 5
    anchors.bottom: parent.bottom
    anchors.left: menuBar.right
    clip: true
    onCurrentIndexChanged: {}

    highlight: Rectangle {
        color: "white"
        opacity: 0.04
    }
    highlightFollowsCurrentItem: true

    model: ListModel {id: chatsModel}

    Connections {
        target: backend
        function onNewChatListElement(chatData) {
            chatsModel.append({"chatID":            chatData[0],
                               "userID":            chatData[1],
                               "userName":          chatData[2],
                               "userAvatarPath":    "qrc:/" + chatData[3],
                               "lastMessage":       chatData[4],
                               "lastMessageTime":   chatData[5],
                               "lastMessageID":     chatData[6]})
        }
    }

    delegate: Item {
        id: listDelegate

        property var view: ListView.view
        property var isCurrent: ListView.isCurrentItem

        width: parent.width
        height: 50

        Image {
            id: useravatar
            source: userAvatarPath
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 18
        }
        Text {
            text: userName
            color: "white"
            anchors.left: useravatar.right
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10
        }
        Text {
            text: lastMessage
            color: "white"
            opacity: 0.7
            font.pointSize: 10
            anchors.left: useravatar.right
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 30
        }
        Text {
            text: lastMessageTime
            color: "white"
            opacity: 0.7
            anchors.top: parent.top
            anchors.topMargin: 12
            anchors.right: parent.right
            anchors.rightMargin: 10
            font.pointSize: 10
        }
        MouseArea {
            anchors.fill: parent
            onClicked: view.currentIndex = model.index
        }
    }
}
