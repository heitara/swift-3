//: Playground - noun: a place where people can play

import UIKit

/*
 Какво е playground?
 
 Това вид проект, който се изпозлва от xCode. Интерактивно показва какво е състоянието на паметта на компютъра във всеки един ред на изпълнение на код-а. Позволява лесно онагледяване на примерния код. Много по-лесно може да се анализира кода. Можем да скицираме проблеми и техните решения, които да използваме за напред.
 
 */

//: # Въпроси от лекция №9
//
//: 1. Какво е nested функция?
//: 2. Какво е capturing (прихващане)?
//: 3. Какво са клоужърите?
//: 4. Какво е характерно за клоужърите?
//: 5. Какво означава атрибута @escaping?
//: 6. Какво трябва да подаваме, когато даден параметър е маркиран с @autoclosure?




////
//: ## Второто домашно е обявено. Въпроси?







//: # Лекция 10: Управление на паметта (Memory management)
//: ## курс: Увод в прогрмаирането със Swift


//: Кога можем да говорим за паметта?


//: - Note:
//: Класовете са референтни типове. Те се заделят в паметта и имаме референция (знание, къде се намират в паметта) към тях.

//: ## ARC (Automatic Reference Counting)

//: Това е механизмът, който се ползва от Swift, за управление на паметта.
//: Една инстанция се пази в паметта докато има референции към нея. Ако няма повече референции, тогава тя бива деинициализирана. Стандартните референции са силни референции (strong), защото задържат паметта сочена от тях и тя няма да бъде деинициализирана.

//: Можем да говорим за ARC при класовете (т.е. референтните типове) и кложърите. Типовете които се предават по стойнонст като структури и изброими типове, не са часто от ARC мемори мениджмънта. Те се управляват от друг различен механизъм, които приемаме за даденост.

//: Пример:




class Car {
    private var name:String
    
    init(name:String) {
        self.name = name
        print("Initalize a car instance with name: \(name)")
    }
    
    deinit {
        print("Deinit a car instance with name \(self.name) ")
    }
}
    
var tesla:Car? = Car(name: "Tesla")
tesla = nil

var car:Car? = tesla


car = nil
tesla = nil

//: Какво очаквате да се отпечата при изпълнение на следващия фрагмент код

//var c:Car? = Car(name: "Трабант1")
//c = nil
//c = Car(name: "Трабант2")
//c = nil
//c = Car(name: "Трабант3")
//c = nil

//: - Note:
//: В общия случай ARC се справя с управлението на паметта, с изключения когато се получи цикъл от референции. Тогава броячите на всяка инстанция не стигат до 0 и паметта не може да бъде освободена.



//: Сега ще дадем пример за референтен цикъл. 

//: Нека да реализираме следните два класа:
//: - Книга (има точно един автор)
//: - Автор (има точно една книга)
//: Това е частен случай на реалността, но е напъно достатъчен за примера.
class Book {
    let title:String
    let author:Author
    var genre:String?
    var pages:Int = 0
    
    init(title:String, author:Author) {
        self.title = title
        self.author = author
    }
    
    deinit {
        print("Deinit a book instance with title \(self.title) ")
    }
}

class Author {
    let name:String
    weak var book:Book?
    var age:Int
    var isAlive:Bool
    
    init(name:String, age:Int, isAlive:Bool) {
        self.name = name
        self.age = age
        self.isAlive = isAlive
    }
    
    deinit {
        print("Deinit an Auhtor instance with name \(self.name) ")
    }
}


var author:Author? = Author(name: "Достоевски",age: 73, isAlive: false)

var book:Book? = Book(title: "53",author:author! )

author!.book = book

book = nil
author = nil

//: Пример - код:



//: ## Какъв е проблема с ARC?
// работи добре, когато нямаме цикли от референции

//: ## Как да разрешим проблема?
//: Трябва да подскажем на ARC да знае че има цикли и да може да ги отстрани.

//: Съвет: Избягвайте цикличните Йерархии до колкото е възможно.

//: ### Да изпозлваме `weak` референция.
//: - Note:
//: `weak` реферeцията е такава, която позволява на ARC да деинициализира променливата, сочена от референцията. В резултат на това, тази променлива има стойност `nil`. Не можем да направим константа и типът е винаги опционален (optional).
//: Трябва да изпозлваме такава референци, когато реферираният елемент може да бъде замене.

