﻿open System


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
//#14
(*
let obhod_del n f init=
    let rec creat_list n j r=
        if n<j then r 
        else 
            if n % j = 0 then creat_list n (j+1) (j::r)
            else creat_list n (j+1) r
    let list= creat_list n 1 []
    let rec ans list f init =
        if list = [] then init
        else 
            let acc=f init (List.head list)
            ans (List.tail list) f acc
    ans list f init

let input=
    System.Console.WriteLine(obhod_del (System.Convert.ToInt32(System.Console.ReadLine())) (fun x y -> x + y) 0);;
 *)   
 //#15

//#18
//method 1


   (* 
let rec method1 n k init=
    if n < k then init
        else 
            if (n % k) > 0 then method1 n (k+1) init
            else
                if (let rec pro_pros j i=
                    if i=j then 0
                    else 
                        if (j % i)>0 then pro_pros j (i+1)
                        else 1+pro_pros j (i+1)
                   pro_pros n 2) > 0 then method1 n (k+1) init
                else  
                    method1 n (k+1) (init+1)
        
        *)

//let input=
   // System.Console.WriteLine(method1 (System.Convert.ToInt32(System.Console.ReadLine())) 2 0);;
           
            

    
[<EntryPoint>]
//#11 
(*
let main argv =
    match System.Console.ReadLine() with
    |"Prolog"->System.Console.WriteLine("Подлиза")
    |"F#"->System.Console.WriteLine("Подлиза")
    | _->System.Console.WriteLine("ХАРОШ") 
  *) 

//#12.1
(*
let main arvg=
    let a (x:string) = printfn "%s" x
    let b (x:string) : string = if (x = "Prolog") || (x = "F#") then "Подлиза" else "ХАРОШ"
    let c = Console.ReadLine() 
    (b>>a) c   
    *)
//#12.2
(*let main arvg=
    Console.ReadLine() |> (fun x -> if (x = "Prolog")||(x = "F#") then "Подлиза" else "ХАРОШ") |> Console.WriteLine
    *)
    
    0 // return an integer exit code