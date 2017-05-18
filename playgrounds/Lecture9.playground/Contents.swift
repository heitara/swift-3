//: Playground - noun: a place where people can play

import UIKit

/*
 Какво е playground?
 
 Това вид проект, който се изпозлва от xCode. Интерактивно показва какво е състоянието на паметта на компютъра във всеки един ред на изпълнение на код-а. Позволява лесно онагледяване на примерния код. Много по-лесно може да се анализира кода. Можем да скицираме проблеми и техните решения, които да използваме за напред.
 
 */

//: # Въпроси от лекция №8
//: 1. Какво е оператор?
//: 2. Какво е характерно за операторите (функциите)?
//: 3. Как можем да дефинираме свои оператори?





////
//: ## Второто домашно е обявено. Въпроси?







//: # Лекция 9: Клоужъри (Closures)
//: ## курс: Увод в прогрмаирането със Swift

//: Какво са функциите?

//: ### Функциите като тип

// функция, която събира две цели числа и връща сумата
func sum(a:Int, b:Int) -> Int {
    return a + b
}
//: - Note:
//: Всяка функция има определен тип, който се формира от типа на параметрите и от типа на резултата връщан от функцията.




//: Как можем да използваме типа на функциите?

//: - Note:
//: Изпозлваме го както останалите типове. Т.е. можем да подаваме функция като параметър и да връшаме резулта, който да е функция.

func isEven(number:Int) -> Bool {
    return number % 2 == 0
}

var predicate: (Int) -> Bool = isEven

let two = 2
if predicate(two) {
    print("\(two) удволетворява условието!")
}


//: Да се даде пример за функция, която взема друга функция като параметър.


//: Да се даде пример за функция, която взема друга функция като параметър.


//: Да се даде пример за функция, която взема друга функция като параметър.
func fancyPrint(name: String) {
    //TODO:
    print("--> \(name) <--")
}

func fancyPrintNew(name: String)   {
    print("!@#!@#@!#@!#!@#!@!@#!@#@!#@!#!@#!@")
    print("--> \(name) !@#!@#@!#@!#!@#!@")
    print("!@#!@#@!#@!#!@#!@!@#!@#@!#@!#!@#!@")
}

var myPrint: (String) -> Void = fancyPrintNew

let firstNames = ["Иван", "Гошо", "Мишо"]

func printAllNames(names: [String], printFunc: (String) -> Void) {
    for name in names {
        printFunc(name)
    }
}



//: Да се даде пример за функция, която връща функция като параметър.

func createVeryFancyPrintFunction() -> (String)-> Void {
    
    func fancyPrintNew2(name: String)   {
        print("******************************")
        print("$$$$$$$$$$$ \(name) $$$$$$$$$$")
        print("******************************@")
    }
    
    
    return fancyPrintNew2
}

//printAllNames(names: firstNames, printFunc: createVeryFancyPrintFunction())

//: Да се даде пример за функция, която връща функция като параметър и взема поне един параметър - функция.

//TODO:
//: ### Nested(Вместени) функции?
//: - Note:
//: До сега сме се запознали с функции, които са глобални. (Методите, които са част от класовете са по-различен вид функции, които познаваме.)

//: Вместените функции са такива функции, които се появяват като част от тялото на друга функция.


func globalFunc() {
    var divisor = 3
    
    func nestedFunction(i: Int) -> Bool {
        print("\(i) is printed from the nested function");
        //как можем да позлваме променлива от вънщната функция?
        return i % divisor == 0
    }
    //извикване на вместената функция (calling the nested function)
    nestedFunction(i: 5)
}

//извикване на глобалната функция
globalFunc()
//вместената функция не е видима тук и следващият ред предизвиква компилационна грешка
//nestedFunction(3)




//: ## Какво са клоужърите?

//: - Note:
//: В Swift, клоужърите (closure) са:
//: * глобалните функции с имена, които вече познаваме
//: * вместените функции са клоужъри, които имат видимост до променливите в функцията, която ги съдържа (процеса по запомняне/прихващане на променливите се нарича capturing)
//: * клоужър израз - без име, записан по специфичен начин, прихващаш (capture) стойности от прилежащия му контекст



