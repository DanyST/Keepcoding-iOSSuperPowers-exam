import Foundation

struct HeroContainerDTOToDomainMapper: HeroContainerDTOToDomainMapperProtocol {
    private var thumbnailImageDTOToStringMapper = ThumbnailImageDTOToStringMapper()
    
    init(thumbnailImageDTOToStringMapper: ThumbnailImageDTOToStringMapper = ThumbnailImageDTOToStringMapper()) {
        self.thumbnailImageDTOToStringMapper = thumbnailImageDTOToStringMapper
    }
    
    func map(_ modelDTO: ModelDataContainerDTO<HeroDTO>?) -> ModelDataContainer<Hero> {
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
                thumbnail: thumbnailImageDTOToStringMapper.map(heroDTO.thumbnail)
            )
        }
    }
}
