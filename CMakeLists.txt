cmake_minimum_required(VERSION 3.16)

project(BryanQML VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON) # 开启MetaObject Compile
set(CMAKE_AUTORCC ON) # 开启Resource Compile
set(CMAKE_AUTOUIC ON) # 开启QWidget的.ui文件 compile

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Widgets)

qt_standard_project_setup()

qt_add_executable(appBryanQML
    main.cpp
    Application.h Application.cpp
    bryanqml.qrc
)

qt_add_qml_module(appBryanQML
    URI BryanQML
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES BaseControlsPage.qml
    SOURCES settingsPage.h settingsPage.cpp
    QML_FILES BaseScrollViewPage.qml
    # RESOURCES bryanqml.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appBryanQML PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBryanQML
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appBryanQML
    PRIVATE Qt6::Quick Qt6::Widgets
)

include(GNUInstallDirs)
install(TARGETS appBryanQML
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
