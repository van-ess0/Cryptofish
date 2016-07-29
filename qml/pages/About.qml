import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.fill: parent
        PageHeader {
            title: "About"
        }


        Label {
            anchors.topMargin: 100
            x: Theme.horizontalPageMargin
            text: ("CryptoFish")
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }
        Label {
            x: Theme.horizontalPageMargin
            text: ("Безопасное хранилище Вашей информации")
            wrapMode: Text.Wrap

            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }

        }

    }
}
