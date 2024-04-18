//
//  DiaryViewModel.swift
//  TheManU
//
//  Created by LeeWanJae on 4/15/24.
//

import Foundation
import CoreData

class DiaryViewModel: ObservableObject {
    @Published var container: NSPersistentContainer
    @Published var diariesEntity: [DiariesEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA \(error)")
            } else {
                print("SUCCESSFULLY LOAD CORE DATA")
            }
        }
    }
    
    func fetchDiary() {
        let request = NSFetchRequest<DiariesEntity>(entityName: "DiariesEntity")
        do {
            diariesEntity = try container.viewContext.fetch(request)
        } catch let error {
            print("ERROR FETCHING CORE DATA \(error)")
        }
    }
    
    func addDiary(context: String, listTitle: String, enemies: String, goal: String, matchDate: String) {
        let diary = DiariesEntity(context: container.viewContext)
        diary.context = context
        diary.listTitle = listTitle
        diary.enemies = enemies
        diary.goal = goal
        diary.matchDate = matchDate
        self.saveData()
        print("Add Complete: + \(diary)")
    }

    func deleteDiary(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = diariesEntity[index]
        container.viewContext.delete(entity)
        self.saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch (let error) {
            print("error saving: \(error)")
        }
    }
}
