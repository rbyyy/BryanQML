#ifndef APPLICATION_H
#define APPLICATION_H

#include <QApplication>
#include <QQmlEngine>
#include <QQuickWindow>

// 应用主控制器，管理整个应用的生命周期以及一些全局的配置
class Application : public QApplication
{
    Q_OBJECT
public:
    Application(int &argc, char **argv);
    ~Application();

    static Application* getInstance();

    // 设置全局QML上下文参数
    void setContextProperty(const QString &name, const QVariant &data);

    // 设置全局QML上下文参数
    void setContextProperty(const QString &name, QObject *data);

    // 启动应用
    int Launch();

    Q_INVOKABLE void showPopup(const QString &message);

    Q_INVOKABLE void strWidth(const QString &str);


signals:

    void iValueChanged();

private:
    // QML解释器
    QQmlEngine *m_qmlEngine = nullptr;

    // 主窗口
    QQuickWindow *m_mainWindow = nullptr;

};

#endif // APPLICATION_H
