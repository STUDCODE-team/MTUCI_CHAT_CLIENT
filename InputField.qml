import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: _rect
    property string placeHolder : ""
    property bool isPassword: false

    width: rectangleWith
    height: rectangleHeight
    radius: rectangleRadius
    border.color: borderLoginColor
    border.width: 0
    clip: true
    color: "#4C5DF1"

    TextField {
        id: input
        anchors{
            fill: parent
            topMargin: 3
            bottomMargin: 3
            leftMargin: 5
        }
        echoMode: isPassword ? TextInput.Password : TextInput.Normal

        placeholderText: placeHolder
        placeholderTextColor: borderLoginColor

        color: "black"
        background: Item{}
    }

}
