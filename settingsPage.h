#ifndef SETTINGSPAGE_H
#define SETTINGSPAGE_H

#include <QObject>

class SettingsPage : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE SettingsPage(QObject *parent = nullptr);
    ~SettingsPage();

signals:
};

#endif // SETTINGSPAGE_H
