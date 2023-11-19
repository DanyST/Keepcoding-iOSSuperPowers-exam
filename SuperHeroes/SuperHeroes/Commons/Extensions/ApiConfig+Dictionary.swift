import Foundation

extension ApiConfig {
    static var toDictionary: [String: Any] {
        [
            "hash": ApiConfig.hash,
            "apikey": ApiConfig.apikey,
            "ts": ApiConfig.ts,
        ]
    }
}
