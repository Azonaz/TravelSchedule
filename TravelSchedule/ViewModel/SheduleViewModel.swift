import Foundation
import OpenAPIURLSession

final class ScheduleViewModel: ObservableObject {
    @Published var cities: [City]

    init() {
        self.cities = [
            City(name: "Москва", stations: ["Ленинградский вокзал", "Киевский вокзал", "Казанский вокзал",
                                            "Курский вокзал", "Ярославский вокзал", "Белорусский вокзал"]),
            City(name: "Санкт-Петербург", stations: ["Московский вокзал", "Ладожский вокзал", "Витебский вокзал",
                                                     "Балтийский вокзал", "Финляндский вокзал"]),
            City(name: "Новосибирск", stations: ["Новосибирск-восточный", "Новосибирск-главный",
                                                 "Новосибирск-западный"]),
            City(name: "Великий Новгород", stations: ["Великий Новгород", "Новгород-Лужский"])
        ]
    }

    // swiftlint:disable force_try
    // Расписание рейсов между станциями
    func search() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = SearchRoutesService(client: client,
                                          apikey: Constants.apiKey)
        Task {
            do {
                let routes = try await service.searchRoutes(from: "c146",
                                                            to: "c213",
                                                            date: "2024-03-12")
                print(routes)
            } catch {
                print(error)
            }
        }
    }

    // Расписание рейсов по станции
    func schedule() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = ScheduleService(client: client,
                                      apikey: Constants.apiKey)
        Task {
            do {
                let schedule = try await service.getSchedule(station: "s9600213",
                                                             date: "2024-03-12")
                print(schedule)
            } catch {
                print(error)
            }
        }
    }

    // Список станций следования
    func thread() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = ThreadService(client: client,
                                    apikey: Constants.apiKey)
        Task {
            do {
                let thread = try await service.getThread(uid: "176YE_7_2")
                print(thread)
            } catch {
                print(error)
            }
        }
    }

    // Список ближайших станций
    func stations() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = NearestStationsService(client: client,
                                             apikey: Constants.apiKey)
        Task {
            do {
                let stations = try await service.getNearestStations(lat: 59.864177,
                                                                    lng: 30.319163,
                                                                    distance: 50)
                print(stations)
            } catch {
                print(error)
            }
        }
    }

    // Ближайший город
    func settlement() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = NearestSettlementService(client: client,
                                               apikey: Constants.apiKey)
        Task {
            do {
                let settlement = try await service.getNearestSettlement(lat: 59.864177,
                                                                        lng: 30.319163)
                print(settlement)
            } catch {
                print(error)
            }
        }
    }

    // Информация о перевозчике
    func carrier() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = CarriersService(client: client,
                                      apikey: Constants.apiKey)
        Task {
            do {
                let carriers = try await service.getCarriers(code: "680")
                print(carriers)
            } catch {
                print(error)
            }
        }
    }

    // Список всех доступных станций
    func stationsList() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = StationsListService(client: client,
                                          apikey: Constants.apiKey)
        Task {
            do {
                let stations = try await service.getStationList()
                let decodeStations = try await Data(collecting: stations, upTo: 50*1024*1024)
                let starionsList = try JSONDecoder().decode(StationsList.self, from: decodeStations)
                print(starionsList)
            } catch {
                print(error)
            }
        }
    }

    // Копирайт Яндекс Расписаний
    func copyright() {
        let client = Client(serverURL: try! Servers.server1(),
                            transport: URLSessionTransport())
        let service = CopyrightService(client: client,
                                       apikey: Constants.apiKey)
        Task {
            do {
                let copiright = try await service.getCopyright()
                print(copiright)
            } catch {
                print(error)
            }
        }
    }
    // swiftlint:enable force_try

}
