import OpenAPIRuntime
import OpenAPIURLSession

typealias Thread = Components.Schemas.SingleThread

protocol ThreadServiceProtocol {
    func getThread(uid: String) async throws -> Thread
}

final class ThreadService: ThreadServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getThread(uid: String) async throws -> Thread {
        let response = try await client.getThreads(query: .init(apikey: apikey,
                                                                uid: uid))
        return try response.ok.body.json
    }
}
