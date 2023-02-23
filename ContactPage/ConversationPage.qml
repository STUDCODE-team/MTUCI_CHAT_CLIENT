import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Page {
    id: _root

    property string inConversationWith

    header: Label {
        ToolButton {
            text: qsTr("Back")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            onClicked: _root.StackView.view.pop()
            topPadding: 20
        }
        Label {
            id: _pageTitle
            text: inConversationWith
            font.pixelSize: 20
            anchors.centerIn: parent
            topPadding: 20
        }
    }

}
