import QtQuick 2.0
import Sailfish.Silica 1.0
Dialog {
    DBManager {
        id: dbmanager
    }

    onAccepted: {
        console.log('Save text')
        dbmanager.addFile(noteTextField.text)
        noteTextField.text = ""
    }

    // TODO: сдигать текст вверх на длинных нотах
    // TODO: добавить placeholder
    // TODO: сохранять текст

    Column {
        DialogHeader { }
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            anchors.topMargin: 100
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            color: "transparent"

            TextEdit {
                id: noteTextField
                anchors.fill: parent
                anchors.topMargin: 80
                color: Theme.highlightColor
                font.pixelSize: 36
                wrapMode: TextEdit.WordWrap
            }
        }
    }
}

