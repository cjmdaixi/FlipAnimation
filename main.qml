import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color: "grey"

    FlipCards{
        id: fliper
        anchors{horizontalCenter: parent.horizontalCenter; top: parent.top; topMargin: 10}
        flipContent: FlipContent{
            onLessClicked: {
                fliper.fold();
            }
        }
        coverItem: CoverItem{
            anchors.fill: parent
            onMoreClicked: {
                fliper.expand();
            }
        }
    }
}
