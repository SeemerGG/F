open System

let rec input_list n=
    if n = 0 then []
    else 
        let head = Convert.ToInt32(Console.ReadLine())
        let tail = input_list (n - 1)
        head::tail

let rec output_list (list:int list) =
    match list with
    |[] -> None
    |h::t-> Console.Write("{0} ", h)
            output_list t
    
let del_ch (n:float) (avg:float) list_i list =
    if List.exists(fun x -> (snd x % n = 0.0) && (fst x % 2 = 0)) list_i && List.forall(fun x -> if (x<avg) && (x % n = 0) then false else true) list then true else false
    
let del_list_sum n (list:float list)=
    let avg = List.average list
    let rec obhod (i:int) (sum:int) =
        if n < i then sum
        else (if (n % i = 0) && (del_ch i avg (List.indexed list) list) then obhod (i + 1) (sum + i) else obhod (i + 1) sum)
    obhod 2 0

let zad list =
    let list_float = List.map(fun x  -> float x) list
    List.sortBy (fun x -> del_list_sum x list_float) list
   
[<EntryPoint>]
let main argv =
    let list = input_list (Convert.ToInt32(Console.ReadLine()))
    list |> zad |> output_list |> ignore
    0
