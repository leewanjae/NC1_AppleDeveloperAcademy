//
//  DiaryViewModel.swift
//  TheManU
//
//  Created by LeeWanJae on 4/15/24.
//

import Foundation
import CoreData

class DiaryViewModel: ObservableObject {
    var container: NSPersistentContainer
    
    @Published var diaryEntity: [DiaryEntity] = []
    
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
        let request = NSFetchRequest<DiaryEntity>(entityName: "DiaryEntity")
        do {
            diaryEntity = try container.viewContext.fetch(request)
            print(diaryEntity)
        } catch let error {
            print("ERROR FETCHING CORE DATA \(error)")
        }
    }
    
    func addDiary(context: String) {
        let diary = DiaryEntity(context: container.viewContext)
        diary.context = context
        self.saveData()
    }
    
    func deleteDiary(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = diaryEntity[index]
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
