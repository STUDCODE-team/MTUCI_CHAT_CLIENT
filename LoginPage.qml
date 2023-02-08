import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: _loginPage

    readonly property color loginPageColor: "#4C5DF1"
    readonly property color borderLoginColor: "#00D6C9"



    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: loginPageColor


        ColumnLayout {


            anchors.centerIn: parent

            Image {

            }

            InputLogin {
                id: _loginRect
            }

            InputLogin {

            }
        }
    }





}
