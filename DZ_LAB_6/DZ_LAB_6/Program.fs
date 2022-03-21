// Learn more about F# at http://fsharp.org

open System

let rec input_list n=
    if n = 0 then []
    else 
        let head = Convert.ToInt32(Console.ReadLine())
        let tail = input_list (n - 1)
        head::tail

let read_list =
    let n = Convert.ToInt32(Console.ReadLine())
    input_list n

let rec output_list (list:int list) =
    match list with
    |[] -> None
    |h::t-> Console.Write("{0} ", h)
            output_list t

let rec count f list acc =
    match list with 
    |h::t -> if f h then count f t (acc + 1) else count f t acc
    |[] -> acc

let rec diffrent_elem f list =
    match list with
    |h::t -> if f h then h else diffrent_elem f t 
    |[] -> 0

let min_elem list =
    let rec min list acc=
        match list with
        |h::t -> if h < acc then min t h else min t acc
        |[] -> acc
    min list (List.head list)

let max_elem list =
    let rec max list acc=
        match list with
        |h::t -> if h > acc then max t h else max t acc
        |[] -> acc
    max list (List.head list)

let rec flip list newlist=
    match list with 
    |h::t -> flip t (h::newlist)
    |[] -> newlist

let rec swap list x y new_list=
    match list with
    |h::t -> if h = x  then swap t x y (y::new_list) else if h = y then swap t x y (x::new_list) else swap t x y (h::new_list)
    |[] -> flip new_list []

let zad11 list =
    let elem1 = List.head list
    let elem2 = diffrent_elem (fun x -> x <> elem1) list
    let acc1 = count (fun x -> x = elem1)  list 0
    let acc2 = count (fun x -> x = elem2) list 0
    if acc1 > acc2 then Console.WriteLine("Элемент встречаемый единожды {0}", elem2) else Console.WriteLine("Элемент встречаемый единожды {0}", elem1) 

let zad17 list =
    let max = max_elem list
    let min = min_elem list
    swap list min max []


[<EntryPoint>]
let main argv =
    let list = read_list 
    match Console.ReadLine() with
    |"11" -> zad11 <| list
    |"17" -> list |> zad17 |> output_list |> ignore
    0 // return an integer exit code
