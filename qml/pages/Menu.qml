import QtQuick 2.2
import Sailfish.Silica 1.0
Page {
    id: mainPage
    SilicaListView {
        header: PageHeader { title: qsTr("Menu") }
        anchors.fill: parent
        delegate: ListItem {
            Label {
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                text: model.name
            }
            onClicked: {
                pageStack.push(Qt.resolvedUrl(model.page + ".qml"));
                applicationWindow.currentPageName = model.name
            }
        }


        PullDownMenu {


            MenuItem {
                text: "Settings"
                onClicked: pageStack.replace(Qt.resolvedUrl("SettingsPage.qml"))
            }

            MenuItem {
                text: "About"
                onClicked: pageStack.replace(Qt.resolvedUrl("About.qml"))
            }
        }

        section {
            property: "category"
            criteria: ViewSection.FullString
            delegate: SectionHeader { text: section }
        }
        model: ListModel {
            ListElement {
                name: "Notes"
                page: "GridNotePage"

            }
            ListElement {
                name: "Photo"
                page: "Photo"

            }
            ListElement {
                name: "Other files"
                page: "Others"

            }


        }

        PushUpMenu {
            backgroundColor: "red"
            highlightColor: backgroundColor
            quickSelect: true

            MenuItem {
                text: "Log out"
                onClicked: {
                    //Lock()
                    console.log('Wanna Exit')
                    pageStack.replace(Qt.resolvedUrl("PinCodePage.qml"))
                } }
        }

        VerticalScrollDecorator { }
    }
}
