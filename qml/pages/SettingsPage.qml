import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    PageHeader {
        title: "Settings"
    }
    Column {
        anchors.fill: parent

        TextField {
            id: textField
            width: parent.width
            focus: true
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
                fileManager.changeKey(textField.text)

                textField.text = ''
                notification.publish()
                pageStack.pop()
            }
            EnterKey.enabled: text.length >= 6
//            EnterKey.iconSource: TODO: Крутую иконку

        }

    }

}

