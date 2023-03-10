import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../Controls/"


Item {
    id: bottomMenu

    property int smileRightMargin: 20
    property int microphoneRightMargin: 5

    width: bottomSep.width
    height: 48

    anchors.horizontalCenter: bottomSep.horizontalCenter
    anchors.bottom: parent.bottom

    InputField {
        id: writeMessage

        placeHolder: "Написать сообщение..."
        backColor: "transparent"
        leftMargin: 0

        anchors.left: clipPaper.right
        anchors.verticalCenter: parent.verticalCenter
        inputWidth: parent.width - clipPaper.width - microphone.width - smile.width - smileRightMargin - microphoneRightMargin - 3
    }

    Image {
        id: clipPaper
        source: "qrc:/img/clip.svg"

        width: 18
        height: 18

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: microphone
        source: "qrc:/img/microphone.svg"

        width: 13
        height: 17

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5
    }

    Image {
        id: smile
        source: "qrc:/img/smile.svg"

        width: 17
        height: 17

        anchors.right: microphone.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: smileRightMargin
    }
}
