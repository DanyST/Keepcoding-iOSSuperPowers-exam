import Foundation
import Combine

struct GetSeriesByHeroUIPreviewUseCase: GetSeriesByHeroUseCaseProtocol {
    func execute(heroId: String) -> AnyPublisher<[Serie], ApiError> {
        let serie1 = Serie(
            id: UUID().uuidString,
            title: "Captain America (2004 - 2011)",
            description: "Steve Rogers was a product of World War II-era American ingenuity and enthusiasm, carrying those ideals into the 21st Century as Captain America. With Cap's mantle (and shield) passed to his former partner, Bucky Barnes, now is the perfect time to jump on to this highly acclaimed series as the new Captain America keeps the dream alive for a new generation!",
            startYear: 2004,
            endYear: 2011,
            rating: "",
            type: "",
            modified: "2018-02-19T18:45:15-0500",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/f/a0/5130f45221c81.jpg"
        )
        
        let serie2 = Serie(
            id: UUID().uuidString,
            title: "Captain America: Winter Soldier Vol. 2 (2006)",
            description: "",
            startYear: 2006,
            endYear: 2006,
            rating: "RATED T+",
            type: "collection",
            modified: "-0001-11-30T00:00:00-0500",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/4/10/4bc357760939f.jpg"
        )
        
        let serie3 = Serie(
            id: UUID().uuidString,
            title: "HOUSE OF M: WORLD OF M FEATURING WOLVERINE TPB (2006)",
            description: "",
            startYear: 2006,
            endYear: 2006,
            rating: "T",
            type: "collection",
            modified: "-0001-11-30T00:00:00-0500",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/9/60/4bc62e83db473.jpg"
        )
        
        let data = [serie1, serie2, serie3]
        
        let publisher = CurrentValueSubject<[Serie], ApiError>(data)
            .eraseToAnyPublisher()
        
        return publisher
    }
}
