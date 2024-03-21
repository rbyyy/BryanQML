import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 320
    height: 480

    focus: true
    Keys.enabled: true
    Keys.onEscapePressed: {
        Qt.quit();
    }
    Keys.forwardTo: [idTextMove, button]

    Text {
        id:idTextMove
        x: 20
        y: 20
        width: 200
        height: 30
        text: qsTr("Moving Text")
        color: "blue"
        font {bold: true; pixelSize: 20;}
        Rectangle {
            id:idRectTextMove
            anchors.fill: parent
            color: "transparent"
        }
        Keys.enabled: true
        Keys.onPressed: (event)=>{
            switch(event.key) {
            case Qt.Key_Left:
                x -= 10;
                break;
            case Qt.Key_Right:
                x += 10;
                break;
            case Qt.Key_Up:
                y -= 10;
                break;
            case Qt.Key_Down:
                y += 10;
                break;
            case Qt.Key_Tab:
                idTextMove.focus = false;
                button.focus = true;
                button.forceActiveFocus();
                break;
            default:
                break;
            }
            event.accepted = true;
        }
        state: focus ? "highlighted" : "Normal"

        states: [
            State {
                name: "Normal"
                when: !idTextMove.activeFocus
                PropertyChanges {
                    target: idRectTextMove
                    border.width: 1
                    border.color: "transparent"
                }
            },
            State {
                name: "highlighted"
                when: idTextMove.activeFocus
                PropertyChanges {
                    target: idRectTextMove
                    border.width: 1
                    border.color: "blue"
                }
            }
        ]
    }

    Button {
        id: button
        text: "Hello"
        font.pixelSize: 20
        anchors.centerIn: parent
        contentItem: Text {
            text: button.text
            font: button.font
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
            id:idRectButton
            anchors.fill: parent
            color: "transparent"
            border.width: 1
            border.color: "red"
        }
        Keys.enabled: true
        Keys.onPressed: (event)=>{
            switch(event.key) {
            case Qt.Key_Tab:
                button.focus = false;
                idTextMove.focus = true;
                break;
            case Qt.Key_Enter:
                console.log("Enter");
                break;
            case Qt.Key_Return:
                console.log("Return");
                break;
            default:
                break;
            }
            event.accepted = true;
        }
        state: focus ? "highlighted" : "Normal"

        states: [
            State {
                name: "Normal"
                when: !button.activeFocus
                PropertyChanges {
                    target: idRectButton
                    border.width: 1
                    border.color: "transparent"
                }
            },
            State {
                name: "highlighted"
                when: button.activeFocus
                PropertyChanges {
                    target: idRectButton
                    border.width: 1
                    border.color: "blue"
                }
            }
        ]


        onClicked: {
            console.log("Clicked")
            app.showPopup("123");

            var person = Object(); // 对象定义
            person.name = "张三"; // 对象属性 添加属性
            person.age = 20; // 对象属性
            console.log(person.name); // 对象属性 访问属性
            console.log(person.age); // 对象属性 访问属性
            console.log(person["name"]); // 对象属性 访问属性
            person["age"] = 30; // 对象属性 修改属性
            console.log(person.age); // 对象属性 访问属性
            console.log(person["age"]); // 对象属性 访问属性
            person.printInfo = function () { // 对象方法 添加方法
                console.log("姓名：" + this.name + " 年龄：" + this.age);
            }
            person.printInfo(); // 对象方法 调用方法

            var person1 = {
                name: "李四",
                age: 25,
                printInfo: function () {
                    console.log("姓名：" + this.name + " 年龄：" + this.age);
                }
            }

            // 对象是否拥有属性
            var owned = person.hasOwnProperty("age");
            console.log("hasOwnProperty---:", owned);

            // 用于判断一个对象是否是另一个对象的原型
            var proType = Object.prototype.isPrototypeOf(person);
            console.log("isPrototypeOf---:", proType);

            function Human() {

            }
            var human = new Human();
            var humanType = Human.prototype.isPrototypeOf(human);
            console.log("Human isPrototypeOf human---:", humanType);

            console.log(human instanceof Human);



            var aNum = 10;
            // 获取原始类型
            console.log(typeof aNum);

            var fn = function () {
                console.log("fn");
            }
            fn();

            var fnOne = (a, b)=> {
                console.log(a + b)
            }
            fnOne(1, 2);

        }
    }

}
