import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Item{
    anchors.fill: parent
    id: messagesField
    ListModel{
        id: messagesModel
        ListElement{
            message: "Привет. Что делваешь?"
            fromMe: "true"
        }
        ListElement{
            message: "сплю"
            fromMe: "false"
        }
        ListElement{
            message: "ой блять да ты заебал уже ныть ну бросила и бросила. Послушай, мы с пацанами всегда тебя поддерживаем, может сходим пивка попьем?"
            fromMe: "true"
        }
        ListElement{
            message: "Погнали"
            fromMe: "false"
        }
    }

    ListView{
        anchors.fill: parent
        model:messagesModel
        spacing: 10
        clip: true
        delegate: Item {
            id: messageDelegate
            width: messageText.width + 20
            height: messageText.height + 10

            Rectangle{
                id:background
                anchors.fill: parent
                radius: 10
            }
            Component.onCompleted: {
                if(fromMe === "true") {
                    anchors.right = parent.right
                    anchors.rightMargin = 10
                    background.color = "#00A3FF"
                }else{
                    anchors.left = parent.left
                    anchors.leftMargin = 16
                    background.color = "white"
                    background.opacity = 0.12
                }
            }

            Text {
                id: messageText
                anchors.centerIn: parent
                text: message
                color: "white"
                wrapMode: Text.WordWrap
                onContentWidthChanged: {
                    if(contentWidth > messagesField.width * 0.4){
                        width = messagesField.width * 0.4
                    }
                }
            }
        }
    }
}

