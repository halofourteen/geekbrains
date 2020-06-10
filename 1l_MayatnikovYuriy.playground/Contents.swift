import UIKit
import PlaygroundSupport

enum Manufactor {
    case vaz, gaz, kamaz
}

enum CarActions {
    case engineOn, engineOff, windowsOpen, windowsClose
    case trunkLoad(weight: Int)
    case trunkUnload(weight: Int)
}

struct Car {

    let color: UIColor
    let manufactor: Manufactor
    let yearOfManufacture: Int
    var trunkVolume: Int
    let trunkVolumeMax: Int
    var engineRunning: Bool
    var windowsOpen: Bool

    mutating func carAction(action: CarActions) {
        switch action {
        case .engineOn:
            engineRunning == true ? print("двигатель уже запущен") : print("двигатель запущен")
            engineRunning = true
        case .engineOff:
            engineRunning == false ? print("двигатель уже выключен") : print("двигатель выключен")
            engineRunning = false
        case .windowsOpen:
            windowsOpen == true ? print("окна уже открыты") : print("окна открыты")
            windowsOpen = true
        case .windowsClose:
            windowsOpen == false ? print("окна уже закрыты") : print("окна закрыты")
            windowsOpen = false
        case let .trunkLoad(weight) :
            if trunkVolumeMax < trunkVolume + weight {
                print("нехватает места, осталось \(trunkVolumeMax - trunkVolume)")
            }
            else {
                trunkVolume += weight
                print("разгружено \(trunkVolume)")
            }
        case let .trunkUnload(weight) :
            if trunkVolume - weight < 0 {
                print("нехватает места, осталось \(trunkVolume)")
            }
            else {
                trunkVolume -= weight
                print("разгружено \(trunkVolume)")
            }
        }
    }

    init(color: UIColor, manufactor: Manufactor, yearOfManufacture: Int, trunkVolumeMax: Int) {
        self.color = color
        self.manufactor = manufactor
        self.yearOfManufacture = yearOfManufacture
        self.trunkVolumeMax = trunkVolumeMax
        trunkVolume = 0
        engineRunning = false
        windowsOpen = false
    }

}

struct Truck {

    let color: UIColor
    let manufactor: Manufactor
    let yearOfManufacture: Int
    var trunkVolume: Int
    let trunkVolumeMax: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    mutating func carAction(action: CarActions) {
        switch action {
        case .engineOn:
            engineRunning == true ? print("двигатель уже запущен") : print("двигатель запущен")
            engineRunning = true
        case .engineOff:
            engineRunning == false ? print("двигатель уже выключен") : print("двигатель выключен")
            engineRunning = false
        case .windowsOpen:
            windowsOpen == true ? print("окна уже открыты") : print("окна открыты")
            windowsOpen = true
        case .windowsClose:
            windowsOpen == false ? print("окна уже закрыты") : print("окна закрыты")
            windowsOpen = false
        case let .trunkLoad(weight) :
            if trunkVolumeMax < trunkVolume + weight {
                print("нехватает места, осталось \(trunkVolumeMax - trunkVolume)")
            }
            else {
                trunkVolume += weight
                print("погружено \(trunkVolume)")
            }
        case let .trunkUnload(weight) :
            if trunkVolume - weight < 0 {
                print("нехватает места, осталось \(trunkVolume)")
            }
            else {
                trunkVolume -= weight
                print("разгружено \(trunkVolume)")
            }
        }
    }

    init(color: UIColor, manufactor: Manufactor, yearOfManufacture: Int, trunkVolumeMax: Int) {
        self.color = color
        self.manufactor = manufactor
        self.yearOfManufacture = yearOfManufacture
        self.trunkVolumeMax = trunkVolumeMax
        trunkVolume = 0
        engineRunning = false
        windowsOpen = false
    }

}

var car = Car(color: .red, manufactor: .vaz, yearOfManufacture: 1990, trunkVolumeMax: 350)

car.carAction(action: .engineOn)
car.carAction(action: .windowsOpen)
car.carAction(action: .trunkLoad(weight: 100))
car.carAction(action: .trunkLoad(weight: 300))

var truck = Truck(color: .orange, manufactor: .kamaz, yearOfManufacture: 2015, trunkVolumeMax: 10000)

truck.carAction(action: .engineOn)
truck.carAction(action: .windowsClose)
truck.carAction(action: .trunkLoad(weight: 10000))
truck.carAction(action: .trunkUnload(weight: 5000))


//print(car)
//print(truck)
