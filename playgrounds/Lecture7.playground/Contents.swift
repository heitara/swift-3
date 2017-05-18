//: Playground - noun: a place where people can play

import UIKit

/*
 Какво е playground?
 
 Това вид проект, който се изпозлва от xCode. Интерактивно показва какво е състоянието на паметта на компютъра във всеки един ред на изпълнение на код-а. Позволява лесно онагледяване на примерния код. Много по-лесно може да се анализира кода. Можем да скицираме проблеми и техните решения, които да използваме за напред.
 
 */

//: # Въпроси от лекция №6
//: 1. Какво е ```mutating``` и кога се ползва?
//: 2. Какво е read–only пропърти?
//: 3. Какво е наследяване?
//: 4. Кога можем да използваме  запазената дума super?
//: 5. Кога изпозлваме ```override```?


//: ## След контролното ще разглеждаме проектите и прогреса по тях




//: # Лекция 7: Протоколи (Класове и Структури)
//: ## курс: Увод в прогрмаирането със Swift

//: Наследяване - преговор
//: Предефиниране (overriding)

//: Достъп до базовите методи, пропъртита и subscript-s, става чрез ```super```

//: - Note:
//: В Swift, изпозлваме запазената дума ```override``` за да обозначим, че предефинираме дадена функци, пропърти (get & set).


//: Можем да обявим функция или пропърти, че няма да се променят. За целта използваме ```final```.

//: Можем да обявим дори и цял клас. ```final class``` - класът няма да може да бъде наследяван.



//: Инициализатори (init методи)

//: наследяване на инициализаторите инициализатори

//: ```required``` инициализатори

//: init? инициализатори



struct StructBook {
    var pageCount = 0
    var title = "no title"
    var publishDate:Date? = nil
    
    init(title:String) {
        self.title = title
    }
    
    
}

extension StructBook {
    init() {
        self.init(title: "No title")
    }
}

class Book {
    var pageCount = 0
    var title = "no title"
    var publishDate:Date? = nil
    
    convenience init(pages:Int) {
        self.init()
        self.pageCount = pages
    }
    
    convenience init(pages:Int, title:String) {
        self.init(pages:pages)
        self.title = title
    }
    
}

class TechnicalBook:Book {
    var isBlackAndWhite = true
}



class CartoonBook : Book {
    var isBlackAndWhite = true
}



extension Book {
    
    convenience init(title:String) {
        self.init()
        self.title = title
    }
    
    convenience init(pages:Int, title:String, date: Date?) {
        self.init(pages:pages, title:title)
        self.publishDate = date
    }
}



//var tb = TechnicalBook(

//var book = Book()
//book.pageCount = 100

var book100 = Book(pages: 100)

//var book2 = StructBook(pageCount: 1000, title: "Swift 3", publishDate: nil)


//var doc = TechnicalBook(



//: ## Протоколи
//: Какво са протоколите?
//: - Note:
//: Протокола е "договор", който всеки тип се съгласява да удволетвори. "Договор", е списък от изисквания, който определят начина по който ще изгледжа даденият тип.
//: ### Синтаксис

protocol Sellable {
    var pricePerUnit: Double { get }
    
    var isAvailable: Bool { set get }
    
    mutating func updatePrice(newPrice: Double)
}




protocol TechnicalDocumented {
    //конструктори
    init(documentation:Book)
    var technicalDocumentation: Book { get }
    func getTechnicalDocs() -> Book
}

protocol Printable {
    var description: String { get }
    static var version: String { get set}
    
    
    init()
    init(a:Int, b:Int)
}

extension Printable {
    //default version
    var description: String {
        return "No descriprion."
    }
    
    //default version
    static var version: String {
        return "v. 1.0"
    }
}



//extension Int:Printable {
//    var description: String {
//        return "седем"
//    }
//    
//}

//var i = 7
//print(i.description)

//пример за клас, който имплементира техникал интерфейс

class Machine: Printable {
    var powerConsumption = 0
    var name = "Missing name"
    //имаме неявен конструкту по подразбиране
    
//    var description: String {
//        return "Machine"
//    }
    
    static var version: String = "v. 2.0"
    
    required init() {
        
    }
    
    required init(a:Int, b:Int) {
        print("Machine")
    }
    
}

var m = Machine()
print(m.description)

//struct StructBook2:Printable {
//    var pageCount = 0
//    var title = "no title"
//    var publishDate:Date? = nil
//    
//    var description: String {
//        return "Structure Book!"
//    }
//}


class WashingMachine : Machine, TechnicalDocumented {
    var technicalDocumentation: Book
    func getTechnicalDocs() -> Book {
        return TechnicalBook()
    }
    
    
    required init() {
        technicalDocumentation = TechnicalBook()
        super.init()
    }
    
    required init(documentation: Book) {
        technicalDocumentation = documentation
        super.init()
    }
    
    required init(a:Int, b:Int) {
        technicalDocumentation = TechnicalBook()
        print("W.Machine")
        super.init()
    }

    
//    override var description: String {
//        
//        return " W Machine"
//    }
    
//    var technicalDocumentation: CartoonBook
}



protocol PersonalComputer: class {
    func getRamSize() -> Int
    /**
     * Convert X bytes to "KB" or "MB" or "GB" or "TB"
     **/
    static func convert(bytes: Int, to:String) -> Double
}


class MacBookPro : PersonalComputer {
    func getRamSize() -> Int {
        return 1024
    }
    static func convert(bytes: Int, to:String) -> Double { return 0 }
}



//: ## Задачи:

//: ### Да се направи модел на по следното задание:
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




