//
//  Webservice.swift
//  GettingStartedAsyncAwait
//
//  Created by Karlos on 3/10/23.
//

import Foundation

protocol WebService {
    func getDate() async throws -> CurrentDate?
}

class WebserviceImp:WebService {
    
    func getDate() async throws -> CurrentDate? {
        
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("Url is incorrect!")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
