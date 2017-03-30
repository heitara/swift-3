//: Playground - noun: a place where people can play

import UIKit

/*
 Какво е playground?
 
 Това вид проект, който се изпозлва от xCode. Интерактивно показва какво е състоянието на паметта на компютъра във всеки един ред на изпълнение на код-а. Позволява лесно онагледяване на примерния код. Много по лесно може да се анализира кода. Можем да скицираме проблеми и техните решения, които да използваме за напред.
 
 */



// Лекция 4
// курс: Увод в прогрмаирането със Swift


/* N-торки */
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

var x:Int? = 7
print("\(x)")


/* Интересен пример, който демонстира силата на switch */

let point = (1, 1)
switch point {
case let (x, y) where x == y:
    print("X is \(x). Y is \(y). They have the same value.");
case (1, let y):
    print("X is 1. Y is \(y). They could be different.");
case (let x, 1):
    print("X is \(x). Y is 1. They could be different.");
case let (x, y) where x > y:
    print("X is \(x). Y is \(y). X is greater than Y.");
default:
    print("Are you sure?")
}

//Нека да напишем първата функция, която агрегира няколко действия.

//без параметри и без резултат
func severalActions() {
    print("Action 1")
    print("Action 2")
    print("Action 3")
}

//сума на две числа
func printSum() {
    let a = 3
    let b = 4
    print("Sum \(a) + \(b) = \(a + b)")
}

//с параметри без резултат
//сума на две числа
func printSum(a:Int, b:Int) {
    return;
    print("Sum \(a) + \(b) = \(a + b)")
}

//извикване на функцията
printSum()

//printSum(3, 5)
printSum(a:3, b:5)


//променливите са let
func sum(a:Int, b:Int,in sum: inout Int) {
//    a = a + b
    sum = a + b
}

var sumAB:Int = 0
sum(a:3, b:4, in:&sumAB)



//тук ще активираме нашата функция. Може да мислим че я извикваме (call)
severalActions()
//severalActions()


func functionName(labelName constantName:String) -> String {
    let reurnedValue = constantName + " was passed"
    return reurnedValue
}

func functionName(_ a: Int, _ variableName:Double = 5) -> String {
    let reurnedValue = String(variableName) + " was passed"
    return reurnedValue
}

//functionName(1);
functionName(17);

func f(_ a:Int, _ b:String = "dsadsa", s:String = "dsadsa" ) {
    let _ = String(a) + " was passed"
    print("F1001")
}

func f(_ a:Int,_ b:String = "dsadsa" ) {
    let _ = String(a) + " was passed"
    print("F1000")
}

//func f(_ a:Int) {
//    let _ = String(a) + " was passed"
//    print("F1")
//}


f(4)


func functionName(_ variableName:String) -> String {
    let reurnedValue = variableName + " was passed"
    return reurnedValue
}
//ако променим името на аргумента swift счита това за нова различна функция. Т.е. имената на аргумента
func functionName(labelNameNew variableName:String) -> String {
    let reurnedValue = variableName + " NEW was passed"
    return reurnedValue
}

//ето и извикването на функцията
let resultOfFunctionCall = functionName(labelName: "Nothing")
let resultOfFunctionCall2 = functionName("Nothing")

functionName(labelNameNew: "Nothing")
//когато изпуснем името на аргумента, името на променливата се изпозлва за негово име. т.е. двете съвпадат
func functionName(variableName:String) -> String {
    let reurnedValue = variableName + " was passed. v2"
    return reurnedValue
}

//за да извикаме 2рата версия трябва да направим следното обръщение
functionName(variableName: "Nothing")
//
func functionName3(variableName:String) -> String {
    return variableName + " was passed"
}

//Пример: на български език

//как би изглеждал код-а функцията, ако използваме utf и кирилица
func смениСтойността(на вход:inout Int,с новаСтойност: Int) {
    вход = новаСтойност
}

func смениСтойността(_ вход:inout Int,_ новаСтойност: Int) {
    вход = новаСтойност
}
var променлива = 5
смениСтойността(на: &променлива, с: 15)
print("Стойността на променливата е \(променлива)")
//класическото програмиране, с което сме свикнали от C, C++, Java
смениСтойността(&променлива, 25)
print("Стойността на променливата е \(променлива)")



//функция, която връша резултат
func seven() -> Int {
    return 7
}

let s = seven()
print("Това е числото \(s).")

/*
// невалидна функция
func functionName(argumentName variableName:String, argumentName variableName2:Int) -> String {
    let reurnedValue = variableName + " was passed"
    return reurnedValue
}
 */

//как да не позлваме името на аргумент
func concatenateStrings(_ s1:String, _ s2:String) -> String {
    return s1 + s2
}

let helloWorld = concatenateStrings("Hello ", "world!")


//define a function which finds min and max value in a array of integers
func minMax(numbers:[Int]) -> (Int, Int) {
    var min = Int.max
    var max = Int.min
    
    for val in numbers {
        if min > val {
            min = val
        }
        
        if max < val {
            max = val
        }
    }
    
    return (min, max)
}

print(minMax(numbers: [12, 2, 6, 3, 4, 5, 2, 10]))

func maxItemIndex(numbers:[Int]) -> (item:Int, index:Int) {
    var index = -1
    var max = Int.min
    
    for (i, val) in numbers.enumerated() {
        if max < val {
            max = val
            index = i
        }
    }
    
    return (max, index)
}

let maxItemTuple = maxItemIndex(numbers: [12, 2, 6, 3, 4, 5, 2, 10])
if maxItemTuple.index >= 0 {
    print("Max item is \(maxItemTuple.item).")
}



func generateGreeting(greet:String, thing:String = "world") -> String {
    return greet + thing + "!"
}

print(generateGreeting(greet: "Hello "))
print(generateGreeting(greet: "Hello ", thing: " Swift 4"))


func maxValue(params numbers:Int...) -> Int {
    var max = Int.min
    for v in numbers {
        if max < v {
            max = v
        }
    }
    
    return max
}

func maxValue(params numbers:Int) -> Int {
    return numbers
}


print(maxValue(params: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5,  1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 50, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5))
print(maxValue(params: 1))




func updateVar(_ x: inout Int, newValue: Int = 5) {
    x = newValue
}

var ten = 10
print(ten)
updateVar(&ten, newValue: 15)
print(ten)

//the same example as above, but the paramter has a label
func updateVar(oldVariable x: inout Int, newValue: Int = 5) {
    x = newValue
}

ten = 10
print(ten)
updateVar(oldVariable:&ten, newValue: 15)
print(ten)

func generateGreeting(_ greeting: String?) -> String {
    guard let greeting = greeting else {
        //there is no greeting, we return something and finish
        return "No greeting :("
    }
    //there is a greeting and we generate a greeting message
    return greeting + " Swift 4!"
}
print(generateGreeting(nil))
print(generateGreeting("Hey"))


let number = 5
let divisor = 3
let remainder = number % divisor //remainder is again integer
let quotient = number / divisor // quotient is again integer

let hey = "Hi"
let greeting = hey + " Swift 4!" //operator + concatenates strings







