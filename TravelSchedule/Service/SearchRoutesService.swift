import OpenAPIRuntime
import OpenAPIURLSession

typealias Routes = Components.Schemas.Routes

protocol SearchRoutesServiceProtocol {
    func searchRoutes(fromCity: String, toCity: String, date: String) async throws -> Routes
}

final class SearchRoutesService: SearchRoutesServiceProtocol {
    private let client: Client
    private let apikey: String

    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }

    func searchRoutes(fromCity: String, toCity: String, date: String) async throws -> Routes {
        let response = try await client.searchRoutes(query: .init(apikey: apikey,
                                                                  from: fromCity, to: toCity,
                                                                  date: date))
        return try response.ok.body.json
    }
}
