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

let del_ch n avg list =
    List.forall (fun x -> if (snd x % n = 0) && ((fst x % 2 = 0) || ((x<avg) && (snd x % n=0))) then false else true) list

let del_list n list=
    let avg = List.average list
    let rec obhod (i:int) (sum:int) =
        if n < i then sum
        else (if (n % i = 0) && (del_ch i avg (List.indexed list)) then obhod (i + 1) (sum + i) else obhod (i + 1) sum)
    obhod 2 0

let zad list =
    let i_list = List.indexed list
    List.sortBy (fun x -> List.fold (fun sum y -> ) 0 i_list) 
