import OpenAPIRuntime
import OpenAPIURLSession

typealias Schedule = Components.Schemas.SingleStationRoutes

protocol ScheduleServiceProtocol {
    func getSchedule(station: String, date: String) async throws -> Schedule
}

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getSchedule(station: String, date: String) async throws -> Schedule {
        let response = try await client.getSchedule(query: .init(apikey: apikey,
                                                                 station: station,
                                                                 date: date))
        return try response.ok.body.json
    }
}
