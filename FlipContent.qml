import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    width: 300
    height: 450
    signal lessClicked()
    Image{
        id: photo
        anchors{top: parent.top; left: parent.left; right: parent.right}
        height: 150
        source: "qrc:/photo2.png"
        fillMode: Image.PreserveAspectCrop
    }

    Image{
        id: facebookIcon
        source: "qrc:/icon_facebook.svg"
        anchors{right: photo.right; rightMargin: 20; verticalCenter: photo.bottom}
        sourceSize: Qt.size(40, 40)
    }

    Image{
        id: twitterIcon
        source: "qrc:/icon_twitter.svg"
        anchors{right: facebookIcon.left; rightMargin: 10; verticalCenter: photo.bottom}
        sourceSize: Qt.size(40, 40)
    }

    Label{
        id: nameLabel
        text: "Alexander Pinkman"
        anchors{left: parent.left; top: photo.bottom; leftMargin: 10; topMargin: 10; right: parent.right}
        font{family: "Arial"; pixelSize: 20}
    }

    GridLayout{
        id: gridLayout
        columns: 2
        anchors{left: nameLabel.left; top: nameLabel.bottom; right: parent.right; bottom: moreButton.top; margins: 5; topMargin: 10}
        rowSpacing: 10
        columnSpacing: 10
        Label{
            text: "Title:"
            font{family: "Arial"; pixelSize: 15}
            wrapMode: Text.WordWrap
            color: "black"
        }

        Label{
            id: titleLabel
            text: "Senior Software Engineer"

            font{family: "Arial"; pixelSize: 13}
            wrapMode: Text.WordWrap
            color: "#6a6a6a"
            Layout.fillWidth: true
        }
        Label{
            text: "Company:"
            font{family: "Arial"; pixelSize: 15}
            wrapMode: Text.WordWrap
            color: "black"
        }

        Label{
            id: companyLabel
            text: "Apple Inc. Ltd."
            font{family: "Arial"; pixelSize: 13}
            wrapMode: Text.WordWrap
            color: "#6a6a6a"
            Layout.fillWidth: true
        }
        Label{
            text: "Email:"
            font{family: "Arial"; pixelSize: 15}
            wrapMode: Text.WordWrap
            color: "black"
        }

        Label{
            id: emailLabel
            text: "alex.pinkm@apple.com"
            font{family: "Arial"; pixelSize: 13}
            wrapMode: Text.WordWrap
            color: "#6a6a6a"
            Layout.fillWidth: true
        }
        Label{
            text: "Address:"
            font{family: "Arial"; pixelSize: 15}
            wrapMode: Text.WordWrap
            color: "black"
        }

        Label{
            id: addressLabel
            text: "Apple Campus, Cupertino, CA 95014, USA"
            font{family: "Arial"; pixelSize: 13}
            wrapMode: Text.WordWrap
            color: "#6a6a6a"
            Layout.fillWidth: true
        }

        Label{
            text: "Phone:"
            font{family: "Arial"; pixelSize: 15}
            wrapMode: Text.WordWrap
            color: "black"
        }

        Label{
            id: phoneLabel
            text: "800–692–7753"
            font{family: "Arial"; pixelSize: 13}
            wrapMode: Text.WordWrap
            color: "#6a6a6a"
            Layout.fillWidth: true
        }
        Label{
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 7
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            font{family: "Arial"; pixelSize: 25; italic: true}
            text: "\"Stay hungry, stay foolish.\"  -- Steve Jobs"
            wrapMode: Text.WordWrap
        }
    }



    Image{
        id: moreButton
        source: "qrc:/more.svg"
        anchors{right: parent.right; bottom: parent.bottom; rightMargin: 10; bottomMargin: 0}
        MouseArea{
            anchors.fill: parent
            onClicked: root.lessClicked();
        }
    }
}
