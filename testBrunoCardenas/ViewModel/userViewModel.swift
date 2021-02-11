//
//  userViewModel.swift
//  testBrunoCardenas
//
//  Created by Bruno Cardenas on 10/02/21.
//

import Foundation
import SwiftUI
import Combine


class userViewModel: ObservableObject {
    var didChange = PassthroughSubject<userViewModel,Never>()
    @Published var users:userList?
    {
        didSet {
            didChange.send(self)
        }
    }

    
    init(){
        guard let url = URL(string: Constants.urlUsers) else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            
            if let response = response {
                print(response)
            }
            do{
                guard let data = data else { return }
                let users = try JSONDecoder().decode(userList.self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                }
            }catch let error as NSError{
                print("Error en el api", error.localizedDescription)
            }
            
        }.resume()
        
    }
    

}
