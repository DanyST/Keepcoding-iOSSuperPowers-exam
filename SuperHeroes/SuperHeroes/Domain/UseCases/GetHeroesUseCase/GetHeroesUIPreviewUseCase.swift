import Foundation
import Combine

struct GetHeroesUIPreviewUseCase: GetHeroesUseCaseProtocol {
    func execute() -> AnyPublisher<[Hero], ApiError> {
        let hero1 = Hero(
            id: UUID().uuidString,
            name: "3-D Man",
            description: "",
            modified: "2013-09-18T15:54:04-0400",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"
        )
        
        let hero2 = Hero(
            id: UUID().uuidString,
            name: "A.I.M.",
            description: "AIM is a terrorist organization bent on destroying the world.",
            modified: "2013-09-18T15:54:04-0400",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec.jpg"
        )
        
        let hero3 = Hero(
            id: UUID().uuidString,
            name: "A-Bomb (HAS)",
            description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
            modified: "2013-09-18T15:54:04-0400",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg"
        )
        
        let hero4 = Hero(
            id: UUID().uuidString,
            name: "Captain America (House of M)",
            description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
            modified: "2014-03-05T13:17:50-0500",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg"
        )
        
        let data = [hero1, hero2, hero3, hero4]
        
        let publisher = CurrentValueSubject<[Hero], ApiError>(data)
            .eraseToAnyPublisher()
        
        return publisher
    }
}
