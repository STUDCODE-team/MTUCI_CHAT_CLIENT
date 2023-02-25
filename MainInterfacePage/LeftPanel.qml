import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Item {
    id: menuBar

    width: 58
    height: parent.height

    anchors.left: parent.left

    Image {
        id: profileSvg

        source: "/img/Profile.svg"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30

        width: 24
        height: 24
    }

    Image {
        source: "/img/chats.svg"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: profileSvg.bottom
        anchors.topMargin: 24

        width: 24
        height: 24
    }

    Image {
        source: "/img/Settings.svg"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 24

        width: 24
        height: 24
    }
}
