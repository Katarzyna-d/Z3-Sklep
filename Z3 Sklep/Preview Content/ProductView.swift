//
//  ProductView.swift
//  Z3 Sklep
//
//  Created by user225913 on 1/29/23.
//

import SwiftUI
import CoreData

//struct ProductView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView()
//    }
//}


struct ProductView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    var item: Kategoria
    
    
    func sample() -> [Produkt] {
        let predicate = NSPredicate(format: "item == %@", item)
        let productsRequest = NSFetchRequest<Produkt>(entityName: "Produkt")
        productsRequest.predicate = predicate
        do {
            let results = try self.viewContext.fetch(productsRequest);
            return results
        } catch {
            print("Nie bangla")
        }
        return []
    }
    
    var body: some View {
        List {
        ForEach(sample()) { produkt in
            HStack{
                Text(produkt.title!)
                Button(action: {}) {
                    Text("Add to basket").padding(.trailing)
                }
            }
        }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let kat = try! PersistenceController.preview.container.viewContext.fetch(request).first as! Kategoria
    
        
        ProductView(item: kat).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
