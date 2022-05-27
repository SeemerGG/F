open System
open System.Drawing
open System.Windows.Forms

let form = new Form(Width= 350, Height = 200, Visible = true, Text = "Кортежи в F#")

let button1 = new Button(Location = new Point(252, 23), Name = "button1", Size = new Size(76, 81), TabIndex = 2, Text = "Посчитать", UseVisualStyleBackColor = true)

let textBox1 = new TextBox(Location = new Point(48, 23) ,Name = "textBox1", Size = new Size(198, 23), TabIndex = 3)

let label1 = new Label(AutoSize = true, Location = new Point(4, 26), Name = "label1", Size = new Size(17, 15), TabIndex = 4, Text = "A")

let label2 = new Label(AutoSize = true, Location = new Point(4, 55), Name = "label2", Size = new Size(17, 15), TabIndex = 6, Text = "B")
           
let textBox2 = new TextBox( Location = new Point(48, 52), Name = "textBox2", Size = new Size(198, 23), TabIndex = 5)
           
let label3 = new Label(AutoSize = true, Location = new Point(4, 84), Name = "label3", Size = new Size(38, 15), TabIndex = 8, Text = "Ответ")
           
let textBox3 = new TextBox(Location = new Point(48, 81), Name = "textBox3", Size = new Size(198, 23), TabIndex = 7)

form.Controls.Add(button1)
form.Controls.Add(textBox1)
form.Controls.Add(label1)
form.Controls.Add(label2)
form.Controls.Add(textBox2)
form.Controls.Add(label3)
form.Controls.Add(textBox3)

let Ans _ =
    let A = textBox1.Text
    let B = textBox2.Text
    textBox3.Text <- String.filter (fun x -> String.exists (fun y -> x = y) A) B

button1.Click.Add(Ans)

[<EntryPoint>]
let main argv =
    do Application.Run(form)
    0 // return an integer exit code
