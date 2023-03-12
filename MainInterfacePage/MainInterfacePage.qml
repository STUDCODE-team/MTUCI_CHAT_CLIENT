import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Controls/"
import "./Messager/"


Rectangle {
    anchors.fill: parent
    function init(sessionInfo){
        console.log("[init session]", sessionInfo)
    }

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

//    LeftPanel{
//        id: menuBar
//    }

    SearchBlock {id: searchBlock}
    ///
    ///
    ///
    ///
    ///
    ChatListView {id: chatList}
    ///
    ///
    ///
    ///
    ///

    SeparatorLine {
        id: leftSep
//visible: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: chatList.left
    }
    SeparatorLine {
        id: rightSep
//        visible: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: chatList.right
    }

    SeparatorLine {
        id: topSep

        sepWidth: 560
        sepHeight: 1

        anchors.left: rightSep.right
        anchors.top: topMenu.bottom
        anchors.leftMargin: 12
        anchors.bottomMargin: 2
    }

    SeparatorLine {
        id: bottomSep

        sepWidth: 560
        sepHeight: 1

        anchors.left: rightSep.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 12
        anchors.bottomMargin: 48
    }

    TopMenu {
        id: topMenu
        title: chatList.getChatTitle()
        extraInfo: chatList.getExtraChatInfo()
    }
    BottomMenu {
        id: bottomMenu
    }

    Loader{
        anchors.top: topSep.bottom
        anchors.left: rightSep.right
        anchors.right: parent.right
        anchors.bottom: bottomMenu.top
        sourceComponent: ConversationPage{}
    }
}
