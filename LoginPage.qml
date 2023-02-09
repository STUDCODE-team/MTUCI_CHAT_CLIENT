import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

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
        LinearGradient{
            anchors.fill: parent
            source: parent
            start: Qt.point(0,0)
            end: Qt.point(200, 300)
            gradient: Gradient{
                GradientStop{position: 0.0; color: "#515DC7"}
                GradientStop{position: 1.0; color: "#2636C5"}
            }
        }

        ColumnLayout {
            anchors.centerIn: parent
            Item{
                width: 130
                height: 130
                Layout.alignment: ColumnLayout.Center
                Image {
                    id: icon
                    anchors.fill: parent
                    source: "qrc:/img/icon.png"
                    smooth: true
                }
                FastBlur{
                    anchors.fill: icon
                    source: icon
                    radius: 3
                }
            }


            InputField {
                id: _loginInput
                placeHolder: "Логин"
            }

            InputField {
                id: _login
                placeHolder: "Пароль"
                isPassword: true
            }

            SetButton {
                text: "Войти"

            }

        }
    }





}
