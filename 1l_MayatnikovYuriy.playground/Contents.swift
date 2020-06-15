import UIKit
import PlaygroundSupport

enum Manufactor {
    case vaz, gaz, kamaz
}

enum Action {
    case trunkLoad(weight: Int)
    case trunkUnload(weight: Int)
    case speedUp(speed: Int)
}

class Car {
    let color: UIColor
    let manufactor: Manufactor
    let yearManufacture: Int

    func action(action: Action) {

    }

    func printProperties() {
        print("Цвет color: \(color) manufactor: \(manufactor) yearManufacture: \(yearManufacture)")
    }

    init(color: UIColor, manufactor: Manufactor, yearManufacture: Int) {
        self.color = color
        self.manufactor = manufactor
        self.yearManufacture = yearManufacture
    }
}

class TrunkCar: Car {
    let trunkValueMax: Int
    var trunkValue: Int = 0

    init(color: UIColor, manufactor: Manufactor, yearManufacture: Int, trunkValueMax: Int) {
        self.trunkValueMax = trunkValueMax
        super.init(color: color, manufactor: manufactor, yearManufacture: yearManufacture)
    }

    override func action(action: Action) {
        switch action {
        case let .trunkLoad(weight) :
            if trunkValueMax < trunkValue + weight {
                print("Нехватает места, свободно \(trunkValueMax - trunkValue)")
            }
            else {
                trunkValue += weight
                print("Успешно погружено \(trunkValue)")
            }
        case let .trunkUnload(weight) :
            if trunkValue - weight < 0 {
                print("В багажнике груза меньше, чем выгружается \(trunkValue)")
            }
            else {
                trunkValue -= weight
                print("Успешно выгружено \(trunkValue)")
            }
        default :
            print("Недоступно")
        }
    }

    override func printProperties() {
        super.printProperties()
        print("trunkValueMax: \(trunkValueMax)\ntrunkValue: \(trunkValue)")
    }
}

class SportCar: Car {
    var speed: Int

    init(color: UIColor, manufactor: Manufactor, yearManufacture: Int, speed: Int) {
        self.speed = speed
        super.init(color: color, manufactor: manufactor, yearManufacture: yearManufacture)
    }

    override func action(action: Action) {
        switch action {
        case let .speedUp(speed) :
            self.speed += speed
            print("Скорость \(self.speed)")
        default :
            print("Недоступно")
        }
    }

    override func printProperties() {
        super.printProperties()
        print("speed: \(speed)")
    }
}

var trunkCar: TrunkCar = TrunkCar(color: .black, manufactor: .kamaz, yearManufacture: 1989, trunkValueMax: 100)
var sportCar: SportCar = SportCar(color: .white, manufactor: .vaz, yearManufacture: 2015, speed: 180)

trunkCar.action(action: .speedUp(speed: 10))
trunkCar.action(action: .trunkLoad(weight: 5000))
trunkCar.action(action: .trunkLoad(weight: 100))

sportCar.action(action: .trunkLoad(weight: 10))
sportCar.action(action: .speedUp(speed: 50))

trunkCar.printProperties()
sportCar.printProperties()
