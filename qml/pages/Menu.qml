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
        section {
            property: "category"
            criteria: ViewSection.FullString
            delegate: SectionHeader { text: section }
        }
        model: ListModel {
            ListElement {
                name: "Notes"
                page: "Notes"

            }
            ListElement {
                name: "Photo"
                page: "Photo"

            }
            ListElement {
                name: "Other"
                page: "Others"

            }
            ListElement {
                name: "Settings"
                page: "SettingsPage"
            }
            ListElement {
                name: "About"
                page: "About"
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
