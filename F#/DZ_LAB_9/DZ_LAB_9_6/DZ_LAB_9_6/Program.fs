open System
open System.Windows
open System.Windows.Controls
open System.Windows.Markup

let mwXaml = "
    <Window 
        xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'
        xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml'
        xmlns:d='http://schemas.microsoft.com/expression/blend/2008'
        xmlns:mc='http://schemas.openxmlformats.org/markup-compatibility/2006'
        xmlns:local='clr-namespace:DZ_LAB_9_6'
        mc:Ignorable='d'
        Title='LAB_6' Height='130' Width='200'>
    <Grid Margin='0,0,0,9'>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width='0*'/>
            <ColumnDefinition/>
        </Grid.ColumnDefinitions>
        <CheckBox Content='' HorizontalAlignment='Left' Margin='10,20,0,0' Name='checkBox1' VerticalAlignment='Top' Grid.ColumnSpan='2' IsChecked='False'/>
        <CheckBox Content='' HorizontalAlignment='Left' Margin='10,40,0,0' Name='checkBox2' VerticalAlignment='Top' Grid.ColumnSpan='2' IsChecked='False'/>
        <Button Content='Нажми на меня' HorizontalAlignment='Left' Margin='35,20,0,0' Name='button2' VerticalAlignment='Top' Height='35' Width='95' Grid.ColumnSpan='2'/>

    </Grid>
</Window>
    "
let getWindow(mwXaml) =
    let xamlObj=XamlReader.Parse(mwXaml)
    xamlObj :?> Window

let win = getWindow(mwXaml)

    
let checkBox1 = win.FindName("checkBox1") :?> CheckBox
let checkBox2 = win.FindName("checkBox2") :?> CheckBox
let button1 = win.FindName("button1") :?> Button
let Msg _ = 
    let ans = (checkBox1.IsChecked.Value,checkBox2.IsChecked.Value)
    match ans with
    |(true,false) -> MessageBox.Show("Установлен первый флажок", "Сообщение") |> ignore
    |(false,true) -> MessageBox.Show("Установлен второй флажок", "Сообщение") |> ignore
    |(true,true) -> MessageBox.Show("Установлены оба флажка", "Сообщение") |> ignore
    |(false,false) -> MessageBox.Show("Флажки не установлены", "Сообщение") |> ignore

button1.Click.Add Msg


    

[<EntryPoint>]
[<STAThread>] 
let main argv =
    ignore <| (new Application()).Run win
    0
