//
//  ContentView.swift
//  Moonshot
//
//  Created by Héctor Manuel Sandoval Landázuri on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true

    let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayoutView(missions: missions,astronauts: astronauts)
                }else{
                    ListLayoutView(missions: missions,astronauts: astronauts)
                }
//                LazyVGrid(columns:columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink{
//                            MissionView(mission:mission,astronauts: astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//                                    .padding()
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                        .foregroundColor(.white.opacity(0.5))
//                                }
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)
//                            }
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                .stroke(.lightBackground))
//
//                        }
//                    }
//                }
//                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationBarItems(
                trailing:
                    Button(showingGrid ? "List" : "Grid") {
                        self.showingGrid.toggle()
                    })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
