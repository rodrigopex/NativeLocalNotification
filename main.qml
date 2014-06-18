import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    statusBar: StatusBar {
        Label {
            id: statusMessage
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        Label {
            text: "Notification message"
        }
        TextField {
            id: notification
            Layout.fillWidth: true
            onAccepted: {
                notificationClient.notification = text
            }
        }
        Button {
            id: buttonSend
            text: "Send notification"
            Layout.fillWidth: true
            onClicked: {
                notificationClient.notification = notification.text
            }
            Connections {
                target: notificationClient
                onNotificationChanged: {
                    statusMessage.text = "Current notification: " + notification.text
                    notification.text = ""
                }
            }
        }
    }
}
