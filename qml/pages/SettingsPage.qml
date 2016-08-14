import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    PageHeader {
        title: "Settings"
    }
    Column {

        id: column
        anchors.topMargin: 200
        x: Theme.horizontalPageMargin
        width: parent.width
        anchors.fill: parent

        Label {

            width: parent.width
            x: Theme.horizontalPageMargin
            text: ("Change password")
        }
        Label {

            width: parent.width
            x: Theme.horizontalPageMargin
            text: ("")
        }


        TextField {
            id: password
            width: parent.width
            anchors { left: parent.left; right: parent.right }
            echoMode: TextInput.Password
            label: "Password"; placeholderText: label
            EnterKey.enabled: text || inputMethodComposing
            inputMethodHints: Qt.ImhDigitsOnly
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: confirmPassword.focus = true
        }

        TextField {
            width: parent.width
            id: confirmPassword
            anchors { left: parent.left; right: parent.right }
            echoMode: TextInput.Password; enabled: password.text || text
            errorHighlight: password.text != text
            label: "Confirm Password"
            placeholderText: label; opacity: enabled ? 1 : 0.5
            Behavior on opacity { FadeAnimation { } }
            EnterKey.enabled: text || inputMethodComposing
            EnterKey.highlighted: !errorHighlight
            inputMethodHints: Qt.ImhDigitsOnly
            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: {
                //TODO SetPasswd(text);
                if (password.text != confirmPassword.text)
                    return;

                console.log('Passwd set')
                fileManager.changeKey(password.text)
                password.text = confirmPassword.text = ''
                notification.publish()
                pageStack.pop()
            }
        }

        // EnterKey.iconSource: TODO: Крутую иконку
    }
}



