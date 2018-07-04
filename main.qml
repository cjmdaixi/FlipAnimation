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
        flipContent: Image{
            width: 300
            height: 300
            source: "qrc:/background.png"
            fillMode: Image.Stretch

            Button{
                id: btn
                text: "Button"
                anchors{horizontalCenter: parent.horizontalCenter; top: parent.top; topMargin: 15}
            }
            RadioButton{
                text: "Radio"
                anchors{horizontalCenter: parent.horizontalCenter; top: btn.bottom; topMargin: 15}
            }
        }
        coverItem: Rectangle{
            color: "yellow"
            anchors.fill: parent
        }
    }

    Rectangle{
        width: parent.width
        height: 5
        color: "blue"
        anchors{left: parent.left; right: parent.right}
        y: fliper.height + 20
        Behavior on y{
            NumberAnimation{duration: 300}
        }

        MouseArea{
            anchors.fill: parent
            onClicked: fliper.fold();
        }
    }
}
