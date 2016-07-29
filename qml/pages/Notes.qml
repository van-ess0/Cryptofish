import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        header: PageHeader { title: qsTr("Notes") }
        anchors.fill: parent

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
