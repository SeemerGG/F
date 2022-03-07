//№11
(*let input=
    let a = System.Console.ReadLine()
    if ((a = "Prolog") || (a = "F#" )) then System.Console.WriteLine("Подлиза")
    else System.Console.WriteLine("Харош");;*)
//#13
(*
let mult n=
    match n with
    |0->0
    | _->
        let rec mult_c1 n=
            if n = 0 then 1
            else (n % 10) * mult_c1 (n / 10)
        mult_c1 n

let mult_c_t n=
    match n with
    |0->0
    | _->
    let rec mult_c_t1 acc n=
        if n = 0 then acc
        else mult_c_t1 (acc * (n % 10)) (n / 10)
    mult_c_t1 1 n

let min_c_t n=
    let rec min_c1 c d max=
        let new_d= c % 10
        let new_max= if max<new_d then max else new_d
        if c=0 then max
        else min_c1 (c / 10) new_d new_max
    min_c1 n 0 9

let min_c n=
    let rec create_list n list=
       if n = 0 then list 
       else create_list (n / 10) ((n % 10)::list)
    List.min (create_list n [])
        
let max_c_t n=
    let rec max_c1 c d max=
        let new_d= c % 10
        let new_max= if max>new_d then max else new_d
        if c=0 then max
        else max_c1 (c / 10) new_d new_max
    max_c1 n 0 0  
     
let max_c n=
    let rec create_list n list=
       if n = 0 then list 
       else create_list (n / 10) ((n % 10)::list)
    List.max (create_list n [])

let output=
    let n=System.Convert.ToInt32(System.Console.ReadLine()) in
    System.Console.WriteLine(mult n)
    System.Console.WriteLine(mult_c_t n)
    System.Console.WriteLine(max_c_t  n)
    System.Console.WriteLine(min_c_t  n)
    System.Console.WriteLine(min_c  n)
    System.Console.WriteLine(max_c  n);;
*)


    
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
