//
//  CurrentDateListViewModel.swift
//  GettingStartedAsyncAwait
//
//  Created by Karlos Aguirre Zaragoza on 10/03/23.
//

import Foundation

@MainActor
class CurrentDateListViewModel: ObservableObject {
    @Published var currentDates: [CurrentDateViewModel] = []
    
    private let webService: WebService
    
    init(webService: WebService = WebserviceImp()) {
        self.webService = webService
    }
    
    func populateDates() async {
        do {
            if let currentDate = try await webService.getDate() {
                currentDates.append(CurrentDateViewModel(currentDate: currentDate))
            }
        } catch {
            print(error)
        }
    }
}

struct CurrentDateViewModel: Identifiable {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
