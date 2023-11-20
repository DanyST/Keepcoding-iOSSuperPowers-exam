import Foundation
import Combine

final class SerieDetailViewModel: ObservableObject {
    private var suscriptors = Set<AnyCancellable>()
    
    @Published private(set) var serie: Serie
    
    init(serie: Serie) {
        self._serie = Published(initialValue: serie)
    }
}
