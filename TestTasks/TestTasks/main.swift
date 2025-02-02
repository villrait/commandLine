import Foundation

//5 Объявить две опциональные переменные типа Double. Одной из них задать первоначальное значение. Написать функцию, которая принимает на вход опциональную переменную типа Double. Функция должна безопасно извлечь значение из входящей переменной. Если значение удалось получить - необходимо вывести его в консоль, если значение у переменной отсутствует вывести в консоль фразу "Variable can't be unwrapped". Вызвать функцию дважды с двумя ранее созданными переменными.
//
//  main.swift
//  TestTasks
//
//  Created by м on 28.01.2025.

protocol Testable {
    func runTest()
}

class TestTask: Testable {
    private func show(_ value: Double?) { // имя функции show потому что при слове print - код ломается. В ифах ошибки возникают
        if let val = value {
            print(val)
        } else {
            print("Variable can't be unwrapped")
        }
    }
    
    func runTest() {
        var doubleOptional: Double? = 2.2
        var doubleOptional2: Double?
        
        show(doubleOptional)
        show(doubleOptional2)
    }
}

//6. Напишите программу для вывода первых 15 чисел последовательности Фибоначчи

class Fibonachi: Testable {
    private func calculateFibonachi(_ int: Int) -> Int {
        if int <= 1 {
            return int
        } else {
            return calculateFibonachi(int - 1) + calculateFibonachi(int - 2)
        }
    }
    
    func runTest() {
        for i in 0...15 {
            print("calculateFibonachi: number \(i) = \(calculateFibonachi(i))")
            
        }
    }
}

//7. Напишите программу для сортировки массива, использующую метод пузырька. Сортировка должна происходить в отдельной функции, принимающей на вход исходный массив.

class Bubble: Testable {
    
    private func bubbleSort(array: [Int]) -> [Int] {
        var arr = array
        var n = arr.count
        for i in 0..<n-1 {
            for j in 0..<n-i-1 {
                if arr[j] > arr[j+1] {
                    let temp = arr [j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        return arr
    }
    
    func runTest() {
        let unsortedArr = [3,2,5,1,8,0]
        let sortedArr = bubbleSort(array: unsortedArr)
        print("Bubble Sort: \(unsortedArr) -> \(sortedArr)")
    }
}

// ну или такой вариант мне более привычен и понятен(потому что чем больше в дебри логики кода начинаешь уходить, тем меньше я его понимаю)
//
//let bubble2 = [5,4,3,2,1]
//bubble2.sorted { $0 < $1 }

//8. Напишите программу, решающую задачу: есть входящая строка формата "abc123", где сначала идет любая последовательность букв, потом число. Необходимо получить новую строку, в конце которой будет число на единицу больше предыдущего, то есть "abc124".

class IncrementNumberTask: Testable {
    private func incrementNumber(_ string: String) -> String {

        var result = string
        
        guard let lastNumberSubstring = string.components(separatedBy: CharacterSet.decimalDigits.inverted).last,
              let number = Int(lastNumberSubstring),
              let lastNumberRange = string.range(of: lastNumberSubstring) else {
            return string
        }

        let incrementNumber = number + 1
        
        result.replaceSubrange(lastNumberRange, with: "\(incrementNumber)")

        return result

    }

    func runTest() {
        var text1 = "abc123"
        
        var incrementText1 = incrementNumber(text1)
        
        print("Increment text: \(text1) -> \(incrementText1)")
    }
}

let tasks: [Testable] = [TestTask(), Fibonachi(), Bubble()]

for task in tasks {
    print("\n")
    task.runTest()
}
