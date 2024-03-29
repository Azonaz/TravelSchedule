import OpenAPIRuntime
import OpenAPIURLSession

typealias Carriers = Components.Schemas.Carriers

protocol CarriersServiceProtocol {
    func getCarriers(code: String) async throws -> Carriers
}

final class CarriersService: CarriersServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarriers(code: String) async throws -> Carriers {
        let response = try await client.getCarrier(query: .init(apikey: apikey,
                                                                code: code))
        return try response.ok.body.json
    }
}
