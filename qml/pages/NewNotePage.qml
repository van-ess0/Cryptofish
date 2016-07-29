import QtQuick 2.0
import Sailfish.Silica 1.0

<<<<<<< HEAD
<<<<<<< HEAD
Dialog {
    onAccepted: {
        console.log('Save text')
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
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            color: "transparent"

            TextEdit {
                id: noteTextField
                anchors.fill: parent
                anchors.topMargin: 40
                color: Theme.highlightColor
                font.pixelSize: 28
                wrapMode: TextEdit.WordWrap
            }
        }
=======
Page {
    PageHeader {
        title: "New Note"
=======
Dialog {
    DBManager {
       id: dbmanager
>>>>>>> 1ba584fed4c66a1281166803ffb12bece7443ce0
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

<<<<<<< HEAD
>>>>>>> nikita
=======
        Rectangle {
            anchors.fill: parent
            anchors.topMargin: 100
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            color: "transparent"

            TextEdit {
                id: noteTextField
                anchors.fill: parent
                anchors.topMargin: 40
                color: Theme.highlightColor
                font.pixelSize: 28
                wrapMode: TextEdit.WordWrap
            }
        }
>>>>>>> 1ba584fed4c66a1281166803ffb12bece7443ce0
    }
}
