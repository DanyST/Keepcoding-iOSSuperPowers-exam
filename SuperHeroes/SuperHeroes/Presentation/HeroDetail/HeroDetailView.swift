import SwiftUI

struct HeroDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: HeroDetailViewModel
    
    init(viewModel: HeroDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                HeroRowView(hero: viewModel.hero, cornerRadius: 0.0)
                    .frame(height: UIScreen.main.bounds.width * 0.8)
                                
                VStack(spacing: 20) {
                    // Description
                    if !viewModel.hero.description.isEmpty {
                        Text(viewModel.hero.description)
                            .multilineTextAlignment(.leading)
                            .padding([.trailing], 20)
                            .opacity(0.7)
                    }
                    
                    // Content
                    SerieListView(series: viewModel.series) { serieSelected, bindingBool in
                        SerieDetailView(viewModel: viewModel.getSerieDetailViewModel(serie: serieSelected), showDetail: bindingBool)
                    }
                }
                .padding([.leading], 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward.circle.fill")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(.black)
                        .opacity(0.7)
                })
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    HeroDetailView(viewModel: HeroDetailViewModel(
        hero: Hero(
            id: UUID().uuidString,
            name: "Captain America (House of M)",
            description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
            modified: "2014-03-05T13:17:50-0500",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg"
        ),
        getSeriesByHeroUseCase: GetSeriesByHeroUIPreviewUseCase()))
}
