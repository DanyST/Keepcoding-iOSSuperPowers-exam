import Foundation

func getJSONModel<T: Decodable>(_ modelType: T.Type, resource: String) throws -> T? {
    guard let file = Bundle(for: HeroesNetworkMockSuccess.self).url(forResource: resource, withExtension: "json") else {
        return nil
    }
    
    let data = try Data(contentsOf: file)
    let model = try JSONDecoder().decode(modelType, from: data)
    return model
}
