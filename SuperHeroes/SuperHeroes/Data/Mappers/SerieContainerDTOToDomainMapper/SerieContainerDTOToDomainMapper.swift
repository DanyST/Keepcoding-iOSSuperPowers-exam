import Foundation

struct SerieContainerDTOToDomainMapper: SerieContainerDTOToDomainMapperProtocol {
    private var thumbnailImageDTOToStringMapper = ThumbnailImageDTOToStringMapper()
    
    init(thumbnailImageDTOToStringMapper: ThumbnailImageDTOToStringMapper = ThumbnailImageDTOToStringMapper()) {
        self.thumbnailImageDTOToStringMapper = thumbnailImageDTOToStringMapper
    }
    
    func map(_ modelDTO: ModelDataContainerDTO<SerieDTO>?) -> ModelDataContainer<Serie> {
        ModelDataContainer(
            offset: modelDTO?.offset ?? 0,
            limit: modelDTO?.limit ?? 0,
            total: modelDTO?.limit ?? 0,
            count: modelDTO?.count ?? 0,
            results: map(modelDTO?.results) ?? []
        )
    }
    
    private func map (_ seriesDTO: [SerieDTO]?) -> [Serie]? {
        guard let seriesDTO else { return nil }
        return seriesDTO.compactMap { serieDTO in
            Serie(
                id: (serieDTO.id != nil) ? String(serieDTO.id ?? 0) : UUID().uuidString,
                title: serieDTO.title ?? "No name",
                description: serieDTO.description ?? "",
                startYear: nil,
                endYear: nil,
                rating: nil,
                type: nil,
                modified: serieDTO.modified,
                thumbnail: thumbnailImageDTOToStringMapper.map(serieDTO.thumbnail)
            )
        }
    }
}
