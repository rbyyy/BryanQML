#include "Application.h"
#include <QUrl>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QMetaObject>
#include "settingsPage.h"
#include <QFont>
#include <QFontMetrics>

Application::Application(int& argc, char** argv)
    : QApplication(argc, argv)
{
    m_qmlEngine = new QQmlEngine(this);
}

Application::~Application()
{

}

Application *Application::getInstance()
{
    return qobject_cast<Application*>(instance());
}

void Application::setContextProperty(const QString &name, const QVariant &data)
{
    m_qmlEngine->rootContext()->setContextProperty(name, data);
}

void Application::setContextProperty(const QString &name, QObject *data)
{
    m_qmlEngine->rootContext()->setContextProperty(name, data);
}

int Application::Launch()
{
    setContextProperty("app", this);

    QMetaObject obj = SettingsPage::staticMetaObject;
    auto sObj = obj.newInstance(Q_ARG(QObject*, this));

    const QUrl url(u"qrc:/BryanQML/Main.qml"_qs);
    // 创建主窗口
    QQmlComponent component(m_qmlEngine, url);
    auto s = component.errorString();
    m_mainWindow = qobject_cast<QQuickWindow*>(component.create());
    Q_ASSERT(m_mainWindow != nullptr);
    m_mainWindow->setScreen(QApplication::primaryScreen());
    m_mainWindow->setTitle("主界面");



    return exec();
}

void Application::showPopup(const QString &message)
{
    Q_ASSERT(m_mainWindow != nullptr);
    if (m_mainWindow != nullptr)
    {
        QMetaObject::invokeMethod(m_mainWindow, "openPopup", Q_ARG(QVariant, QVariant(message)));

    }
}

void Application::strWidth(const QString &str)
{
    QFont font;
    font.setFamily("Microsoft YaHei");
    font.setPixelSize(28);
    font.setWeight(QFont::Normal);
    QFontMetrics fm(font);
    QSize size = fm.size(Qt::TextSingleLine, str);
    qDebug() << "width: " << size.width();
}
