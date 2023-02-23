import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Buttons" as Buttons


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
        }

        ListView{
            anchors.fill: parent
            model:messagesModel
            spacing: 10
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
                        background.color = "#00A3FF"
                    }else{
                        anchors.left = parent.left
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

