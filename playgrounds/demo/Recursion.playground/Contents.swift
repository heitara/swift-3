//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let arr2 = 1..<11

func sum(items arr:[Int]) -> Int {
//    return arr.isEmpty ? 0 : arr.first! + sum(items: [Int](arr.dropFirst()))
    return sumHelp(index: 0, arr: arr)
}

func sumHelp(index i:Int, arr:[Int]) -> Int {
    
    return i >= arr.count ? 0 : arr[i] + sumHelp(index: i + 1, arr: arr)
}

sum(items: arr)



///////////////


let map: [[Int]] =
    [
        [0, 1, 0, 1, 0, 1],
        [0, 1, 0, 1, 0, 1],
        [0, 1, 1, 1, 0, 1],
        [1, 1, 0, 1, 0, 0],
        [0, 1, 0, 1, 0, 0],
        [0, 1, 0, 1, 0, 0],
        [0, 1, 0, 1, 0, 0],
]


func countries(map matrix:[[Int]]) -> Int {
    
    var m = matrix
    var c = 0
    var t = true
    while t {
        if let ind = firstZero(in: m) {
            print(ind)
            markCountry(stratingFrom: ind, in: &m)
            print(m)
            
            c += 1
            
        } else {
            t = false
            print("what???")
        }
    }
    
    return c;
}

func markCountry(stratingFrom position:(row: Int, column: Int),
                 in m: inout [[Int]]) {
    if position.column >= m[0].count
        || position.row >= m.count
        || position.row < 0
        || position.column < 0
        || !isEmpty(position: position, matrix: m){
        return
    }
    
    
    m[position.row][position.column] = 1
    
    markCountry(stratingFrom: (position.row + 1, position.column), in: &m)
    markCountry(stratingFrom: (position.row - 1, position.column), in: &m)
    markCountry(stratingFrom: (position.row, position.column - 1), in: &m)
    markCountry(stratingFrom: (position.row, position.column + 1), in: &m)
}

func isEmpty(position:(row: Int, column: Int), matrix:[[Int]]) -> Bool {
    return matrix[position.row][position.column] == 0
}



func firstZero(in matrix:[[Int]]) -> (row: Int, column: Int)? {
    var i = 0
    var j = 0
    
    while i < matrix.count  {
        j = 0 //Липсвашото парче код 
        while j < matrix[i].count {
            
            if matrix[i][j] == 0 {
                return (i, j)
            }
            
            j += 1
        }
        
        i += 1
    }
    
    return nil
}


countries(map: map)