//: - Note:
//: Наблюдателите (observers) на пропъртита не се активрат, когато ARC промени стойността на `nil`.


//: Да се разгледа примера от по-горе, с промяната.

//: - Note:
//: При езиците с гарбидж-колектор (алтернативен механизъм на ARC) weak референциите имат друго знаечение. Те често се позлват, когато се реализира кеш от обекти, които трябва да се освободи, само когат няма достатъчно памет. Освобождаването се извършва от гарбиджколектора. При ARC  `weak` се различава и не може да бъде позлвана по този начин, тъй като референциите(паметта) биват освободени веднага.

//: ### Да изпозлваме `unowned` референция.
//: - Note:
//: `unowned` реферeцията е такава, която позволява на ARC да деинициализира променливата, но тук интересното е, че 'дължината на живот' на тази променлива е същата или по-дълга. Т.е. няма да има случай в който тя да сочи към мястото в паметта, а то да е `nil`.

//: Трябва да се използва `unowned` когато сме сигурни, че референцията ще сочи инстанция, която няма да е деинициализирана. Ако се опитате да достъпите такава инстанция ще се получи грешка при изпълнение (runtime грешка).


//: Да се реализира примерна йерархия:
//: - Студент (който има студентска книжка)
//: - Студенткса книжка (StudentCard, която има студент)

class Student {
    let name: String
    var age = 19
    var card:StudentCard?
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        print("Init a student instance.")
    }
    
    func printStrudent() {
        print("Name: \(name) ")
        print("Age: \(age) ")
    }
    
    deinit {
        print("deInit a student instance")
    }
}

class StudentCard {
    let university: String
    let number: String
    
    
//    unowned(unsafe) let student:Student
    unowned let student:Student
    
    init(uni:String, number:String, student:Student) {
        university = uni
        self.number = number
        self.student = student
    }
    
    deinit {
        print("deInit a student-card instance - \(self.number)")
    }
}

//: Можем да използваме варианта `unowned(unsafe)`, където проверката дали паметта не е занулена, е изключена. Този вариант е по-бърз от стандартния, но носи рискове в случаите, когато инстанцията е деалокирана.


//: ## Цикли от референции при клоужъри (closures)

//: Понеже тялото на клоужър (closure) запомня (capture) променливи и ако го изпозлваме в клас - запомня `self`, тогава можем да стигнем до цикъл. Тъй като клоужърите и те са референтен тип, те могат да образуват цикъл от референции.

//: Сега ще разгледаме следния пример:

class DataType {
    let name:String
    var properties: Array<String> //[String]
    
    let prettyPrint = true
    
    init(name:String) {
        self.name = name
        properties = []
    }
    
    lazy var toSwift: () -> String = {
        [unowned self, name = self.name] in
        var swiftCode:String = "class \(name) {"
        
        if self.prettyPrint {
            swiftCode += "\n"
        }
        
        for property in self.properties {
            if self.prettyPrint {
                swiftCode += "\t"
            }
            swiftCode += property
        }
        
        if self.prettyPrint {
            swiftCode += "\n"
        }
        
        swiftCode += "}"
        
        return swiftCode
    }
    
    deinit {
        print("Deinit dataType instance \(self.name)")
    }
}


//: Да се реализира абстракция на пропърти

class DataProperty {
    let name:String
    var type:String?
    var defaultValue: String?
    
    init(name:String) {
        self.name = name
    }
    
    lazy var toSwift: () -> String = {
        var swiftCode:String = "var \(self.name)"
        
        if let type = self.type {
            swiftCode += ":\(type)"
        }
        
        if let value = self.defaultValue {
            swiftCode += " = \(value)"
        }
        
        return swiftCode

    }
}



var student:DataType? = DataType(name: "Student")
student?.properties.append("var name:String = \"Без име\"")
print(student!.toSwift())
student = nil

//: За да решим проблема трябва да използваме списъка с променливите, които клоужъра зaпомня и да ги определем като `unowned` или `weak`. Този списък се нарича capture list - или списък с запомнени променливи, които се използват в тялото на клоужъра.

//: Ще илюстрираме значенито на този списък е един кратък пример:

var myA = 0
var myB = 0

let f: () -> () = { [myA] in
    print("A = \(myA)")
    print("B = \(myB)")
}
    

