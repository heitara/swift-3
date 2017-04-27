//: Playground - noun: a place where people can play

import UIKit

/*
 Какво е playground?
 
 Това вид проект, който се изпозлва от xCode. Интерактивно показва какво е състоянието на паметта на компютъра във всеки един ред на изпълнение на код-а. Позволява лесно онагледяване на примерния код. Много по лесно може да се анализира кода. Можем да скицираме проблеми и техните решения, които да използваме за напред.
 
 */



// Лекция 5
// курс: Увод в прогрмаирането със Swift


//Какво са N-торки */
//Пример от миналата лекция
let person = (name: "Иван", familyName: "Петров", age: 25)
//тип : (name: String, familyName: String, age: Int)
//(String, String, Int)
let p:(String, String, age: Int)? = person
print("Здравей, \(person.name)!")

print("Здравей, г-н \(person.familyName)!")

print("Здравей, г-н \(person.1)!")
if let pp = p, pp.age > 20 {
    print("Г-н \(pp.1), Вие сте на \(pp.age) години.")
}

print("Г-н \(p?.1), Вие сте на \(p?.age) години.")


print("\n-----------------------------------------------------\n")
print("-----------------------Structs-----------------------\n")
print("-----------------------------------------------------\n")

//Структури
struct Merchandise {
    var name: String
    var pricePerUnit: Double
    var isAvailable: Bool
    
//    init() {
//        self.name = "Noname"
//        self.pricePerUnit = 0
//        self.isAvailable = false
//    }

    init(name: String, pricePerUnit: Double, isAvailable:Bool ) {
        self.name = name
        self.pricePerUnit = pricePerUnit
        self.isAvailable = isAvailable
    }
}

var phone = Merchandise(name:"Nokia", pricePerUnit:123, isAvailable:false)
//конструктор без параметри
var phone2:Merchandise = Merchandise(name: "no name", pricePerUnit: 0, isAvailable: false)

print(phone2.name + " hello")

phone.name = "Nexus 5"

print(phone.name)






var newPhone:Merchandise = Merchandise(name: "no name", pricePerUnit: 0, isAvailable: false)
func pritnInfoFor(merchandise:Merchandise) {
    print("Product : \(merchandise.name) - \(merchandise.pricePerUnit) - \(merchandise.isAvailable ? "available" : "unavailable")")
}

pritnInfoFor(merchandise: phone)

pritnInfoFor(merchandise: newPhone)
//нека да направим нова структура, но този път да добавим няколко
//функции, към нея

struct Merchandise2 {
    var name: String = "Noname"
    var pricePerUnit: Double = 0.0
    var isAvailable: Bool = false
    
//    init() {
//        self.name = "Noname"
//        self.pricePerUnit = 0
//        self.isAvailable = false
//    }
//    
//    init(name: String, pricePerUnit: Double) {
//        self.name = "dsahjdsajld"
//        self.pricePerUnit = pricePerUnit
//        self.isAvailable = false
//    }
//    
//    init(name: String, pricePerUnit: Double, isAvailable:Bool) {
//        self.name = name
//        self.pricePerUnit = pricePerUnit
//        self.isAvailable = isAvailable
//    }
//    
    func printInfo() {
        //self
        let newPricePerUnit = self.pricePerUnit + self.pricePerUnit * 0.10
        print("Product : \(self.name) - \(pricePerUnit) - \(isAvailable ? "available" : "unavailable")")
    }
    
    func printInfoName(name:String = "What???") {
        //self
        print("[Info] Product : \(self.name) - \(pricePerUnit) - \(isAvailable ? "available" : "unavailable")")
    }
}

//конструктор по подразбиране, понеже имаме стойности на всички полета
var m:Merchandise2 = Merchandise2()
//конструктор с изброени всички полета
m = Merchandise2(name: "NoName", pricePerUnit: 1, isAvailable: false)
m.printInfo()
m.printInfoName()

//C код
//z = y = a = 5;
//В Swift не е валиден!


