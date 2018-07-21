import QtQuick 2.9
import QtQuick.Controls 2.2

Rectangle {
    id: root
    signal moreClicked()
    Image{
        id: photo1
        source: "qrc:/photo1.png"
        anchors{left: parent.left; top: parent.top; bottom: parent.bottom}
        fillMode: Image.PreserveAspectCrop
        width: 100
    }

    Label{
        id: nameLabel
        text: "Alexander Pinkman"
        anchors{left: photo1.right; leftMargin: 10; top: parent.top; topMargin: 10}
        font{family: "Arial"; pixelSize: 20}
    }
    Label{
        id: titleLabel
        text: "Senior Software Engineer"
        anchors{left: nameLabel.left; top: nameLabel.bottom; topMargin: 5; right: parent.right}
        font{family: "Arial"; pixelSize: 13}
        wrapMode: Text.WordWrap
        color: "#6a6a6a"
    }
    Label{
        id: companyLabel
        text: "Apple Inc. Ltd."
        anchors{left: nameLabel.left; top: titleLabel.bottom; topMargin: 0; right: parent.right}
        font{family: "Arial"; pixelSize: 13}
        wrapMode: Text.WordWrap
        color: "#6a6a6a"
    }
    Label{
        id: emailLabel
        text: "alex.pinkm@apple.com"
        anchors{left: nameLabel.left; top: companyLabel.bottom; topMargin: 0; right: parent.right}
        font{family: "Arial"; pixelSize: 13}
        wrapMode: Text.WordWrap
        color: "#6a6a6a"
    }
    Image{
        source: "qrc:/more.svg"
        anchors{right: parent.right; bottom: parent.bottom; rightMargin: 10; bottomMargin: 0}
        MouseArea{
            anchors.fill: parent
            onClicked: root.moreClicked();
        }
    }
}
