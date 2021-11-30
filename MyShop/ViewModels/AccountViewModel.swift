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
        //guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            //alertItem = AlertContext.userSaveSuccess
        } catch {
            //alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            //alertItem = AlertContext.invalidUserData
        }
    }
}
