//
//  CurrentDate.swift
//  GettingStartedAsyncAwait
//
//  Created by Karlos Aguirre Zaragoza on 13/03/23.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
