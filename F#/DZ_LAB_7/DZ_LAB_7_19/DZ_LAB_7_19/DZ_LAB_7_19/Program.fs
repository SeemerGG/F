open System

let zad1 (str:string) =
     String.length(String.filter(fun x -> x>='А' && x<='я') str)
 
let zad2 (str:string) =
    let str_flip = Seq.rev str
    Seq.forall2 (fun x y -> x=y) str str_flip


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

    0