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
import "pages"
import com.filemanager 1.0
import org.nemomobile.notifications 1.0

ApplicationWindow
{
    Component.onDestruction: {
            console.log("BYE")
            fileManager.closing()
        }

    initialPage: PinCodePage { id: pinCodePage}

    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: Orientation.Portrait
    _defaultPageOrientations: Orientation.Portrait

    FileManager {
        id: fileManager
//        onResponseKey: {
//            console.log(answer)
//            if (answer){
//                dialog.accept()
//            }
//            else {
//                notification.publish()
//            }
//        }
        onPasswordChanged: {
            console.log("Password change result: " + answer)
            notification.publish()
        }
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


    onApplicationActiveChanged: {
        console.log(applicationActive);

        fileManager.closing()
        if (applicationActive == false) {
            pageStack.clear();
        }
        else if (pageStack.currentPage !== pinCodePage) {
            pageStack.push(Qt.resolvedUrl("pages/PinCodePage.qml"));
        }
    }
}


