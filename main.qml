import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: _mainWindow
    width: 900
    height: 600
    visible: true
    title: qsTr("MTUCI Chat")

    ///
    ///\brief loadLastSession
    /// Функция вызывается при запуске приложения. Проверяет, был ли авторизован пользователь.
    /// Если на устройстве сохранен кэш от прошлого сеанса, то он будет загружен.
    /// Для получения пакетов в будет произведена неявная авторизация.
    ///\return
    ///
    function loadLastSession(){
        var loginPage = loginPageComponent.createObject(this)
        if(backend.isLastSessionSaved()){
            var chatInterface = chatInterfaceComponent.createObject(this)
            chatInterface.init(backend.getLastSession())
            backend.implicitLogin();
        }
    }
    Component.onCompleted: {
        loadLastSession()
    }
    Component {
        id: loginPageComponent
        LoginPage {}
    }
    Component {
        id: chatInterfaceComponent
        ContactPage {}
    }
}
