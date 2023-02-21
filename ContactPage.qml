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

        ListElement {
            texts: [
                ListElement { text: "Игнатий Глушков" },
                ListElement { text: "Последнее сообщение" }
            ]
            text: "02:29"
        }
        ListElement {
            texts: [
                ListElement { text: "Игнатий Глушков" },
                ListElement { text: "Последнее сообщение" }
            ]
            text: "02:29"
        }
        ListElement {
            texts: [
                ListElement { text: "Игнатий Глушков" },
                ListElement { text: "Последнее сообщение" }
            ]
            text: "02:29"
        }
        ListElement {
            texts: [
                ListElement { text: "Игнатий Глушков" },
                ListElement { text: "Последнее сообщение" }
            ]
            text: "02:29"
        }
    }

    ListView {
        id: chatList

        width: 258
        height: parent.height - searchBlock.height
        spacing: 15
        anchors.bottom: parent.bottom
        anchors.left: menuBar.right
        clip: true

        highlight: Rectangle {
            color: "white"
            opacity: 0.07
        }
        highlightFollowsCurrentItem: true


        model: chatsModel
        delegate: Item {
            id: listDelegate

            property var view: ListView.view
            property var isCurrent: ListView.isCurrentItem

            width: parent.width
            height: 50

            Rectangle {
                anchors.fill: parent

                color: "transparent"

                Image {
                    id: useravatar

                    source: "/img/personVK.png"

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 18

                }

                Text {
                    text: model.text
                    color: "white"
                    opacity: 0.7
                    font.pointSize: 10

                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 18
                    anchors.topMargin: 8

                }

                Column {
                    id: userName

                    anchors.top: parent.top
                    anchors.left: useravatar.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 6
                    spacing: 7

                    Repeater {
                        model: texts
                        delegate: Text {

                            text: model.text
                            color: "white"
                        }
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: view.currentIndex = model.index
                }
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
}