//: Клоужърите имат прост и компактен синтаксис. Ще го видим в различни примери.
//: Техният механизъм позволява определянето на типовете на параметрите автоматично. Също и на връщания резултат. Ако имаме клоужър само с един израз, тогава не е нужно да изпозлваме `return` за да обявим, че връщаме резултат. 
//: Клоужърите имат съхратен вариант и в него можем лесно да се обръщаме към параметрите.

//Пример:


//printAllNames(names: firstNames, printFunc: { (firstName) -> Void in
//    print("&&&& \(firstName) &&&")
//})


printAllNames(names: firstNames) {
    print("&&&& \($0) &&&")
}

//: Клоужъте могат да се подават като последен парамтетър към функция. В този случай, можем да ги изписваме в къдрави скоби след функцията, като изпуснем последния параметър.


func trailingClosure(i:Int, predicate: (Int)->Bool) {
    print("Проверка за \(i)")
    if predicate(i) {
        print("Предиката е удволетворен.")
    }
}

//нормалното извикване
trailingClosure(i: 1, predicate: { (a) -> Bool in
    return a % 2 == 0
})
//няма нужда от определяне на типа, който връща
trailingClosure(i: 1, predicate: { (a) in
    return a % 2 == 0
})

//клоужъра е последен параметър, затова се подава, като часто от функцията
trailingClosure(i: 4) { (a) in
    return a % 2 == 0
}
//съкратен вид
trailingClosure(i: 4) { (a) in
    //без return понеже имаме само един ред
    a % 2 == 0
}
//подразбиращи се имена на параметрите
//кодът е къс, но трудно разбираем за всички
trailingClosure(i: 8) {
    $0 % 2 == 0
}






let names = ["aaa", "ccc", "bbb"]
//сортиране
print(names.sorted(by: { $0 > $1 }))
print(names.sorted() { $0 > $1 })
//
print(names.sorted(by: >))


//: ### Какво е (capturing) запомняннето на променливи от контекста?

//пример за запомняне на променливи от контекста (JS програмиране)


func createGen(start: Int, modify: @escaping (Int) -> Int ) -> ()->(Int) {
    
    var myStart = start
    
    return {
        myStart = modify(myStart)
        return myStart
    }
    
}

var next = createGen(start: 0) {
    $0 + 2
}

print(next()) //0
print(next()) //2
print(next()) //4
print(next()) //6
print(next()) //8

//: - Note:
//: Клоужърите са референтен тип!



//: Escaping closures
//: Това са клоужъри, които трябва да напуснат обсега на функцията към която са подадени.

//пример:
var handlers:[()->Void] = []
//трябва да добавим атрибута @escaping иначе няма да се компилира
func escapingClosure(f: @escaping ()->Void) {
    handlers.append(f)
}

handlers.append {
    print("test")
}

escapingClosure {
    print("test 2")
}


//активираме всички функции
for f in handlers {
    f()
}


//: ## Ауто-клоужъри

func funcAutoclosure(pred: @autoclosure () -> Bool) {
    if pred() {
        print("It's true")
    } else {
        
    }
}

funcAutoclosure(pred: 11 > 12)
funcAutoclosure(pred: { () -> Bool in return 2 > 1}())

func closureExample(function: (Int, Int) -> Bool) {
    let a = 1
    let b = 52
    if function(a, b) {
        print("Returned result is true")
    } else {
        print("Returned result is !true")
    }
}

closureExample() { (a:Int, b:Int) in a > b}

//: # За любознателните:
//: ### Ето какво значение има ако дадена функция е част от протокол, когато боравим с протоколи.

/// extensions 
struct Pizza {
    let ingredients: [String]
}

protocol Pizzeria {
    func makePizza(ingredients: [String]) -> Pizza
    //ако го няма, не може да се достъпи метода въпреки, че конкретната инстанция го има (виж отпечатаната информация)
    //func makeMargherita() -> Pizza
    // всичко се дължи на начина на извикване на методите, когато променливата е от различен тип в сравнение с обекта, който е свързан с нея
}

extension Pizzeria {
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "mozzarella"])
    }
}

struct Lombardis: Pizzeria {
    func makePizza(ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "basil", "mozzarella"])
    }
}

let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()

print(lombardis1.makeMargherita())
print(lombardis2.makeMargherita())
