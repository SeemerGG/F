open System
open System.Windows
open System.Windows.Controls
open System.Windows.Markup

let mwXaml = "
        <Window
        	xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'
        	xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml' Title='F# WPF' Height='180' Width='320'>
        	<Grid>
        		<Grid.ColumnDefinitions>
        			<ColumnDefinition Width='320*' />
        		</Grid.ColumnDefinitions>
                <Grid.RowDefinitions>
                    <RowDefinition Height='140*' />
                    <RowDefinition Height='140*' />
                </Grid.RowDefinitions>
                
                <Button Name='button1' Margin='35,20,0,0'  Grid.Column='0' Grid.Row='0' Content='Нажми на меня' Height='35' HorizontalAlignment='Left' VerticalAlignment='Top' Width='95' />
        		<CheckBox Content='' HorizontalAlignment='Left' Margin='10,20,0,0' Name='checkBox1' VerticalAlignment='Top' Grid.ColumnSpan='2' IsChecked='False'/>
                <CheckBox Content='' HorizontalAlignment='Left' Margin='10,40,0,0' Name='checkBox2' VerticalAlignment='Top' Grid.ColumnSpan='2' IsChecked='False'/>
        		
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

let Msg eventArgs =
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

