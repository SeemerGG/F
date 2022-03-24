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

let rec universal f list acc =
    match list with
    |h::t -> universal f t (f h acc)
    |[] -> acc
    
let rec flip list (newlist:int list)=
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

let rec delete_repeats list new_list =
    match list with
    |h::t -> if bypass (fun x -> x <> h) new_list then delete_repeats t (h::new_list) else delete_repeats t new_list
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

let zad11_1 f (list:int list) =
    let rec zad (list:int list) new_list =
        match list with
        |h::t -> if t <> [] then
                    if List.tail t <> [] then zad t ((f h (List.head t) (List.head (List.tail t)))::new_list) else zad t ((f h (List.head t) 1)::new_list)
                 else zad t ((f h 1 1)::new_list)
        |[] -> new_list
    zad list []

let rec add_elem new_list elem (counter:int)= 
    match counter with
    |0 -> new_list
    | _ -> add_elem (elem::new_list) elem (counter - 1)
    
let rec universal_and_i f list acc i counter = // возвращает кортеж из номера элемента в списке и его значения 
    match list with
    |h::t -> if f h acc then universal_and_i f t h counter (counter + 1) else universal_and_i f t acc i (counter + 1)
    |[] -> (i, acc)

let rec list_count list1 list2 new_list = //сколько раз итый элемент встречаеться в лист2
    match list1 with
    |h::t -> list_count t list2 ((count (fun x y-> x = h) list2 0)::new_list) 
    |[] -> flip new_list []

let rec delete_i list new_list counter i =
    match list with
    |h::t -> if counter = i then delete_i t new_list (counter + 1) i else delete_i t (h::new_list) (counter + 1) i
    |[] -> flip new_list []

let zad55 list=
    let list_no_clon = delete_repeats list [] //лист без повторов
    let list_with_frequency = list_count list_no_clon list [] //лист частот итых элементов 
    let rec zad list_no_clone list_frequency new_list (counter:int)=
        match counter with
        | 0 -> new_list
        | _  ->  let i, max = universal_and_i (fun x y -> x > y) list_frequency (List.head list_frequency) 0 0
                 let list1 = delete_i list_no_clone [] 0 i
                 let list2 = delete_i list_frequency [] 0 i
                 let list3 = add_elem new_list (List.item i list_no_clone) max
                 zad list1 list2 list3 (counter - 1)
    flip (zad list_no_clon list_with_frequency [] (List.length list_no_clon)) []
                


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
    |"#11" -> (zad11_1 (fun x y z -> x + y + z) list) |> output_list |> ignore
    |"55" -> list |> zad55 |> output_list |> ignore
    0 // return an integer exit code
