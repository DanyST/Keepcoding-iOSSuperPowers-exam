import SwiftUI

struct SerieListView<Content: View>: View {
    var series: [Serie]
    @State var serieSelected: Serie?
    @State var showDetail = false
    var detailContent: (Serie, Binding<Bool>) -> Content
    
    init(series: [Serie], @ViewBuilder detailContent: @escaping (Serie, Binding<Bool>) -> Content) {
        self.series = series
        self.detailContent = detailContent
    }
    
    var body: some View {
        if !series.isEmpty {
            VStack(alignment: .leading) {
                HStack {
                    Text("Series")
                        .font(.title3)
                        .bold()
                        .opacity(0.8)
                    Image(systemName: "movieclapper")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top) {
                        ForEach(series) { serie in
                            SerieRowView(serie: serie)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                                .onTapGesture {
                                    serieSelected = serie
                                }
                        }
                    }
                }
            }
            .sheet(isPresented: $showDetail, content: {
                if let serieSelected {
                    detailContent(serieSelected, $showDetail)
                }
            })
            .onChange(of: serieSelected) { oldValue, newValue in
                if newValue != nil {
                    showDetail = true
                }
            }
        } else {
            VStack {
                Text("There are no series available :(")
                    .font(.title3)
                    .bold()
                    .opacity(0.8)
            }
        }
    }
}

#Preview {
    let series = [
        Serie(
            id: UUID().uuidString,
            title: "Captain America (2004 - 2011)",
            description: "Steve Rogers was a product of World War II-era American ingenuity and enthusiasm, carrying those ideals into the 21st Century as Captain America. With Cap's mantle (and shield) passed to his former partner, Bucky Barnes, now is the perfect time to jump on to this highly acclaimed series as the new Captain America keeps the dream alive for a new generation!",
            startYear: 2004,
            endYear: 2011,
            rating: "",
            type: "",
            modified: "2018-02-19T18:45:15-0500",
            thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/f/a0/5130f45221c81.jpg"
        ),
        Serie(
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
    ]
    
    return SerieListView(series: series) { _, binding in
        SerieDetailView(viewModel: SerieDetailViewModel(serie: series[0]), showDetail: binding)
    }
}
