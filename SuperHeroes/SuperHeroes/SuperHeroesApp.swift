import SwiftUI

@main
struct SuperHeroesApp: App {
    var body: some Scene {
        WindowGroup {
            HeroListView(viewModel: HeroListViewModel())
        }
    }
}
