import QtQuick 2.15
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // 不能使用anchors
    // 新建Popup默认不可见，可见方式有两种 1.visible设置为true 2.使用open方法
    Popup {
        id:idPopup
        x: (parent.width - 300)/2.0
        y: (parent.height - 300)/2.0
        width: 300
        height: 300
        // visible: true //默认为false

        // background: Rectangle { // 该属性和contentItem只能设置一个
        //     color: "grey"
        //     border.width: 8
        //     border.color: "#33FF0000" // ARGB
        // }

        contentItem: Rectangle { // 类型为Item
            anchors.fill: parent
            color: "lightblue"
            border.width: 8
            border.color: "#33FF0000" // ARGB

            Button {
                id:idButtonCancel
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.bottom: parent.bottom
                width: 100
                height: 60

                text: "Cancel"

                onClicked: {
                    idPopup.close();
                }
            }

            Button {
                anchors.right: idButtonCancel.left
                anchors.rightMargin: 30
                anchors.bottom: parent.bottom
                width: 100
                height: 60

                text: "Ok"
            }
        }

        // 是否为模态，为模态时，在popup以外的区域也不能操作其下面视图
        modal: true //false
        // 只可在非模态时有效果，
        // 为true时，非模态下，设置Overlay.modeless
        dim: true

        // 关闭策略
        closePolicy: Popup.CloseOnEscape

        // 设置popup以外部分的显示效果
        // modal: 模态
        // modeless: 非模态
        // Overlay的设置属性是Component
        Overlay.modal: Rectangle {
            color: "#3300FF00"

            // 可以在popup外围加视图
            Popup {
                width: parent.width
                height: 50
                visible: true
                closePolicy: Popup.CloseOnEscape

                contentItem: Rectangle {
                    anchors.fill: parent
                    color: "red"

                    Button {
                        id:idButtonInnerClose
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 30
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        width: 60

                        text: "Close"

                        onClicked: {
                            idPopup.close();
                        }
                    }
                }
            }
        }

        // Overlay.modeless: Rectangle {
        //     color: "#330000FF"
        // }

    }

    Button {
        id:idButtonOpen

        width: 100
        height: 60
        anchors.left: parent.left
        anchors.bottom: parent.bottom

        text: "Show"

        onClicked: {
            idPopup.open();
        }
    }

    Button {
        id:idButtonClose

        width: 100
        height: 60
        anchors.left: idButtonOpen.right
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom

        text: "Close"

        onClicked: {
            idPopup.close();
        }
    }
}
