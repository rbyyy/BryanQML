#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Application.h"

int main(int argc, char *argv[])
{
    Application app(argc, argv);

    // 启动应用
    int code = app.Launch();

    return code;
}
