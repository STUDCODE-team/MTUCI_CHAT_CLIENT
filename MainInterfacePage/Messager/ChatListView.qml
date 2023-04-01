import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

ListView {
    id: chatList

    width: 258
    height: parent.height - searchBlock.height
    anchors.bottom: parent.bottom
    anchors.left: menuBar.right
    clip: true

    property string currentChatSessionTime: ""

    Menu {
       id: contextMenu
       MenuItem {
           text: qsTr('Delete')
       }
   }

    function getChatTitle() {
        return chatsModel.get(currentIndex).userName
    }
    function getChatVisaviID() {
        return chatsModel.get(currentIndex).userID
    }

//    function getExtraChatInfo(){
//        return chatsModel.get(currentIndex).userName
//    }

    function getChatID(){
        return chatsModel.get(currentIndex).chatID
    }

//    on

    onCurrentIndexChanged: {
        backend.getMessages(getChatID())
        backend.getSessionData(getChatVisaviID())
    }

    highlight: Rectangle {
        color: "white"
        opacity: 0.07
    }
    highlightFollowsCurrentItem: true
    highlightMoveDuration: 1

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
        function onNewSessionData(sessionData) {
            if (sessionData[0] === "login") {
                currentChatSessionTime = "В сети"
            } else if (sessionData[1] === "-1") {
                currentChatSessionTime = "Был в сети давно"
            } else {
                currentChatSessionTime = "Был в сети в " + parseMessageTime(sessionData[1])
            }
        }
    }

    delegate: Item {
        id: listDelegate

        property var view: ListView.view
        property var isCurrent: ListView.isCurrentItem

        width: parent.width
        height: 65

        Rectangle {
            anchors.fill: parent
            color: "white"
            opacity: itemMouseArea.containsMouse ? 0.03 : 0
        }

        Image {
            id: useravatar
            source: userAvatarPath
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 12
        }
        Text {
            id: _userName
            text: userName
            color: "white"
            font.pointSize: 14
            anchors.left: useravatar.right
            anchors.top: useravatar.top
            anchors.leftMargin: 10
        }
        Text {
            text: lastMessage
            color: "white"
            opacity: 0.7
            font.pointSize: 11
            anchors.left: useravatar.right
            anchors.top: _userName.bottom
            anchors.leftMargin: 10
            anchors.topMargin: 5
        }
        Text {
            text: parseMessageTime(lastMessageTime)
            color: "white"
            opacity: 0.7
            anchors.left: _userName.right
            anchors.verticalCenter: _userName.verticalCenter
            anchors.rightMargin: 10
            anchors.leftMargin: 5
            font.pointSize: 10
        }
        MouseArea {
            id: itemMouseArea
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
            propagateComposedEvents: true
            onClicked: {
                if (mouse.button & Qt.LeftButton) {
                    view.currentIndex = model.index
                }
            }
            onReleased: {
                if (mouse.button & Qt.RightButton) {
                    contextMenu.popup()
                }
            }
        }
    }
}
