//№11
(*let input=
    let a = System.Console.ReadLine()
    if ((a = "Prolog") ||(a = "F#" )) then System.Console.WriteLine("Подлиза")
    else System.Console.WriteLine("Харош");;*)
//№12
[<EntryPoint>]
//#12.1 
(*let main argv =
    match System.Console.ReadLine() with
    |"Prolog"->System.Console.WriteLine("Подлиза")
    |"F#"->System.Console.WriteLine("Подлиза")
    | _->System.Console.WriteLine("ХАРОШ")
    *)
//#12.2
(*let main arvg=
    System.Console.WriteLine(System.Console.ReadLine() |> (fun x -> if (x = "Prolog")||(x = "F#") then "Подлиза" else "ХАРОШ"))
    *)
    0 // return an integer exit code
