import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../../Controls/"


Item {
    id: bottomMenu

    property int smileRightMargin: 20
    property int microphoneRightMargin: 5
    property double defOpacity: 0.7
    property double backRectOpacity: 0.2

    property bool smilePressed: false
    property bool microphonePressed: false
    property bool clipPaperPressed: false

    property double opacitySmile: mouseAreaSmile.containsMouse ? 1 : defOpacity

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
        onEnter: {
            backend.sendMessage(chatList.getChatID(), writeMessage.text)
            clear()
        }
    }

    Rectangle {
        id: bakcRectClipPaper

        width: 30
        height: 30
        radius: 20
        color: clipPaperPressed ? "#ffffff" : "transparent"
        opacity: 0.1

        anchors.verticalCenter: clipPaper.verticalCenter
        anchors.horizontalCenter: clipPaper.horizontalCenter

        MouseArea {
            id: mouseAreaClipPaper

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
            onPressed: clipPaperPressed ? clipPaperPressed=false : clipPaperPressed=true
        }
    }

    Image {
        id: clipPaper
        source: "qrc:/img/clip.svg"

        width: 18
        height: 18
        opacity: mouseAreaClipPaper.containsMouse ? 1 : 0.7

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: bakcRectMicrophone

        width: 30
        height: 30
        radius: 20
        color: microphonePressed ? "#ffffff" : "transparent"
        opacity: 0.1

        anchors.verticalCenter: microphone.verticalCenter
        anchors.horizontalCenter: microphone.horizontalCenter

        MouseArea {
            id: mouseAreaMicrophone

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
            onPressed: microphonePressed ? microphonePressed=false : microphonePressed=true
        }
    }

    Image {
        id: microphone
        source: "qrc:/img/microphone.svg"

        width: 16
        height: 20
        opacity: mouseAreaMicrophone.containsMouse ? 1 : 0.7

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5

    }

    Rectangle {
        id: backRectSmile

        width: 30
        height: 30
        radius: 20
        color: "#ffffff"
        opacity: smilePressed ? 0.2 : 0

        anchors.verticalCenter: smile.verticalCenter
        anchors.horizontalCenter: smile.horizontalCenter

        MouseArea {
            id: mouseAreaSmile

            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.WhatsThisCursor
            //onPressed: backRectSmile.opacity = 0.2
            onClicked: {
                smilePressed ? smilePressed=false : smilePressed=true
            }
        }
    }

    Image {
        id: smile
        source: "qrc:/img/smile.svg"

        width: 20
        height: 20
        opacity: smilePressed ? 1 : opacitySmile

        anchors.right: microphone.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: smileRightMargin
    }
}
