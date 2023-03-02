import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../Controls/"

Item {
    id: searchBlock

    height: 79
    width: 258

    anchors.left: menuBar.right
    anchors.top: parent.top
    anchors.topMargin: 29

    InputField {
        id: searchUser

        inputWidth: 200
        inputHeight: 30
        inputRadius: inputHeight / 2

        placeHolder: "Поиск"

        anchors.left: parent.left
        anchors.leftMargin: 18
    }

    Image {
        source: "/img/addGroup.svg"
        width: 16
        height: 16

        anchors {
            verticalCenter: searchUser.verticalCenter
            left: searchUser.right
            leftMargin: 5
        }
    }
}
