//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Héctor Manuel Sandoval Landázuri on 04/06/22.
//

import SwiftUI

struct GridLayoutView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns:columns) {
                ForEach(missions) { mission in
                    NavigationLink{
                        MissionView(mission:mission,astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground))
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GridLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            GridLayoutView(missions: missions, astronauts: astronauts)
        }
        .preferredColorScheme(.dark)
    }
}
