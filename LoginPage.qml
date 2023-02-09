import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: _loginPage

    readonly property color loginPageColor: "#4C5DF1"
    readonly property color borderLoginColor: "#00D6C9"

    property int rectangleWith: 280
    property int rectangleHeight: 30
    property int rectangleRadius: 12

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: loginPageColor


        ColumnLayout {
            anchors.centerIn: parent


            Image {
                id: _logoImg

                source: "qrc:/img/logoChatMTUCI.png"
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 11

            }

            InputField {
                id: _loginInput
                placeHolder: "Логин"
                Layout.bottomMargin: 5

            }

            InputField {
                id: _login
                placeHolder: "Пароль"
                isPassword: true
                Layout.bottomMargin: 16
            }

            SetButton {
                text: "Войти"

            }

        }
    }





}
