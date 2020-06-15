import UIKit
import PlaygroundSupport

enum CarManufacturing {
    case vaz, gaz
}

enum CarAction {
    case windowOpen, windowClose, engineOn, engineOff
}

protocol CarActionExecution {
    var isWindowOpen: Bool {get set}
    var isEngineOn: Bool {get set}
}

extension CarActionExecution {
    mutating func carActionExecution(action: CarAction) {
        switch action {
        case .windowOpen :
            guard !isWindowOpen else {
                print("Окна уже открыты")
                break
            }
            isWindowOpen = true
            print("Окна открыты")
        case .windowClose :
            guard isWindowOpen else {
                print("Окна уже закрыты")
                break
            }
            isWindowOpen = false
            print("Окна закрыты")
        case .engineOn :
            guard !isEngineOn else {
            print("Двигатель уже работает")
            break
        }
            isEngineOn = true
            print("Двигатель работает")
        case .engineOff :
            guard isEngineOn else {
            print("Двигатель уже остановлен")
            break
        }
            isEngineOn = false
            print("Двигатель остановлен")
        }
    }
}

enum SportCarAction {
    case speedUp(speed: Int)
}

protocol SportCarActionExecution {
    var speed: Int {get set}
}

extension SportCarActionExecution {
    mutating func sportCarActionExecution(action: SportCarAction) {
        switch action {
        case let .speedUp(speed) :
            self.speed += speed
            print("Скорость \(self.speed)")
        }
    }
}

enum TrunkCarAction {
    case trunkLoad(weight: Int)
    case trunkUnload(weight: Int)
}

protocol TrunkCarActionExecution {
    var trunkValueMax: Int {get set}
    var trunkValue: Int {get set}
}

extension TrunkCarActionExecution {
    mutating func trunkCarActionExecution(action: TrunkCarAction) {
        switch action {
        case let .trunkLoad(weight) :
            guard trunkValueMax > trunkValue + weight else {
                print("Нехватает места, свободно \(trunkValueMax - trunkValue)")
                break
            }
            trunkValue += weight
            print("Успешно погружено \(trunkValue)")
        case let .trunkUnload(weight) :
            guard trunkValue - weight > 0 else {
                print("В багажнике груза меньше, чем выгружается \(trunkValue)")
                break
            }
            trunkValue -= weight
            print("Успешно выгружено \(trunkValue)")
        }
    }
}

class SportCar: CarActionExecution, SportCarActionExecution {
    var isWindowOpen: Bool = false
    var isEngineOn: Bool = false
    var speed: Int = 0
    let manufacturing: CarManufacturing
    init(manufacturing: CarManufacturing) {
        self.manufacturing = manufacturing
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Состояние двигателя: \(isEngineOn) Состояние окон: \(isWindowOpen) Текущая скорость: \(speed) Производитель: \(manufacturing) "
    }
}

class TrunkCar: CarActionExecution, TrunkCarActionExecution {
    var isWindowOpen: Bool = false
    var isEngineOn: Bool = false
    var trunkValueMax: Int
    var trunkValue: Int = 0
    let manufacturing: CarManufacturing
    init(manufacturing: CarManufacturing, trunkValueMax: Int) {
        self.manufacturing = manufacturing
        self.trunkValueMax = trunkValueMax
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Состояние двигателя: \(isEngineOn) Состояние окон: \(isWindowOpen) Максимальный обьем багажника: \(trunkValueMax) Заполненный обьем багажника: \(trunkValue) Производитель: \(manufacturing) "
    }
}

var sportCar: SportCar = SportCar(manufacturing: .vaz)
sportCar.carActionExecution(action: .engineOn)
sportCar.sportCarActionExecution(action: .speedUp(speed: 20))
print(sportCar)

var trunkCar: TrunkCar = TrunkCar(manufacturing: .gaz, trunkValueMax: 100)
trunkCar.carActionExecution(action: .engineOff)
trunkCar.trunkCarActionExecution(action: .trunkLoad(weight: 50))
print(trunkCar)
