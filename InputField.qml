import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: _rect
    property string placeHolder : ""
    property bool isPassword: false

    width: 280
    height: 30
    radius: 12
    border.color: borderLoginColor
    border.width: 2
    clip: true

    TextField {
        id: input

        anchors{
            fill: parent
            topMargin: 3
            bottomMargin: 3
        }
        echoMode: isPassword? TextInput.Password : TextInput.Normal

        placeholderText: placeHolder
        placeholderTextColor: borderLoginColor

        color: "black"
        background: Item{}
    }

}
