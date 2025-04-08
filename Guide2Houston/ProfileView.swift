//
//  ProfileView.swift
//  Guide2Houston
//
//  Created by Elena Margolin on 7/26/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "person.fill").resizable().aspectRatio(contentMode: .fill).frame(width: 20.0, height: 20.0, alignment: .center)
                Text("Elena").fontWeight(.bold).font(.title)
                Spacer()
            }.padding([.top, .bottom])
            
            if (favorites.count == 1) {
                Text("\(favorites.count) favorite restaurant")
            } else {
                Text("\(favorites.count) favorite restaurants")
            }
    
            Spacer()
        }.padding()
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(Favorites())
    }
}
