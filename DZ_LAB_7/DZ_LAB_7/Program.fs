// Learn more about F# at http://fsharp.org

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

let zad17 (list:int list) =
    let min = List.min list
    let max = List.max list
    List.map (fun x -> if x = max then min else if x = min then max else x) list

let zad27 (list:int list) =
    (List.last list::List.removeAt (List.length list - 1) list)
  
let zad37 (list:int list) =
    let list_indexed = List.indexed list 
    let new_list = List.filter (fun x -> snd x < List.item (fst x - 1) list) (List.tail list_indexed)
    List.iter (fun x -> printfn "%i" (fst x) ) new_list
    Console.WriteLine(List.fold (fun s x -> s+1 ) 0 new_list)
 
let rec search_del n i (new_list:int list) =
    if n < i then new_list
    else (if n % i = 0 then search_del n (i+1) (i::new_list) else search_del n (i+1) new_list)
    

let zad47 (list:int list) =
    let distinct_list = List.distinct list
    List.distinct (List.fold (fun s x -> s @ search_del x 1 []) [] distinct_list)

    
let zad57 list =
    let i_list = List.indexed list
    List.fold (fun s x -> if ((List.fold (fun sum b -> snd b + s) 0 (List.takeWhile (fun y -> fst y < fst x) i_list))) < snd x then s + 1 else s) 0 i_list

[<EntryPoint>]
let main argv =
    let list = input_list (Convert.ToInt32(Console.ReadLine()))
    match Console.ReadLine() with
    |"17" -> list |> zad17 |> output_list |> ignore
    |"27" -> list |> zad27 |> output_list |> ignore
    |"37" -> list |> zad37
    |"47" -> list |> zad47 |> output_list |> ignore
    |"57" -> list |> zad57 |> Console.WriteLine
    0 
