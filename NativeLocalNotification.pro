include(deployment.pri)

TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

HEADERS += \
    notificationclient.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.

android {
    #message(Running Android condiguration...)
    QT += androidextras
    SOURCES += android-sources/notificationclient.cpp
    OTHER_FILES += \
        android-sources/src/org/qtproject/example/notification/NotificationClient.java \
        android-sources/AndroidManifest.xml
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources
}

ios {
    #message(Running iOS condiguration...)
    OBJECTIVE_SOURCES += \
        ios-sources/notificationclient.mm \
        ios-sources/AppDelegate.mm
    OBJECTIVE_HEADERS += \
        ios-sources/AppDelegate.h
}
