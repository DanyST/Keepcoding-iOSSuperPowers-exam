import SwiftUI

struct HeroListView: View {
    @StateObject private var viewModel: HeroListViewModel
    
    init(viewModel: HeroListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.heroes) { hero in
                    HeroRowView(hero: hero)
                        .frame(height: UIScreen.main.bounds.width * 0.7)
                }
                .listRowSeparator(.hidden)
                
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Marvel Heroes")
            .listStyle(.plain)
        }
    }
}

#Preview {
    HeroListView(viewModel: HeroListViewModel(getHeroesUseCase: GetHeroesUIPreviewUseCase()))
        .environment(\.locale, .init(identifier: "es")) // es, en
}
