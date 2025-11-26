import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    title: qsTr("Solver")

    property int mSize: 3

    ScrollView {
        anchors.fill: parent
        anchors.margins: 10

        Rectangle { // Это прозрачный квадрат, он явно указывает ширину ScrollView. Без него центрирование не работает
            anchors.fill: parent
            color: "transparent"
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Label {
                    text: "Размер матрицы:"
                    font.pixelSize: 14
                }

                TextField {
                    id: matrixSize
                    placeholderText: "3"
                    text: "3"
                    Layout.preferredWidth: 80
                    horizontalAlignment: TextInput.AlignHCenter

                    onTextChanged: {
                        if (text !== "" && parseInt(text) > 0 && parseInt(text) < 10) {
                            mSize = parseInt(matrixSize.text)
                        }
                    }
                }
            }

            GridLayout{
                id: grid
                columns: mSize + 1
                rows: mSize
                width: parent.width - 20
                Layout.alignment: Qt.AlignHCenter
                Repeater{
                    model: mSize * (mSize + 1)
                    TextField {
                        // property int row: -1
                        // property int column: -1

                        Layout.preferredWidth: (grid.width - (grid.columns - 1) * grid.columnSpacing) / grid.columns
                        Layout.fillWidth: true

                        placeholderText: "0"
                        horizontalAlignment: TextInput.AlignHCenter
                        inputMethodHints: Qt.ImhPreferNumbers

                        background: Rectangle {
                            border.color: "#000"
                            color: {
                                if (index % (mSize + 1) < mSize) {
                                    return "#aad"
                                } else {
                                    return "#ada"
                                }
                            }
                            border.width: 1
                            radius: 3
                        }
                    }
                }
            }

            Button {
                text: "Решить!"
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 10
                font.pixelSize: 16

                onClicked: {
                    // TODO Решение
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter

                Label {
                    text: "Результат:"
                    font.bold: true
                    font.pixelSize: 16
                }

                TextArea {
                    id: resultArea
                    Layout.fillWidth: true
                    placeholderText: "Здесь появится решение..."
                    readOnly: true
                    wrapMode: TextArea.Wrap
                    font.pixelSize: 14
                    background: Rectangle {
                        color: "#f5f5f5"
                        radius: 5
                    }
                }
            }
        }
    }
}