myA = 7
myB = 7

f()


//: На базата на примера можем да направим промяна, като добавим 
//`[unowned self]` преди параметрите на клоужъра.


//: # Шаблони (Generics)

//: ## Какъв проблем решават шаблоните?

//: Да се напише функция която разменя две цели числа
//func sum(_ a:Int, _ b: Int) -> Int {
//    return a + b
//}


//: Да се напише функция която разменя два символни низа

//func sum(_ a:String, _ b: String) -> String {
//    return a + b
//}


//: ## Шаблонни функции

//: ### Трябва да изпозлваме шаблонните типове
//: Шаблонните типове се заместват с типове от вида T, K, U, като винаги са с главан буква и ако имат някаква релация, може да се използват думи, които да подсказват релацията. Пример: `Dictionary<Key, Value>`
protocol Sumable {
    //associatedtype Sumable
    static func + (left: Self, right:Self) -> Self
    
}

//: изискванията, които тази темплейтна функция са:
//: 1. двата параметра да са от един тип
//: 2. резултата да е от същия тип
//: 3. типа да има реализирана операция + или събирането да е дефинирано.
func sum<T:Sumable>(_ a:T, _ b: T) -> T {
    return a + b
}

struct Vector:Sumable {
   var x = 10
    
    static func + (left: Vector, right:Vector) -> Vector {
        return Vector(x: left.x + right.x)
    }
}

let vX = Vector(x: 10)
let vY = Vector(x: 10)
let sumV = sum(vX, vY)

extension String:Sumable {}

let hw  = sum("Hello ", "World!")
//print(sumV.x)
//print(hw)


//: ## Шаблонни класове

//: Да се реализира шаблонен стек или опашка

protocol CollectionEquatable {
    associatedtype Element
    var count:Int { get }
    subscript (i:Int) -> Element {get}
}

class Queue<Item>:CollectionEquatable {
    var items:[Item]
    
    init() {
        items = []
    }
    
    func insert(item:Item) {
       items.append(item)
    }
    
    func get() -> Item? {
        if items.count > 0 {
            return items.removeFirst()
        }
        
        return nil
    }
    
    subscript (i:Int) -> Item {
        return items[i]
    }
    
    var count:Int {
        return items.count
    }
}


extension Array : CollectionEquatable {}

//: Тази функция не може да се реализира с този протокол, понеже той може да участва само в 
// теплейтни функции, като ограничение/изискване към типа данни.
//func isEqualTemplate(left:CollectionEquatable, right:CollectionEquatable) -> Bool {
//    return false
//}

func isEqual<T:CollectionEquatable, U:CollectionEquatable>(left:T, right:U) -> Bool where T.Element:Equatable, U.Element == T.Element {
    if left.count == right.count {
        for i in 0..<right.count {
            if left[i] != right[i] {
                return false
            }
        }
        
        return true
    }
    
    return false
}

var queue:Queue<Vector> = Queue()

extension Vector:Equatable {
    public static func ==(lhs: Vector, rhs: Vector) -> Bool {
        return lhs.x == rhs.x
    }
}

queue.insert(item: Vector(x:10))
queue.insert(item: Vector(x:11))
queue.insert(item: Vector(x:12))

let arr = [Vector(x:10), Vector(x:11), Vector(x:12)]

if isEqual(left: queue, right: arr) {
    print("Двете колекции са еднакви: ")
    print("1. Имат равен брой елементи.")
    print("2. Всички елементи са еднакви.")
} else {
    print("Двете колекции НЕ са еднакви.")
}




//: #### Можем да изпозлваме разширения, за да добавяме допълнителни функции към шаблонните класове.


//: ## Ограничения към шаблонните типове - изисквания за протоколи или базови типове


//: ## Асоциирани типове и протоколи 

//: Трябва да използваме `associatedtype Element` като част от протокола. В последствие, можем да изпозлваме типа `Element`.

//: При имплементиране на определен протокол с асоцииран тип, Swift сам успява да определи реалният тип, с който трябва да замести асоциацията. Т.е. `Element` с кой реален тип трябва да бъде заместен.

//: ## Where условия при шаблоните
//: Условието трябва да се добави преди началото на функцията или тъпа от данни, които описваме. Може да видите правилото в действие в кода по-горе.
