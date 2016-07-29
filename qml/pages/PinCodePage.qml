/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import com.filemanager 1.0
import org.nemomobile.notifications 1.0

Dialog {
    id: dialog

    onAccepted: {
        //TODO: Validate(passwdField.text)
        //TODO: Decrypt()
        console.log('Validated/Decrypted')
        pageStack.push(Qt.resolvedUrl("Menu.qml"))
    }

    FileManager {
        id: fileManager
        onResponseKey: {
            console.log(answer)
            if (answer){
                dialog.accept()
            }
            else {
                notification.publish()
            }
        }
    }

    Notification {
        id: notification
        category: "x-nemo.cryptofish"
        summary: qsTr("Password incorrect")
        body: qsTr("Password incorrect")
        appName: qsTr("Cryptofish")
        appIcon: "image://theme/icon-lock-information"
        previewSummary: qsTr("Password incorrect")
        previewBody: qsTr("Password incorrect")
        itemCount: 5
        onClicked: console.log("Clicked")
        onClosed: console.log("Closed, reason: " + reason)
    }

    Column {
        anchors.topMargin: 400
        x: Theme.horizontalPageMargin
        anchors.fill: parent

        PasswordField {
            id: passwdField
            placeholderText: 'Enter your PIN'
            text: ''
            focus: true
            horizontalAlignment: TextInput.AlignHCenter
            inputMethodHints: Qt.ImhDigitsOnly
            EnterKey.enabled: text.length >= 6
            EnterKey.iconSource: "image://theme/icon-m-enter-accept"
            EnterKey.onClicked: {
                console.log('Enter pressed')
                fileManager.verification(passwdField.text)
                passwdField.text = ''
            }

        }

//        Button {
//            text: ("Login")
//            anchors.horizontalCenter: parent.horizontalCenter
//            onClicked: {
//                console.log('Login Buttton pressed')
//                fileManager.verification(passwdField.text)
//                passwdField.text = ''
//            }
//        }
    }
}
