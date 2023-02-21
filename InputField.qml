import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: _rect
    property string placeHolder : ""
    property bool isPassword: false
    property int inputWidth: 280
    property int inputHeight: 30
    property int inputRadius: 12

    readonly property color borderColor: "#00D6C9"

    readonly property string text: input.text

    width: inputWidth
    height: inputHeight
    radius: inputRadius
    border.color: borderColor
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
        color: borderColor

        background: Item{}
    }

}
