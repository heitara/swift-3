//: Playground - noun: a place where people can play

import UIKit

// Избор на студент, който да презентира текущата задача
// курс: Увод в прогрмаирането със Swift


//разширения, които редуцират код-а за писане във файл
//http://stackoverflow.com/questions/27327067/append-text-or-data-to-text-file-in-swift
extension String {
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }
    
    func appendToURL(fileURL: URL) throws {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(fileURL: fileURL)
    }
}

extension Data {
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            //затвори файла преди края на функцията
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            //записва файла за пръв път (създава го)
            try write(to: fileURL, options: .atomic)
        }
    }
}

//колекция от студенти
var students:[String] = []

let filePath = Bundle.main.path(forResource: "students", ofType: "txt")
//четене на файл
if let path = filePath  {
    let content = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
    if let c = content {
        //ред по ред
        students = c.components(separatedBy: .newlines)
    }
}
//print(students)
//премахваме празните записи
students = students.filter({ (item) -> Bool in
    !item.isEmpty
})


print("Всички студенти: \(students)")

let pickedStudents = "students-out.txt"
let dir: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as URL
let url = dir.appendingPathComponent(pickedStudents)


var picked:[String] = []
//прочитаме изтеглените преди това студенти
do {
    let content = try String(contentsOf: url as URL, encoding: String.Encoding.utf8)
    picked = content.components(separatedBy: .newlines)
}
catch {
    print("Файлът липсва :(")
}
//премахваме празните записи3
picked = picked.filter({ (item) -> Bool in
    !item.isEmpty
})

print("Избрани студенти: \(picked)")

//броят на избраните студенти не трябва да надхвърля всички студенти
assert(picked.count < students.count)


var hasPickedStudent = false
var pickedStudent = "no-student"
//избираме студент, който не е бил избран
repeat {
    var randomIndex = Int(arc4random_uniform(UInt32(students.count)))
    
    pickedStudent = students[randomIndex]
    
    if picked.index(of: pickedStudent) == nil {
        hasPickedStudent = true
        print("Избран студент: \(pickedStudent)")
    } else {
        print("...")
    }
    
} while !hasPickedStudent


do {
//    print("Къде се намира файлът: \(url)")
    try pickedStudent.appendLineToURL(fileURL: url as URL)
}
catch {
    print("Не може да запише файла :(")
}



