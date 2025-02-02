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
        let doubleOptional: Double? = 2.2
        let doubleOptional2: Double? = nil
        
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
        let n = arr.count
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
        let text1 = "abc123"
        
        let incrementText1 = incrementNumber(text1)
        
        print("Increment text: \(text1) -> \(incrementText1)")
    }
}

//9. Написать простое замыкание в переменной myClosure, замыкание должно выводить в консоль фразу "I love Swift". Вызвать это замыкание. Далее написать функцию, которая будет запускать заданное замыкание заданное количество раз. Объявить функцию так: func repeatTask (times: Int, task: () -> Void). Функция должна запускать times раз замыкание task . Используйте эту функцию для печати «I love Swift» 10 раз.

class ClosureTask: Testable {
    var myClosure = {
        print("I love Swift")
    }

    func repeatTask(times: Int, task: () -> Void) {
        for _ in 0..<times {
            task()
        }
    }

    func runTest() {
        myClosure()
        repeatTask(times: 10, task: myClosure)
    }
}

//10. Условия: есть начальная позиция на двумерной плоскости, можно осуществлять последовательность шагов по четырем направлениям up, down, left, right. Размерность каждого шага равна 1. Создать перечисление Directions с направлениями движения. Создать переменную location с начальными координатами (0,0), создать массив элементами которого будут направления из перечисления. Положить в этот массив следующую последовательность шагов: [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]. Програмно вычислить какие будут координаты у переменной location после выполнения этой последовательности шагов.

class LocationTask: Testable {
    enum Directions {
        case up
        case left
        case right
        case down
    }

    var location = (x: 0, y: 0)

    var steps: [Directions] = [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]

    func processSteps() {
        for step in steps {
            switch step {
            case .right:
                location.x += 1
            case .left:
                location.x -= 1
            case .up:
                location.y += 1
            case .down:
                location.y -= 1
            }
        }
    }

    func runTest() {
        processSteps()
        print(location)
    }
}

//11. Создать класс Rectangle с двумя неопциональными свойствами: ширина и длина. Реализовать в этом классе метод вычисляющий и выводящий в консоль периметр прямоугольника. Создать экземпляр класса и вызвать у него этот метод.

class RectangleTask: Testable {
    let width: Int
    let lenght: Int
    
    init(width: Int, lenght: Int) {
        self.width = width
        self.lenght = lenght
    }
    
    private func calcPerimeter() -> Int {
        (width + lenght) * 2
    }
    
    func runTest() {
        let rectangle = calcPerimeter()
        print("Perimeter = \(rectangle)")
    }
    
}

let rectangle1 = RectangleTask(width: 4, lenght: 10)
let rectangle2 = RectangleTask(width: 3, lenght: 6)

let tasks: [Testable] = [rectangle1, rectangle2]

for task in tasks {
    task.runTest()
}


let tasks: [Testable] = [TestTask(), Fibonachi(), Bubble(), IncrementNumberTask(), ClosureTask(), LocationTask()]

for task in tasks {
    print("\n")
    task.runTest()
}
