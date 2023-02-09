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
    color: "#4C5DF1"

    TextField {
        id: input
        anchors{
            fill: parent
            leftMargin: 5
        }
        verticalAlignment: TextField.AlignVCenter
        echoMode: isPassword ? TextInput.Password : TextInput.Normal
        font.pointSize: 16
        placeholderText: placeHolder
        color: borderLoginColor

        background: Item{}
    }

}
