//
//  AccountViewModel.swift
//  MyShop
//
//  Created by wsa-024-23b on 30.11.21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = UserModel()
    
    func saveChages() {
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
        } catch {
            print("error")
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            print("error")
        }
    }
}
