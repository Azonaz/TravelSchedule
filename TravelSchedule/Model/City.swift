import Foundation

struct City {
    let name: String
    let stations: [String]

    static let mockCity1 = City(name: "Москва",
                                stations: ["Ленинградский вокзал", "Киевский вокзал", "Казанский вокзал"])
    static let mockCity2 = City(name: "Санкт-Петербург",
                                stations: ["Московский вокзал", "Ладожский вокзал", "Витебский вокзал"])
    static let mockCity3 = City(name: "Санкт-Петербург",
                                stations: ["Московский вокзал", "Ладожский вокзал", "Витебский вокзал"])
}
