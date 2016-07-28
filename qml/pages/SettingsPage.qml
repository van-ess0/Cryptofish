import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.notifications 1.0

Page {
    PageHeader {
        title: "Settings"
    }
    Column {
        anchors.fill: parent

        TextField {
            id: textField
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: TextInput.AlignHCenter
            inputMethodHints: Qt.ImhDigitsOnly
            height: parent / 5
            text: ''
            placeholderText: 'Set password'
            EnterKey.onClicked: {
                //TODO: SetPasswd()
                console.log('Passwd set')
                textField.text = ''
                notification.publish()
                pageStack.pop()
            }
            EnterKey.enabled: text.length >= 6
//            EnterKey.iconSource: TODO: Крутую иконку

        }

        Notification {
            id: notification
            category: "x-nemo.cryptofish"
            summary: qsTr("Password was changed")
            body: qsTr("Password was changed")
            appName: qsTr("Cryptofish")
            appIcon: "image://theme/icon-lock-information"
            previewSummary: qsTr("Password was changed")
            previewBody: qsTr("Password was changed")
            itemCount: 5
            onClicked: console.log("Clicked")
            onClosed: console.log("Closed, reason: " + reason)
        }


    }

}

