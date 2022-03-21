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

let zad11 list =
    let elem1 = List.head list
    let elem2 = diffrent_elem (fun x -> x <> elem1) list
    let acc1 = count (fun x -> x = elem1)  list 0
    let acc2 = count (fun x -> x = elem2) list 0
    if acc1 > acc2 then Console.WriteLine("Элемент встречаемый единожды {0}", elem2) else Console.WriteLine("Элемент встречаемый единожды {0}", elem1) 

[<EntryPoint>]
let main argv =
    let list = read_list 
    match Console.ReadLine() with
    |"11" -> zad11 <| list

    0 // return an integer exit code
