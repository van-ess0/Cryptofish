import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    anchors.fill: parent
    DBManager {
        id: dbmanager
    }
    property variant list: dbmanager.fetchAllFiles()
    SilicaGridView {

        anchors.fill: parent
        MouseArea {
            id: mouse_area1
            z: 1
            hoverEnabled: false
            onClicked : pageStack.replace(Qt.resolvedUrl("NewNotePage.qml"))
        }

        header: PageHeader { title: qsTr("Notes") }

        cellWidth: width / 2

        cellHeight: cellWidth
        delegate: Label {
            width: GridView.view.cellWidth
            height: GridView.view.cellHeight
            text: (list[model.index])
            color: Theme.highlightColor
            font.pixelSize: 40
            wrapMode: TextEdit.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

        }



        model: list.length

        VerticalScrollDecorator { }

        PullDownMenu {
            backgroundColor: "green"
            highlightColor: backgroundColor
            quickSelect: true

            MenuItem {
                text: "New note"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("NewNotePage.qml"))
                    console.log(qsTr("Option clicked"))
                }
            }
        }
    }
}
