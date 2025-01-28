import Foundation

//5 Объявить две опциональные переменные типа Double. Одной из них задать первоначальное значение. Написать функцию, которая принимает на вход опциональную переменную типа Double. Функция должна безопасно извлечь значение из входящей переменной. Если значение удалось получить - необходимо вывести его в консоль, если значение у переменной отсутствует вывести в консоль фразу "Variable can't be unwrapped". Вызвать функцию дважды с двумя ранее созданными переменными.
//

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
