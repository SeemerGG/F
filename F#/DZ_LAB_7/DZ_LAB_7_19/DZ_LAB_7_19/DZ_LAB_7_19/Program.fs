open System
open System.Text.RegularExpressions

let zad1 (str:string) =
     String.length(String.filter(fun x -> x>='А' && x<='я') str)
 
let zad2 (str:string) =
    let str_flip = Seq.rev str
    Seq.forall2 (fun x y -> x=y) str str_flip

let zad3 (str: string[]) = 
    let new_str = Array.filter (fun x -> Regex.IsMatch(x,@"(0[1-9]|[12][0-9]|3[01])[.](01|03|05|07|08|10|12)[.](19|20)\d\d") || 
Regex.IsMatch(x,@"(0[1-9]|[1][0-9]|2[0-8])[.](02)[.](19|20)\d\d") || Regex.IsMatch(x,@"(0[1-9]|[12][0-9]|30)[.](04|06|09|11)[.](19|20)\d\d")) str
    Array.map (fun x -> printf "%s " x) new_str 

[<EntryPoint>]
let main argv = 
    Console.WriteLine("Выберите задание:")
    Console.WriteLine("1) Найти количество русских символов.")
    Console.WriteLine("2) Проверить на образование полиндрома.")
    Console.WriteLine("3) Найти в тексте даты формата «день.месяц.год».")
    match Console.ReadLine() with
    |"1" -> let str = Console.ReadLine()
            Console.WriteLine("Количество русских символов: {0}",str |> zad1)
    |"2" -> let str = Console.ReadLine()
            if str |> zad2 then Console.WriteLine("Да") else Console.WriteLine("Нет")
    |"3" -> let str = Console.ReadLine()
            str.Split(' ') |> zad3 |> ignore 
    0