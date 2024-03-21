import QtQuick 2.15

Item {
    width: Screen.width
    height: Screen.height

    ListView {
        width: 200
        height: parent.height

        model: 10

        delegate: idComponentListViewDelegate
    }

    Component {
        id:idComponentListViewDelegate
        Rectangle {
            id:idRectangleItem
            width: 200
            height: 50
            color: "lightblue"
            border.color: "blue"
            border.width: 1
            Text {
                anchors.centerIn: parent
                text: "Item " + index
                color: idRectangleItem.ListView.isCurrentItem ? "black" : "red"
            }

            MouseArea {
                anchors.fill: parent

                hoverEnabled: true

                onEntered: {
                    idRectangleItem.color = "lightgreen"
                }

                onExited: {
                    idRectangleItem.color = "lightblue"
                }

                onClicked: {
                    idRectangleItem.ListView.view.currentIndex = index;
                }
            }
        }
    }

}
