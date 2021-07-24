import UIKit
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum windows{
    case open
    case closed
}
enum engine{
    case on
    case off
}
enum boost{
    case boostOn
    case boostOff
}
enum luggage{
    case trunkIsFull
    case TrunkIsEmpty
}
protocol Car {
    var brand: String {get}
    var release: Int {get}
    var engineState: engine {get set}
    var windowsState: windows {get set}
}
extension Car {
    mutating func engineStateToggle(engineState: engine){
        self.engineState = engineState
    }
    mutating func windowsStateToggle(windowsState: windows){
        self.windowsState = windowsState
    }
}



class sportCar: Car {
    var brand: String
    var release: Int
    var engineState: engine
    var windowsState: windows
    var nitroState: boost = .boostOff
    
    init(brand: String, release: Int) {
        self.brand = brand
        self.release = release
        self.engineState = .off
        self.windowsState = .closed
    }
}
class trunkCar: Car {
    var brand: String = ""
    var release: Int = 0
    var engineState: engine
    var windowsState: windows
    var trunkState: luggage = .TrunkIsEmpty

    init(brand: String, release: Int) {
        self.brand = brand
        self.release = release
        self.engineState = .off
        self.windowsState = .closed
    }
}

extension trunkCar: CustomStringConvertible{
    var description: String{
        return "Двигатель в грузовике \(brand) \(engineState == .on ? "включен" : "выключен"), окна \(windowsState == .closed ? "закрыты" : "открыты"), цистерна \(trunkState == .TrunkIsEmpty ? "пуста" : "полна"), год выпуска \(release)"
    }
}

extension sportCar: CustomStringConvertible{
    var description: String{
        return "Двигатель в спортивной машине \(brand) \(engineState == .on ? "включен" : "выключен"), окна \(windowsState == .closed ? "закрыты" : "открыты"), ускорение \(nitroState == .boostOff ? "выключено" : "включено"), год выпуска \(release)"
    }
}

var bmwTrunk = trunkCar(brand: "BMW", release: 2020)
bmwTrunk.windowsStateToggle(windowsState: .open)
print(bmwTrunk.description)

var hondaSport = sportCar(brand: "Honda", release: 2021)
hondaSport.nitroState = .boostOn
hondaSport.engineStateToggle(engineState: .on)
print(hondaSport.description)
