
<<<<<<< HEAD
=======
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
>>>>>>> origin/master
