//
//  ContentView.swift
//  testBrunoCardenas
//
//  Created by Bruno Cardenas on 10/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct userView: View {
    
    @ObservedObject var vm = userViewModel()
    var body: some View {
        NavigationView{
            
            List(self.vm.users?.results ?? [], id: \.id.name){ user in
                HStack{
                    WebImage(url: URL(string: user.picture.medium ?? ""))
                        .onSuccess { image, data, cacheType in
                            
                        }
                        .resizable().frame(width: 100, height: 100)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                    VStack (alignment: .leading){
                        Text(user.name.first ?? "" )
                            .font(.title)
                            .bold()
                        Text(user.email ?? "")
                            .font(.subheadline)
                    }
                }
            }.navigationTitle("Lista Personas").font(.body)
        }
        
    }
}

struct userView_Previews: PreviewProvider {
    static var previews: some View {
        userView()
    }
}
