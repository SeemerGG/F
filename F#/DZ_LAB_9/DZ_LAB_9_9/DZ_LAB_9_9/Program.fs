open System
open System.Drawing
open System.Windows.Forms

open System
open System.Drawing
open System.Windows.Forms

let form = new Form(Width= 350, Height = 200, Visible = true, Text = "Кортежи в F#")

let button1 = new Button(Location = new Point(208, 43), Name = "button1", Size = new Size(98, 68), TabIndex = 2, Text = "Посчитать", UseVisualStyleBackColor = true)

let textBox1 = new TextBox(Location = new Point(4, 44) ,Name = "textBox1", Size = new Size(198, 23), TabIndex = 3)

let label1 = new Label(AutoSize = true, Location = new Point(4, 26), Name = "label1", Size = new Size(110, 15), TabIndex = 4, Text = "A")
           
let label3 = new Label(AutoSize = true, Location = new Point(4, 70), Name = "label3", Size = new Size(38, 15), TabIndex = 8, Text = "Ответ")
           
let textBox3 = new TextBox(Location = new Point(4, 88), Name = "textBox3", Size = new Size(198, 23), TabIndex = 7)

form.Controls.Add(button1)
form.Controls.Add(textBox1)
form.Controls.Add(label1)
form.Controls.Add(label3)
form.Controls.Add(textBox3)

let Ans _ =
    let A =textBox1.Text
    let A_list =A.Split(' ')
    let Ans = Seq.fold (fun s x -> s + string (Math.Pow(int x, 2)) + " ") "" A_list
    textBox3.Text <- Ans
    

button1.Click.Add(Ans)

[<EntryPoint>]
let main argv =
    do Application.Run(form)
    0 // return an integer exit code

