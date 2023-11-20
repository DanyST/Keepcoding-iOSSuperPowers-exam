import SwiftUI

struct SerieDetailView: View {
    @StateObject var viewModel: SerieDetailViewModel
    @Binding var showDetail: Bool
    
    enum Constants {
        static let widthImage = UIScreen.main.bounds.width
        static let heightImage = widthImage * 0.8
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Header
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: viewModel.serie.thumbnail ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: Constants.widthImage, height: Constants.heightImage)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: Constants.widthImage, height: Constants.heightImage)
                }
                
                Button(action: {
                    showDetail.toggle()
                }, label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(.black)
                        .opacity(0.6)
                        .padding([.trailing], 26)
                        .padding([.top], 30)
                })
            }
            
            // Title - Description
            VStack(spacing: 16) {
                Text(viewModel.serie.title)
                    .font(.title2)
                    .bold()
                
                Text(viewModel.serie.description)
                    .font(.callout)
                    .opacity(0.8)
            }
            .padding([.leading, .trailing], 20)
               
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    return SerieDetailView(viewModel: SerieDetailViewModel(serie: Serie(
        id: UUID().uuidString,
        title: "Captain America (2004 - 2011)",
        description: "Steve Rogers was a product of World War II-era American ingenuity and enthusiasm, carrying those ideals into the 21st Century as Captain America. With Cap's mantle (and shield) passed to his former partner, Bucky Barnes, now is the perfect time to jump on to this highly acclaimed series as the new Captain America keeps the dream alive for a new generation!",
        startYear: 2004,
        endYear: 2011,
        rating: "",
        type: "",
        modified: "2018-02-19T18:45:15-0500",
        thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/f/a0/5130f45221c81.jpg"
    )), showDetail: .constant(true))
}
