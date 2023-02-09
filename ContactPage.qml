import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Page {
    anchors.fill: parent
    header: Label {
        Label {
            text: qsTr("Contacts")
            font.pixelSize: 20
            anchors.centerIn: parent
            topPadding: 20
        }
    }

    ListView {
        id: _listView
        anchors.fill: parent
        topMargin: 48
        leftMargin: 48
        bottomMargin: 48
        rightMargin: 48


        spacing: 20
        model: ["Игнатий Глушков", "Александр Плешаков", "Арсений Смирнов", "Александр Чернов"]
        delegate: ItemDelegate {
            text: modelData
            width: _listView.width - _listView.leftMargin - _listView.rightMargin
            height: _avatar.implicitHeight
            leftPadding: _avatar.implicitWidth + 32
            onClicked: _stackView.push("qrc:/ConversationPage.qml", {inConversationWith: modelData})

            Image {
                id: _avatar
                //source: "qrc:/img/" + modelData.replace(" ", "_") + ".png"
                source: "qrc:/img/person.png"
            }

        }

    }
}
