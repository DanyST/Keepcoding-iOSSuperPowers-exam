import SwiftUI

struct HeroListView: View {
    private let viewModel: HeroListViewModel
    
    init(viewModel: HeroListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    HeroListView(viewModel: HeroListViewModel(getHeroesUseCase: GetHeroesUIPreviewUseCase()))
}
