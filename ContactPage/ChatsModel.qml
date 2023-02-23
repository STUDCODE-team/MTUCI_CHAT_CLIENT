import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Buttons" as Buttons


ListModel {
    id: chatsModel

    ListElement {
        userID: 3
        userAvatarPath: "/img/personVK.png"
        userName: "Игнатий Глушков"
        lastMessage: "Последнее сообщение"
        time: "02:29"
    }
    ListElement {
        chatID: -1
        userID: 4
        userAvatarPath: "/img/personVK.png"
        userName: "Александр Плешаков"
        lastMessage: "Последнее сообщение"
        time: "02:34"
    }
}
