import Foundation

// Решить квадратное уравнение.

// зададим значения для уравнения
let a: Double = 1
let b: Double = 5
let c: Double = 3

// посчитаем дискриминант
let d = b * b - 4 * a * c

// в зависимости от вычисленного дискримината ищем решения уравнения
if (d > 0) {
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    
    print("Решение уравнения: x1 = " + String(x1) + "; x2 = " + String(x2))
} else if (d == 0) {
    let x = -b / (2 * a)
    print("Решение уравнения: x = " + String(x))
    
} else {
    print("Нет решений")
}

// Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

// зададим катеты
let c1: Double = 4
let c2: Double = 7

let s = 1/2 * c1 * c2
let h = sqrt(c1 * c1 + c2 * c2)
let p = c1 + c2 + h

print("Считаем треугольник.")
print("Площадь = " + String(s))
print("Гипотенуза = " + String(h))
print("Периметр = " + String(p))

// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

// создадим вклад
var deposit: Double = 5000
let percent: Double = 2

for _ in 1...5 {
   deposit += deposit * (percent / 100)
}

print("Сумма вклада через 5 лет составит: " + String(round(deposit)))
