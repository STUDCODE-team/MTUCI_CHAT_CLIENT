import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: _mainWindow
    width: 900
    height: 600
    visible: true
    title: qsTr("MTUCI Chat")

    ContactPage {

    }

    LoginPage {

    }



//    StackView {
//        id: _stackView
//        anchors.fill: parent
//        initialItem: ContactPage {}

//    }

}
