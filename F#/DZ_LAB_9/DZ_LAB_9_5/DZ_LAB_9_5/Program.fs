//Разработать программу, на главной форме разместить
//поле для ввода и индикатор хода загрузки. По мере ввода текста
//в поле ввода заполняется индикатор.
open System 
open System.Windows.Forms
open System.Drawing 
open System.IO

let Form = new Form(Width= 250, Height = 100, Text = "LAB_5")

let checkBox1 = new CheckBox(AutoSize = true, Location = new Point(12, 12), Name = "checkBox1", TabIndex = 0, UseVisualStyleBackColor = true)
Form.Controls.Add(checkBox1)

let checkBox2 = new CheckBox(AutoSize = true, Location = new Point(12, 32), Name = "checkBox2", TabIndex = 0, UseVisualStyleBackColor = true)
Form.Controls.Add(checkBox2)

let button1 = new Button(Location = new Point(48, 12),Name = "button1",Size = new Size(150, 34),TabIndex = 2,Text = "Нажми на меня",UseVisualStyleBackColor = true)
Form.Controls.Add(button1)

let Msg _ = 
    let ans = (checkBox1.Checked,checkBox2.Checked)
    match ans with
    |(true,false) -> MessageBox.Show("Установлен первый флажок", "Сообщение") |> ignore
    |(false,true) -> MessageBox.Show("Установлен второй флажок", "Сообщение") |> ignore
    |(true,true) -> MessageBox.Show("Установлены оба флажка", "Сообщение") |> ignore
    |(false,false) -> MessageBox.Show("Флажки не установлены", "Сообщение") |> ignore
let _= button1.Click.Add(Msg)

[<EntryPoint>]
let main argv =
    do Application.Run(Form)
    0 // return an integer exit code