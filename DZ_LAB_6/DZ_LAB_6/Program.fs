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

let rec count f list acc =
    match list with 
    |h::t -> if f h t then count f t (acc + 1) else count f t acc
    |[] -> acc

let rec diffrent_elem f list =
    match list with
    |h::t -> if f h then h else diffrent_elem f t 
    |[] -> 0

let rec universal f list acc=
    match list with
    |h::t -> universal f t (f h acc)
    |[] -> acc
    
let rec flip list newlist=
    match list with 
    |h::t -> flip t (h::newlist)
    |[] -> newlist

let rec swap list x y new_list =
    match list with
    |h::t -> if h = x  then swap t x y (y::new_list) else if h = y then swap t x y (x::new_list) else swap t x y (h::new_list)
    |[] -> flip new_list []

let rec i_list f list (counter:int) new_list =
    match list with
    |h::t -> if t <> [] then (if f h t then i_list f t (counter + 1) ((counter + 1)::new_list) else i_list f t (counter + 1) new_list) else new_list 
    |[] -> new_list
 
let rec bypass f list =
    match list with
    |h::t -> if f h then bypass f t else false
    |[] -> true

let rec symmetric_different list1 list2 new_list =
    match list1 with
    |h::t -> if (bypass (fun x -> x <> h) list2) then symmetric_different t list2 (h::new_list) else symmetric_different t list2 new_list
    |[] -> new_list

let rec delete_clon list list2 new_list =
    match list with 
    |h::t -> if count (fun x y-> x = h) list2 0 = 1 then delete_clon t list2 (h::new_list) else delete_clon t list2 new_list
    |[] -> new_list

let zad11 list =
    let elem1 = List.head list
    let elem2 = diffrent_elem (fun x -> x <> elem1) list
    let acc1 = count (fun x y -> x = elem1)  list 0
    let acc2 = count (fun x y -> x = elem2) list 0
    if acc1 > acc2 then Console.WriteLine("Элемент встречаемый единожды {0}", elem2) else Console.WriteLine("Элемент встречаемый единожды {0}", elem1) 

let zad17 list =
    let max = universal (fun x y -> if x > y then x else y) list (List.head list)
    let min = universal (fun x y -> if x < y then x else y) list (List.head list)
    swap list min max []

let zad19 list =
    let head = List.head list
    let rec shift list new_list=
        match list with
        |h::t -> shift t (h::new_list)
        |[] -> flip (head::new_list) []
    shift (List.tail list) []

let zad31 list =
    count (fun x y -> x % 2 = 0) list 0

let zad34 list =
    let a = Convert.ToInt32(Console.ReadLine())
    let b = Convert.ToInt32(Console.ReadLine())
    count (fun x y -> (x < b) && (x > a)) list 0  
  
let zad37 list =
    let list_position = i_list (fun x y -> x > List.head y) list 0 []
    list_position |> output_list |> ignore
    Console.WriteLine("\nКоличество таких элементов:{0}",count (fun x y -> true) list_position 0)
    
let zad50 (list1,list2:int list) =
    let list_1 = delete_clon list1 list1 []
    let list_2 = delete_clon list2 list2 []
    (symmetric_different list_1 list_2 []) @ (symmetric_different list_2 list_1 [])

[<EntryPoint>]
let main argv =
    let n = Convert.ToInt32(Console.ReadLine())
    let list = input_list n
    match Console.ReadLine() with
    |"11" -> zad11 <| list
    |"17" -> list |> zad17 |> output_list |> ignore
    |"19" -> list |> zad19 |> output_list |> ignore
    |"31" -> list |> zad31 |> Console.WriteLine
    |"34" -> list |> zad34 |> Console.WriteLine
    |"37" -> list |> zad37
    |"50" -> let m = Convert.ToInt32(Console.ReadLine()) 
             let list2 = input_list m
             (list,list2) |> zad50 |> output_list |> ignore 
    0 // return an integer exit code