m.name = "Nokia 3310"
m.pricePerUnit = 100
m.isAvailable = true

m.printInfo()

//Въпрос: Какво ще стане, ако премахнем инициализацията на някое поле в структурата?
//Въпрос: Какво ще стане, ако премахнем инициализацията на някое поле в конструктора?


//Въпрос: Какво e значението на запазената дума static?

struct Merchandise3 {
    var name: String = "Noname - Merchandise3"
    var pricePerUnit: Double = 0.0
    var isAvailable: Bool = false
    
    static func printInfo(merchandise:Merchandise3) {
        print("[Static] Product : \(merchandise.name) - \(merchandise.pricePerUnit) - \(merchandise.isAvailable ? "available" : "unavailable")")
        //Тук self реферира към типа на структурата т.е. Merchandise3
        
        print("Struct type: \(self)") //
        
        print("Static var: \(self.x)") //
        
    }
    
    func printInfoName(name:String = "What???") {
        //self
        print("[Info] Product : \(self.name) - \(pricePerUnit) - \(isAvailable ? "available" : "unavailable")")
        
        print("Static var: \(Merchandise3.x)") //
    }
    //статична променлива
    static var x = 1;
    
    //константи
    static let c = "CONST"
    let c2 = "CONST"
    
    //
    
    struct SubStruct {
        var x = 1.0
    }
    
    var s = SubStruct()
    
    //enum
    //намя деструктори
    
    
}

extension Merchandise3 {
    
    init(name: String, pricePerUnit: Double, isAvailable:Bool) {
        self.name = name
        self.pricePerUnit = pricePerUnit
        self.isAvailable = isAvailable
    }
    
    //изчислими пропъртита
    var incomePerUnit:Double {
        get {
            return self.pricePerUnit * 0.2
        }
    }
    
    var realPricePerUnit:Double {
        get {
            return self.pricePerUnit * 0.8
        }
        
        set (newValue) {
            self.pricePerUnit = newValue * 1.25
        }
    }
    
    var realPricePerUnitShort:Double {
        get {
            return self.pricePerUnit * 0.8
        }
        
        set {
            self.pricePerUnit = newValue * 1.25
        }
    }
    
    
    var incomePerUnitShort:Double {
        return self.pricePerUnit * 0.2
    }
}

//Пример за константно свързване (константа) когато типът има променливи пропъртита
let g1 = Merchandise(name: "no name", pricePerUnit: 0, isAvailable: false)
//g1.name = "New name" //note: change 'let' to 'var' to make it mutable

print("----computed properties----")
var macBookPro = Merchandise3(name:"MacBook Pro 15\"", pricePerUnit: 3200.0, isAvailable: true)
Merchandise3.printInfo(merchandise: macBookPro)
print("Income per product: \(macBookPro.incomePerUnit)")

print("Real price per product: \(macBookPro.realPricePerUnit)")
macBookPro.realPricePerUnit = 3200 - macBookPro.incomePerUnit
print("Real price per product: \(macBookPro.realPricePerUnit)")


print("----static----")
var m3 = Merchandise3()
Merchandise3.printInfo(merchandise: m3)


print("")

//Предаване по стойност (Value types)
var a = 1
var b = a
print("Initial values:")
print("a = \(a)")
print("b = \(b)")

a += 5
print("Modify a += 5.")
print("a = \(a)")
print("b = \(b)")


//func modify(/*let*/ value:Int) {
//    value = 3
//}

func modify(value:inout Int) {
    value = 3
}
print("Example with functions.")
print("b = \(b)")
modify(value: &b)
print("Modify b = 3.")
print("b = \(b)")

//за да сравним напълно предаването по стойност 
//с предаването по референция, трябва да се запознаем
//с класовете

//ето и пример със структура 

var nokia = Merchandise2(name: "Nokia 3310", pricePerUnit: 100, isAvailable:false)
nokia.printInfo()
var nokiaDiscounted = nokia
nokia.pricePerUnit *= (100.0 - 20.0) / 100.0 // -20%
//nokiaDiscounted.isAvailable = true

