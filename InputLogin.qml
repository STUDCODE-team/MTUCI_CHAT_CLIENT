import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: _loginRect

    width: 280
    height: 30
    radius: 12
    border.color: borderLoginColor
    border.width: 2
    clip: true

    TextField {
        id: loginInput

        placeholderText: "Логин"
        placeholderTextColor: borderLoginColor

        color: "black"
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 3

        background: Rectangle {
                color: "transparent"
                border.color: "transparent"
            }
    }

}
