import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../Controls/"

Page {
    id: _loginPage

    readonly property color loginPageColor: "#4C5DF1"

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        LinearGradient{
            anchors.fill: parent
            source: parent
            start: Qt.point(0,0)
            end: Qt.point(parent.width, parent.height)
            gradient: Gradient{
                GradientStop{position: 0.0; color: "#515DC7"}
                GradientStop{position: 1.0; color: "#2636C5"}
            }
        }
        ColumnLayout {
            anchors.centerIn: parent
            MTUCI_Icon {
                Layout.alignment: ColumnLayout.Center
                height: 130
                width: 130
            }
            InputField {
                id: login
                placeHolder: "Логин"
                Layout.bottomMargin: 5
            }
            InputField {
                id: password
                placeHolder: "Пароль"
                isPassword: true
                Layout.bottomMargin: 16
            }
            PushButton {
                id: loginButton
                text: "Войти"
                onClicked: {
                    //loginButton.startLoading() // process animation startes
                    backend.login(login.text, password.text)
                }
            }
            Text{
                id: errText
                visible: false
                color: "red"
                text: "Неверный логин или пароль"
            }
            Connections{
                target: backend
                function onLoginSucceed() {
//                    loginButton.stopLoading()

                    _mainWindow.enterChatInterface();
                }
                function onLoginFailed() {
//                    loginButton.stopLoading()
//                    errorMessage.showFailedData()
                    errText.visible = true
                }
                function onServerUnreachable() {
//                    loginButton.stopLoading()
                    errorMessage.showServerUnreachable()
                }
            }
        }
    }
}
