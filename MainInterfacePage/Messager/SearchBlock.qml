import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../Controls/"

Item {
    id: searchBlock

    height: 60
    width: 258

    anchors.left: parent.left
    anchors.top: parent.top
    anchors.right: rightSep.left
    anchors.topMargin: 18

    InputField {
        id: searchUser

        inputWidth: 170
        inputHeight: 26
        inputRadius: inputHeight / 2

        placeHolder: "Поиск"

        anchors.left:  profileButton.right
        anchors.leftMargin: 8
    }

    Image {
        id: profileButton

        source: "/img/defaultAvatar.svg"
        width: 24
        height: 24

        anchors {
            verticalCenter: searchUser.verticalCenter
            left: searchBlock.left
            leftMargin: 12
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
        }
    }

    Image {
        source: "/img/addGroup.svg"
        width: 18
        height: 18
        opacity: mouseAreaGroup.containsMouse ? 1 : 0.7

        anchors {
            verticalCenter: searchUser.verticalCenter
            left: searchUser.right
            leftMargin: 8
        }

        MouseArea {
            id: mouseAreaGroup
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
        }
    }
}
