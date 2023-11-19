import SwiftUI

struct HeroRowView: View {
    let hero: Hero
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: hero.thumbnail ?? "")) { image in
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
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .background(.black)
                .opacity(0.15)
                .cornerRadius(20.0)
            
            VStack {
                Spacer()
                Text(hero.name)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding()
            }
        }
    }
}

#Preview {
    HeroRowView(hero: Hero(
        id: UUID().uuidString,
        name: "Captain America (House of M)",
        description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
        modified: "2014-03-05T13:17:50-0500",
        thumbnail: "https://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg"
    ))
}
