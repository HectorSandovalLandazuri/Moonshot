//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Héctor Manuel Sandoval Landázuri on 04/06/22.
//

import SwiftUI

struct ListLayoutView: View {

    let missions: [Mission]
    let astronauts: [String: Astronaut]

    var body: some View {
        
        
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                VStack(alignment: .leading) {
                    Text(mission.displayName)
                        .font(.headline)

                    Text(mission.formattedLaunchDate)
                        .accessibilityLabel(mission.accessibleLaunchDate)

                }
            }
        }
 
    }
    
}

struct ListLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            ListLayoutView(missions: missions, astronauts: astronauts)
                
        }
        .preferredColorScheme(.dark)
    }
}
