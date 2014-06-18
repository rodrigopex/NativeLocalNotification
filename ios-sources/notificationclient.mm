/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtAndroidExtras module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "notificationclient.h"
#include <QDebug>

//#include <QtAndroidExtras/QAndroidJniObject>

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

static AppDelegate *app;

NotificationClient::NotificationClient(QObject *parent)
    : QObject(parent)
{
    bool ok = (bool) connect(this, SIGNAL(notificationChanged()), this, SLOT(updateNotification()));
    qDebug() << "Connected? " << ok;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    app = [[AppDelegate alloc] init];
    [app setWindow:[[[UIApplication sharedApplication] delegate] window]];
    [[UIApplication sharedApplication] setDelegate:app];
}

void NotificationClient::setNotification(const QString &notification)
{
    if (m_notification == notification)
        return;

    m_notification = notification;
    emit notificationChanged();
}

QString NotificationClient::notification() const
{
    return m_notification;
}

#ifdef Q_OS_IOS
void NotificationClient::updateNotification()
{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];

    localNotif.alertBody = @"Testing notifications!";
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);

    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;

    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
    qDebug() << "Show notification!!!";
}
#else
void NotificationClient::updateAndroidNotification()
{
    QAndroidJniObject javaNotification = QAndroidJniObject::fromString(m_notification);
    QAndroidJniObject::callStaticMethod<void>("org/qtproject/example/notification/NotificationClient",
                                       "notify",
                                       "(Ljava/lang/String;)V",
                                       javaNotification.object<jstring>());
}
#endif
