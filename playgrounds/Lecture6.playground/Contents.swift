//: Playground - noun: a place where people can play

import UIKit

/*
 Какво е playground?
 
 Това вид проект, който се изпозлва от xCode. Интерактивно показва какво е състоянието на паметта на компютъра във всеки един ред на изпълнение на код-а. Позволява лесно онагледяване на примерния код. Много по-лесно може да се анализира кода. Можем да скицираме проблеми и техните решения, които да използваме за напред.
 
 */



//: # Лекция 6: Класове (и Структури)
//: ## курс: Увод в прогрмаирането със Swift

//: ### Структури и изчислими пропъртита; Read–only пропъртита

struct Merchandise {
    var name: String = "Noname - Merchandise"
    var pricePerUnit: Double = 0.0
    var isAvailable: Bool = false
    
    static func printInfo(merchandise:Merchandise) {
        print("[Static] Product : \(merchandise.name) - \(merchandise.pricePerUnit) - \(merchandise.isAvailable ? "available" : "unavailable")")
        //Тук self реферира към типа на структурата т.е. Merchandise3
        //print("Struct type: \(self)") //
    }
    
    func printInfoName(name:String = "What???") {
        print("[Info] Product : \(self.name) - \(pricePerUnit) - \(isAvailable ? "available" : "unavailable")")
    }
    
}
//var m = Merchandise()
//m.printInfoName(name:
//Merchandise.

extension Merchandise {
    
//    var x: Int;
    //изчислими пропъртита
    var incomePerUnit:Double {
        //гетър
        get {
            return self.pricePerUnit * 0.2
        }
    }
    
    var realPricePerUnit:Double {
        //гетър
        get {
            return self.pricePerUnit * 0.8
        }
        //сетър
        set (newValue) {
            self.pricePerUnit = newValue * 1.25
        }
    }
    //съкратен вариант
    var realPricePerUnitShort:Double {
        get {
            return self.pricePerUnit * 0.8
        }
        
        set {
            self.pricePerUnit = newValue * 1.25
        }
    }
    //read-only - съкратен вариант
    var incomePerUnitShort:Double {
        return self.pricePerUnit * 0.2
    }
}

//: #### Пример за константно свързване (константа) когато типът има променливи пропъртита
let g1 = Merchandise()
//g1.name = "New name" //note: change 'let' to 'var' to make it mutable

print("----computed properties----")
var macBookPro = Merchandise(name:"MacBook Pro 15\"", pricePerUnit: 5800.0, isAvailable: true)
Merchandise.printInfo(merchandise: macBookPro)
print("Income per product: \(macBookPro.incomePerUnit)")

print("Real price per product: \(macBookPro.realPricePerUnit)")
macBookPro.realPricePerUnit = 5800 - macBookPro.incomePerUnit
print("Real price per product: \(macBookPro.realPricePerUnit)")



//: ### мързеливи пропъртита

struct LazyStruct {
    var count: Int
    init (count:Int) {
        print("\(LazyStruct.self) се конструира чрез -> \(#function)")
        self.count = count
    }
}

struct ExampleLazyProperty {
    lazy var lazyProp:LazyStruct = LazyStruct(count: 5)
    var regularInt = 5
    
    init() {
        print("\(ExampleLazyProperty.self) се конструира чрез -> \(#function)")
    }
    
    init(regularInt:Int) {
        self.regularInt = regularInt
        print("\(ExampleLazyProperty.self) се конструира чрез -> \(#function)")
    }
    
    mutating func increment(with: Int) {
        self = ExampleLazyProperty(regularInt: self.regularInt + with)
        
    }
}

var lazyPropExample = ExampleLazyProperty()
lazyPropExample.regularInt = 15

print("")
print("")
print("")
print("Стойноста в нормалното пропърти 'regularInt' e \(lazyPropExample.regularInt)")
print("Стойноста на мързеливото пропърти е \(lazyPropExample.lazyProp.count)")
print("Стойноста в нормалното пропърти 'regularInt' е \(lazyPropExample.regularInt)")



print("")
print("")
print("")


//: ## Kласове
class Media {
    var name: String = ""
    var sizeInBytes: Double = 0.0
}


//: ### порменлива
var movie = Media()
movie.name = "X-Men"
print("Media name: \(movie.name)")

let ref = movie
//let ref = Media()
print("Media ref name: \(ref.name)")
movie.name = "X-Men 2"
print("Media ref name: \(ref.name)")

