//
//  RecordingViewModel.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI
import CoreData

final class RecordingViewModel: ObservableObject {
    
    @AppStorage("goals") var goals: [String] = []
    @Published var addingGoal = ""

    @Published var results: [String] = ["Victory", "Defeat"]
    @Published var currentResult = "Victory"
    
    @AppStorage("vic") var vic: Int = 0
    @AppStorage("def") var def: Int = 0
    @AppStorage("allGames") var allGames: Int = 1

    @Published var isAdd: Bool = false
    @Published var isAddGoal: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    @Published var isMore: Bool = false

    @Published var hisResult = ""
    @Published var hisType = ""
    @Published var hisDate = ""
    @Published var hisChamp = ""
    @Published var hisRole = ""
    @Published var hisDescr = ""

    @Published var histories: [HistoryModel] = []
    @Published var selectedHistory: HistoryModel?
    
    func addHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel
        
        loan.hisResult = hisResult
        loan.hisType = hisType
        loan.hisDate = hisDate
        loan.hisChamp = hisChamp
        loan.hisRole = hisRole
        loan.hisDescr = hisDescr

        CoreDataStack.shared.saveContext()
    }
    
    func fetchHistories() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.histories = result.filter{($0.hisResult ?? "") == currentResult}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.histories = []
        }
    }
}

