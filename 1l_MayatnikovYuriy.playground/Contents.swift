import UIKit
import PlaygroundSupport

func getEvenNumber (num: Int) -> Bool {
    return num % 2 == 0
}

func getNumberDivByThree (num: Int) -> Bool {
    return num % 3 == 0
}

func makeArrayIncrease (numStart: Int, arrCount: Int) -> [Int] {
    var arr: [Int] = []
    for i in 0..<arrCount {
        arr.append(numStart + i)
    }
    return arr
}

var arr: [Int] = makeArrayIncrease(numStart: 1, arrCount: 100)
for index in stride(from: arr.count - 1, through: 0, by: -1) {
    if getNumberDivByThree(num: arr[index]) || getEvenNumber(num: arr[index]) {
        arr.remove(at: index)
    }
}
print(arr)
