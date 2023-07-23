import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "MainInterfacePage/"
import "LoginPage/"


ApplicationWindow {
    id: _mainWindow
    width: 900
    height: 600
    visible: true
    title: qsTr("MTUCI Chat [alfa 1.0]")


    ///
    ///\brief loadLastSession
    /// Функция вызывается при запуске приложения. Проверяет, был ли авторизован пользователь.
    /// Если на устройстве сохранен кэш от прошлого сеанса, то он будет загружен.
    /// Для получения пакетов в будет произведена неявная авторизация.
    ///\return
    ///
    function loadLastSession(){
        mainpageLoader.sourceComponent = loginPageComponent;

        if(backend.isLastSessionSaved()){
            mainpageLoader.sourceComponent = chatInterfaceComponent;
            mainpageLoader.item.init(backend.getLastSession());
            backend.implicitLogin();
        }
    }
    function enterChatInterface(){
        mainpageLoader.sourceComponent = chatInterfaceComponent;
    }
    Component.onCompleted: {
       loadLastSession()
    //   enterChatInterface()
    }
    ///
    ///
    ///
    Loader{
        anchors.fill: parent
        id: mainpageLoader
    }
    Component {
        id: loginPageComponent
        LoginPage {}
    }
    Component {
        id: chatInterfaceComponent
        MainInterfacePage{}
    }



    ///
    ///
    ///
}