print("Media movie name: \(movie.name)")


//: ### Разликите между референтни типове и стойностни типове
struct MediaList {
    let item: Media = Media()
    var count = 1
}

let mediaList = MediaList()

let newMediaList = mediaList


print("Media ref name: \(mediaList.item.name)")
mediaList.item.name = "new name"
//предизвиква грешка
//mediaList.count = 5
print("Media ref name: \(mediaList.item.name)")
newMediaList.item.name = "new media list"
print("Media ref name: \(mediaList.item.name)")
var newMediaList2 = mediaList
//това работи, понеже newMediaList2 е променлива
newMediaList2.count = 5
//това също работи
newMediaList2.item.name = "X-Men 2.5"

let constMediaList = mediaList
//това също работи
constMediaList.item.name = "X-Men 3"




print("")
print("")
print("")

//: ## Предаване по стойност (Value types)
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

//: ## Предаване по референция (reference types)

//TODO:

//: ## Наследяване

//: Какво е базов клас?
//: - Note:
//: В Swift, ако не е посочен базов клас в клас дефинирани от нас, то няма подразбиращ се базов клас от който всички типове произхождат. Разлика с Java - ```Object``` (https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html).
enum Color {
    case pink
    case green
    case black
    case blue
    case white
    case noColor
}

class Show {
    var name: String
    var color: Color
    var country: String
    var language: String
    var duration: Double
    
//    init(name:String) {
//        self.name = name
//        color = .noColor
//        self.country = "no country"
//        language = "BG"
//        duration = 0.0
//    }
    
    init() {
        self.name = " no name "
        color = .noColor
        self.country = "no country"
        language = "BG"
        duration = 0.0
    }
    
//    convenience init() {
//        self.init(name: "No name")
//    }
    
    
    var durationInMinutes:String {
        let minutes:Int = Int(round(duration))
        let minutesInHour = 60
        return "\(minutes / minutesInHour) : \(minutes % minutesInHour) min"
    }
    
    func shortDescription() -> String {
        return "\(name) - \(language) :  Duration: \(durationInMinutes)"
    }
    
    deinit {
        print("deinit \(#function)" )
    }
}

extension Show {
    convenience init(name:String, duration:Double) {
        self.init()
        self.name = name
        self.duration = duration
    }
    
//    convenience init(name:String) {
//        self.init()
//        self.name = name
//    }
    
}

class TVShow : Show {
    var series:Int
    
    //var duration: Double;
    
    override init() {
        series = 0
        //извиква конструиращия метод на бащиния клас
//        super.init(name:"TVSHOW")
//        super.init(name: name, country: "no countrye")
    }
    
    init(name:String) {
        series = 0
        super.init()
        super.name = name
        //извиква конструиращия метод на бащиния клас
//        super.init(name:name)
        //        super.init(name: name, country: "no countrye")
    }
    
//    convenience init() {
//        self.init(name: "no name")
//    }
    
    var isTurkish:Bool {
        return self.language == "TR" && self.series > 100
    }
    
    override func shortDescription() -> String {
        return super.shortDescription() + " v.2"
    }
    
    deinit {
        print("deinit TVShow" )
    }
}

//extension TVShow:Show {
//    
//}


var blackSails:TVShow = TVShow(name: "Balck Sails", duration: 123)
//var blackSails:TVShow = TVShow()
//blackSails.duration = 134
print("")
print("")
print("")
print("")

print(blackSails.shortDescription())

blackSails = TVShow()

//: Как дефинираме, че даден клас е наследник на друг и какво означава това?

//: Наследяване на произволно ниво. Какво ни носи това?


//: Предефиниране (overriding)

//: Достъп до базовите методи, пропъртита и subscript-s, става чрез ```super```

//: - Note:
//: В Swift, изпозлваме запазената дума ```override``` за да обозначим, че предефинираме дадена функци, пропърти (get & set).


//: Можем да обявим функция или пропърти, че няма да се променят. За целта използваме ```final```.

//: Можем да обявим дори и цял клас. ```final class``` - класът няма да може да бъде наследяван.



//: Инициализатори (init методи)

struct StructBook {
    var pageCount = 0
    var title = "no title"
    var publishDate:Date? = nil
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

var book = Book()
book.pageCount = 100

var book100 = Book(pages: 100)

var book2 = StructBook(pageCount: 1000, title: "Swift 3", publishDate: nil)


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




