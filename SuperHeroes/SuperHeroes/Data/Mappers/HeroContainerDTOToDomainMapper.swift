import Foundation

struct HeroContainerDTOToDomainMapper: ModelDTOToDomainMapper {
    typealias ModelDTO = ModelDataContainerDTO<HeroDTO>
    typealias ModelDomain = ModelDataContainer<Hero>
    
    func map(_ modelDTO: ModelDTO?) -> ModelDomain {
        ModelDataContainer(
            offset: modelDTO?.offset ?? 0,
            limit: modelDTO?.limit ?? 0,
            total: modelDTO?.limit ?? 0,
            count: modelDTO?.count ?? 0,
            results: map(modelDTO?.results) ?? []
        )
    }
    
    private func map (_ heroesDTO: [HeroDTO]?) -> [Hero]? {
        guard let heroesDTO else { return nil }
        return heroesDTO.compactMap { heroDTO in
            Hero(
                id: (heroDTO.id != nil) ? String(heroDTO.id ?? 0) : UUID().uuidString,
                name: heroDTO.name ?? "No name",
                description: heroDTO.description ?? "",
                modified: heroDTO.modified,
                thumbnail: map(heroDTO.thumbnail)
            )
        }
    }
    
    private func map(_ thumbnailImageDTO: ThumbnailImageDTO?) -> String? {
        guard
            let path = thumbnailImageDTO?.path,
            let extensionImage = thumbnailImageDTO?.thumbnailExtension
        else {
            return nil
        }
        
        let securePath = path.replacingOccurrences(of: "http", with: "https")
        return "\(securePath).\(extensionImage.rawValue)"
    }
}
