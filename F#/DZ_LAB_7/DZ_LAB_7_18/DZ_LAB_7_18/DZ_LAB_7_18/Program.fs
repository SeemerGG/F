open System

let read_array n =
    let rec read_array_r n arr = 
        if n = 0 then
            arr
        else
            let tail = System.Console.ReadLine() |> Int32.Parse
            let new_arr = Array.append arr [|tail|]
            let n1 = n - 1
            read_array_r n1 new_arr

    read_array_r n Array.empty

let write_array arr =
    printfn "%A" arr

[<EntryPoint>]
let main argv =
    let arr1 = read_array (Console.ReadLine() |> Int32.Parse)
    let arr2 = read_array (Console.ReadLine() |> Int32.Parse)
    arr1 |> Array.filter (fun x -> Array.exists (fun y -> y = x) arr2 ) |> write_array
    0