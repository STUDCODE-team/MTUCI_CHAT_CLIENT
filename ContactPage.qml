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

    Rectangle {
        id: menuBar

        width: 58
        height: parent.height
        color: "transparent"

        anchors.left: parent.left
    }


    Item {
        id: searchBlock

        height: 79
        width: 258

        anchors.left: menuBar.right
        anchors.top: parent.top
        anchors.topMargin: 29

        InputField {
            inputWidth: 200
            inputHeight: 30
            inputRadius: inputHeight / 2

            placeHolder: "Поиск"

            anchors.left: parent.left
            anchors.leftMargin: 18
        }
    }

    ListModel {
        id: chatsModel

//        ListElement {
//            userID: 3
//            userAvatarPath: "/img/personVK.png"
//            userName: "Игнатий Глушков"
//            lastMessage: "Последнее сообщение"
//            time: "02:29"
//        }
//        ListElement {
//            chatID: -1
//            userID: 4
//            userAvatarPath: "/img/personVK.png"
//            userName: "Александр Плешаков"
//            lastMessage: "Последнее сообщение"
//            time: "02:34"
//        }
    }

    Connections {
        target: backend
        function onNewChatListElement(chatID, usrID, usrName, usrAvatarName) {
            chatsModel.append({"chatID": chatID,
                               "userID": usrID,
                               "userName": usrName,
                               "userAvatarPath": usrAvatarName})
        }
    }

    ListView {
        id: chatList

        width: 258
        height: parent.height - searchBlock.height
        spacing: 5
        anchors.bottom: parent.bottom
        anchors.left: menuBar.right
        clip: true
        onCurrentIndexChanged: {

        }

        highlight: Rectangle {
            color: "white"
            opacity: 0.04
        }
        highlightFollowsCurrentItem: true


        model: chatsModel
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
                text: time
                color: "white"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                font.pointSize: 11
            }
            MouseArea {
                anchors.fill: parent
                onClicked: view.currentIndex = model.index
            }
        }
    } //ListView

    SeparatorLine {
        id: leftSep

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: chatList.left
    }
    SeparatorLine {
        id: rightSep

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: chatList.right
    }
    Loader{
        anchors.top: parent.top
        anchors.left: rightSep.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        sourceComponent: Component {
            Item{
                anchors.fill: parent
                ListModel{
                    id: messagesModel
                    ListElement{
                        message: "Hello"
                        fromMe: "true"
                    }
                }

                ListView{
                    anchors.fill: parent
                    model:messagesModel
                    spacing: 3
                    delegate: Rectangle {
                        width: messageText.width + 20
                        height: messageText.height + 10
                        radius: 10
                        anchors.left: (fromMe === "false")? parent.left : null
                        anchors.right: (fromMe === "true")? parent.right : null
                        Text {
                            id: messageText
                            anchors.centerIn: parent
                            text: message
                        }
                    }
                }
            }
        }
    }
}
