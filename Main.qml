import QtQuick 2.15
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Repeater {
        id:idRepeater
        model: 10
        delegate: Text {
            x: 50 * index + 20
            y: 30
            text: "Hello"
        }
    }

    // BaseControlsPage {
    //     anchors.fill: parent
    // }

    // BaseScrollViewPage {
    //     anchors.fill: parent
    // }

    // Label {
    //     width: 200
    //     height: 30
    //     background: Rectangle {
    //         color: "lightblue"
    //         border.width: 2
    //         border.color: "red"
    //     }
    //     leftInset: 20
    //     text: "Test Label Inset"
    // }

    Text {
        id: idTextTest
        text: qsTr("- -")
        font.pixelSize: 28

        // 文本的最大宽度
        Component.onCompleted: {
            console.log("idTextTest width: " + width)
        }
    }

    Image {
        id:idImageTest
        width: 400
        height: 400
        source: "qrc:/images/login_left.png"
        sourceSize: Qt.size(100, 100) // 设置源图片的大小·
        sourceClipRect: Qt.rect(0, 0, 400, 400) // 从左上角开始，裁剪200*400的区域
        fillMode: Image.PreserveAspectCrop
    }

    AnimatedImage {
        id:idAnimatedImage
        width: 400
        height: 400
        source: "qrc:/images/animation.gif"
        fillMode: Image.PreserveAspectCrop
    }

    // Text {
    //     id: idTextOuter
    //     width: 0
    //     height: 30
    //     elide: Text.ElideRight
    //     text: qsTr("texttexttexttexttexttexttexttexttexttexttexttexttexttex")

    //     Text {
    //         id:idTextInner
    //         text: idTextOuter.text
    //         visible: false

    //         onWidthChanged: {
    //             console.log("idTextInner width: " + width)
    //             if (width > 200) {
    //                 idTextOuter.width = 200;
    //             } else {
    //                 idTextOuter.width = width;
    //             }
    //         }
    //     }
    // }



    // ****************************************************    Popup下面有background和contentItem
    // ****************************************************    Popup视图和contentItem之间有padding
    // ** b                                              **
    // ** a *******************************************  **
    // ** c *                                         *  **
    // ** k *                                         *  **
    // ** g *                                         *  **
    // ** r *               contentItem               *  **
    // ** o *                                         *  **
    // ** u *                                         *  **
    // ** n *                                         *  **
    // ** d *                                         *  **
    // **   *                                         *  **
    // **   *                                         *  **
    // **   *******************************************  **
    // **                                                **
    // ****************************************************
    // ****************************************************

    // 不能使用anchors
    // 新建Popup默认不可见，可见方式有两种 1.visible设置为true 2.使用open方法
    Popup {
        id:idPopup
        x: (parent.width - 300)/2.0
        y: (parent.height - 300)/2.0
        width: 300
        height: 300
        // visible: true //默认为false

        background: Rectangle { // 该属性和contentItem只能设置一个
            color: "grey"
            border.width: 2
            border.color: "#33FF0000" // ARGB
        }

        contentItem: Rectangle { // 类型为Item
            anchors.fill: parent
            color: "lightblue"
            // border.width: 8
            // border.color: "#33FF0000" // ARGB

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
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

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

    function openPopup(message) {
        idPopup.open();
    }
}
