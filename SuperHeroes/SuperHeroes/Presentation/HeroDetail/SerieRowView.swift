import SwiftUI

struct SerieRowView: View {
    let serie: Serie
    
    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(url: URL(string: serie.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20.0)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20.0)
            }
            
            Text(serie.title)
                .font(.caption)
                .bold()
                .lineLimit(1)
        }
    }
}

#Preview {
    SerieRowView(serie: Serie(
        id: UUID().uuidString,
        title: "Captain America (2004 - 2011)",
        description: "Steve Rogers was a product of World War II-era American ingenuity and enthusiasm, carrying those ideals into the 21st Century as Captain America. With Cap's mantle (and shield) passed to his former partner, Bucky Barnes, now is the perfect time to jump on to this highly acclaimed series as the new Captain America keeps the dream alive for a new generation!",
        startYear: 2004,
        endYear: 2011,
        rating: "",
        type: "",
        modified: "2018-02-19T18:45:15-0500",
        thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/f/a0/5130f45221c81.jpg"
    ))
}
