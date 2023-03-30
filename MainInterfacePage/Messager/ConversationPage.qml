import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Item{
    anchors.fill: parent
    id: messagesField
    function clear(){
        messagesModel.clear()
    }

    Connections {
        target: backend
        function onClearMessages() {messagesModel.clear()}
        function onAddMessage(data) {
            var count = messagesModel.count
            var lastItem = messagesModel.get(0)
            messagesModel.insert(0, {
                                     "message": data[0],
                                     "fromID": data[1],
                                     "fromName": data[2],
                                     "avatar": data[3],
                                     "time": data[4],
                                     "isMyMessage": data[1] === backend.myID(),
                                     "isBackConnected": count > 0 ? data[1] === lastItem.fromID : false,
                                     "isForwardConnected": false
                                })
            if (count > 0)
                lastItem.isForwardConnected = messagesModel.get(0).isBackConnected
        }
    }

    ListModel{
        id: messagesModel
    }

    ListView{
        id: view
        verticalLayoutDirection: ListView.BottomToTop
//        cacheBuffer: 20
////        flickDeceleration: -10000
////        maximumFlickVelocity: 1
//        onVerticalVelocityChanged: {
//            console.log(verticalVelocity)
//        }

        anchors.fill: parent
        model:messagesModel
        spacing: 3
        clip: true
//        interactive: false
        MouseArea {
            anchors.fill: parent
            onWheel: {
                var maxPos = 1 - scroll.visualSize
                if (scroll.position <= 0 && wheel.pixelDelta.y > 0) {
                    scroll.position = 0
                    return
                }
                if (scroll.position >= maxPos && wheel.pixelDelta.y < 0) {
                    scroll.position = maxPos
                    return
                }
                scroll.position -= wheel.pixelDelta.y/1000
            }
        }

        ScrollBar.vertical: ScrollBar{
            id: scroll
            stepSize: 0.0001
        }

        onCountChanged: {
            view.currentIndex = 0
        }

        delegate: Item {
            id: messageDelegate
            width: messageText.width + 20
            height: messageText.height + 10

            Rectangle{
                id:background
                anchors.fill: parent
                radius: 10
                layer.enabled: true
                function init()
                {
                    if(isBackConnected)    setCorner_(corner.createObject(this), true)
                    if(isForwardConnected) setCorner_(corner.createObject(this), false)
                }
                function setCorner_(corner, isTop) {
                    if(isTop) corner.anchors.top = background.top
                    else      corner.anchors.bottom = background.bottom

                    if(isMyMessage) corner.anchors.right = background.right
                    else            corner.anchors.left  = background.left
                }

                Component{
                    id: corner
                    Rectangle{
                        width: 10
                        height: 10
                        color: background.color
                    }
                }
            }
            Component.onCompleted: {
                background.init()
                if(isMyMessage) {
                    anchors.right = parent.right
                    anchors.rightMargin = 10
                    background.color = "#00A3FF"
                }else{
                    anchors.left = parent.left
                    anchors.leftMargin = 16
                    background.color = "white"
                    background.opacity = 0.12
                }
            }
            property bool isForwConn_: isForwardConnected
            onIsForwConn_Changed: background.init()

            TapHandler{
                onTapped: {
                    console.log(fromID, isBackConnected, isForwardConnected)
                }
            }
            Text {
                id: messageText
                anchors.centerIn: parent
                text: message
                font.pointSize: 13
                color: "white"
                wrapMode: Text.WordWrap
                onContentWidthChanged: {
                    if(contentWidth > messagesField.width * 0.4){
                        width = messagesField.width * 0.4
                    }
                }
            }
<<<<<<< HEAD
            Text {
                id: messageTime
                anchors.right: messageText.right
                anchors.bottom: messageText.bottom
                textFormat: Text.RichText
                text: "<small><i>" + parseMessageTime(time)
                font.pointSize: 13
                color: "white"
=======

            MouseArea {
                id: itemMouseArea
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.WhatsThisCursor
                propagateComposedEvents: true

                onReleased: {
                    if (mouse.button & Qt.RightButton) {
                        contextMenu.popup()
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onWheel: {
                var maxPos = 1 - scroll.visualSize

                if (scroll.position <= 0 && wheel.pixelDelta.y > 0) {
                    scroll.position = 0
                    return
                }
                if (scroll.position >= maxPos && wheel.pixelDelta.y < 0) {
                    scroll.position = maxPos
                    return
                }
                scroll.position -= wheel.pixelDelta.y/1000
>>>>>>> parent of dd2c41f... Merge branch 'ui' into alfa_version
            }
        }
    }
}

