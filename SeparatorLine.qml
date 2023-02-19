import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: separator
    implicitWidth: 1
    height: parent.height * 0.95
    gradient: Gradient{
        GradientStop{position: 0.0; color: Qt.rgba(1, 1, 1, 0.05)}
        GradientStop{position: 0.5; color: Qt.rgba(1, 1, 1, 0.20)}
        GradientStop{position: 1.0; color: Qt.rgba(1, 1, 1, 0.05)}
    }
}
