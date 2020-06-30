import UIKit
import PlaygroundSupport

enum BakeryShopError : Error {
    case notInMenu
    case outOfStock
    case insufficientFunds(coinsNeeded: Double)
}

enum Bakery {
    case dunkin, mrdonut
}

struct Product {
    var price: Double
    var count: UInt
    var bakeType: Bakery
}

class BakeryShop {
    var product: [String: Product] = [
        "Croissant": Product(price: 50, count: 0, bakeType: .dunkin),
        "Donut": Product(price: 40, count: 5, bakeType: .mrdonut)
    ]
    
    var funds: Double = 0
    
    private func tryToBuy(_ item: String) throws -> Bool {
        guard var bakeType = product[item] else {
            throw BakeryShopError.notInMenu
        }
        guard funds >= bakeType.price else {
            throw BakeryShopError.insufficientFunds(coinsNeeded: bakeType.price - funds)
        }
        guard bakeType.count > 0 else {
            throw BakeryShopError.outOfStock
        }
        funds -= bakeType.price
        bakeType.count -= 1
        
        return true
    }
    
    func buy(_ item: String) -> String {
        do {
            try bakery.tryToBuy(item)
            return "Вы купили \(item)"
        } catch let BakeryShopError.insufficientFunds(coinsNeeded) {
            return "Не хватает еще \(coinsNeeded)"
        } catch BakeryShopError.outOfStock {
            return "Товар закончился"
        } catch BakeryShopError.notInMenu {
            return "Нет в меню"
        } catch let error {
            return error.localizedDescription
        }
    }
}

var bakery: BakeryShop = BakeryShop()

bakery.funds = 50

print(bakery.buy("Croissant"))
print(bakery.buy("Donut"))
print(bakery.buy("Cheesecake"))

class NewBakeryShop {
    var product: [String: Product] = [
        "Croissant": Product(price: 50, count: 0, bakeType: .dunkin),
        "Donut": Product(price: 40, count: 5, bakeType: .mrdonut)
    ]
    
    var funds: Double = 0
    
    func buy(_ item: String) -> (String?, BakeryShopError?) {
        guard var productItem = product[item] else {
            return (nil, BakeryShopError.notInMenu)
        }
        guard funds >= productItem.price else {
            return (nil, BakeryShopError.insufficientFunds(coinsNeeded: productItem.price - funds))
        }
        guard productItem.count > 0 else {
            return (nil, BakeryShopError.outOfStock)
        }
        funds -= productItem.price
        productItem.count -= 1
        
        return (item, nil)
    }
}

var newBakery: NewBakeryShop = NewBakeryShop()

newBakery.funds = 100

let sell1 = newBakery.buy("Croissant")
let sell2 = newBakery.buy("Donut")
let sell3 = newBakery.buy("Cheesecake")

if let product = sell1.0 {
    print("Вы купили: \(product)")
} else if let error = sell1.1 {
    print("Произошла ошибка: \(error)")
}

if let product = sell2.0 {
    print("Вы купили: \(product)")
} else if let error = sell2.1 {
    print("Произошла ошибка: \(error)")
}

if let product = sell3.0 {
    print("Вы купили: \(product)")
} else if let error = sell3.1 {
    print("Произошла ошибка: \(error)")
}
