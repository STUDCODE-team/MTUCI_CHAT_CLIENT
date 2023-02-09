import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: _loginItem

    property color buttonColor: "#1EDB75"
    property color textColor: "#515DC7"
    property int buttonWidth: 278
    property int buttonHeight: 30
    property int radius: 12
    property string text: ""

    signal clicked()

    width: buttonWidth
    height: buttonHeight

    Rectangle {

        anchors.fill: parent
        radius: _loginItem.radius
        color: _buttonMouseArea.containsPress ? Qt.darker(_loginItem.buttonColor, 1.2) : _loginItem.buttonColor

        Text {
            id: _loginButtonText

            text: _loginItem.text
            color: _buttonMouseArea.containsPress ? Qt.darker(_loginItem.textColor, 1.2) : _loginItem.textColor
            anchors.centerIn: parent
        }

        MouseArea {
            id: _buttonMouseArea

            anchors.fill: parent

            onClicked: {
                _loginItem.clicked()
            }


        }

    }
}
