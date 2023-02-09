import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Item{
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