nokia.printInfo()
nokiaDiscounted.printInfo()

///Интересно място за писане на код:
/// https://www.codingame.com/home
/// Защо е интересно?
/// * - има swift
/// * - има състезания
/// * - има задачки
/// * - трупаме точки и това ни мотивира да сме по-добри
/// * - можем да програмираме ботове



//мързеливи пропъртита

struct LazyStruct {
    var count: Int
    init (count:Int) {
        print("\(LazyStruct.self) се конструира чрез -> \(#function)")
        self.count = count
    }
}

struct ExampleLazyProperty {
    lazy var s:LazyStruct = LazyStruct(count: 5)
    var regularInt = 5
    
    init() {
        print("\(ExampleLazyProperty.self) се конструира чрез -> \(#function)")
    }
}

var lazyPropExample = ExampleLazyProperty()
lazyPropExample.regularInt = 15
print("Стойноста в нормалното пропърти 'regularInt' e \(lazyPropExample.regularInt)")
print("Стойноста на мързеливото пропърти е \(lazyPropExample.s.count)")
print("Стойноста в нормалното пропърти 'regularInt' е \(lazyPropExample.regularInt)")


//А сега да разгледаме Array 

let integers = [1, 2, 3]
print(integers)
let reversed = integers.reversed()
//print(reversed) //this is from strange type
print([Int](reversed))
let ints = integers + [4]
print(ints)



//subscripts

var goods = [Merchandise2(), Merchandise2(), Merchandise2()]
goods[1].isAvailable = true
//goods[2].name = "Last item"
func printItems(arr:[Merchandise2]) {
    for i in arr {
        i.printInfo()
    }
}
var ind = 0

for var item in goods {
    ind += 1
//    item.name = "Good #\(ind)"
    goods[ind - 1].name = "Good #\(ind + 1)"
}

print("След for in")
printItems(arr: goods)
ind = 0

while ind < goods.count {
    goods[ind].name = "Good #\(ind + 1)"
    ind += 1
}
print("След while")
printItems(arr: goods)

extension Merchandise2 {
    subscript (index:Int) -> Any {
        get {
            switch index {
            case 0:
                return name
            case 1:
                return pricePerUnit
            case 2:
                return isAvailable
            default:
                return "nothing"
            }
        }
        
        set(newValue) {
            if index == 0 {
                name = String(describing: newValue)
            }
        }
    }
    
    subscript (index:(Int,Int)) -> Any {
         return "tuple nothing"
    }

}



let m5236 = goods[0]
print("Name: \(m5236[0])")


print(goods[0][1])
print(goods[0][3])
print(goods[0][(3,3)])

goods[0][0] = "hello!"
print(goods[0][0])





//Задачи:

//Да се направи модел на по следното задание:
//
//Задание 1
//
//Да се имплементира мобилно приложение, което
//представя информация за времето. Времето да има две представяния
//- по целзии, по фаренхайт. Да може да се съставя списък от 
//градове, който да представя информация за времето в 
//определените локации.
//
//Задание 2
//
//Да се имплементира мобилно приложение, което
//представя списък от снимки, които всеки потребител може да upload-ва.
//Всеки потребител да има списък от снимки, които се формира от снимките на всички
//потребители, на които е последовател. Всеки да може да стане
//последвател на друг потребител, но да може и да се откаже да е последовател.
//Под всяка снимка потребителите да могат да коментират. Да я отбелязват като любима.
//Или да я споделят с други потребители. Всеки потребител да има списък с
//последователи. Да има вход в системата с потребителско име и парола.




//пример за област на видимост
//global variable example
var i = 5;

func f(a:Int) {
    print(a)
    print("I = \(i)")
    i += a
    if a < 5 {
//        let i = 10
        f (a: a  +  1)
        if true {
//            let i = 15
            //глобалната променлива i е скрита от локалната i
            print("back tracking - \(i)")
        }
        
        print("trace I - \(i)")
        
    }
}

//пример
f(a:3)


