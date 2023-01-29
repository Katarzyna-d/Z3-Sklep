//
//  ContentView.swift
//  Z3 Sklep
//
//  Created by user225913 on 1/29/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Kategoria.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Kategoria>
    
        @FetchRequest(entity: Kategoria.entity(),
                      sortDescriptors: [NSSortDescriptor(keyPath: \Kategoria.name, ascending: true)])
       var items: FetchedResults<Kategoria>
    
    @FetchRequest(entity: Produkt.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Produkt.title, ascending: true)])
   var itemsd: FetchedResults<Produkt>
    //    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
        List{
                //                ForEach(fruits) { fruit in
                ForEach(items) {item in
                    //                    NavigationLink(item.title!, destination: ProductView(item: item))
                    NavigationLink {
                        Text("Produkt \(item.title ?? "")")
                    } label: {
                        Text("Kategoria \(item.name ?? "")")
                    }
                    //                    (item.name ?? "")")  Text(fruit.name ?? "")
                    
                    
                    //                    HStack{
                    //                        //ProductView(kategoria: kategoria)
                    //                        //Text(kategoria.title!)
                    //                        NavigationLink(item.title!, destination: ProductView(item: item))
                    //                        //NavigationLink(kategoria.value(forKey: "title") as! String, destination: ProduktView(kategoria: kategoria.))
                    //                    }
                }
                .onDelete(perform: deleteItems)
            }
            //            .listStyle(PlainListStyle())
            //            .navigationTitle("Core Data Cootcamp")
            //            .navigationBarItems(leading: EditButton(), trailing:
            //                                    Button(action: addItem) {
            //                Label("Add Item", systemImage: "plus")
            //            }
            //            )
            //        }
            .navigationTitle("Core Data Bootcamp")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Generate list", systemImage: "plus")
                    }
                }
            }
                    Text("Select an item")
                }
            }
            
            private func addItem() {
                withAnimation {
                    //            @Environment(\.managedObjectContext)  var viewContext
                    //            let newFruit = FruitEntity(context: viewContext)
                    //            newFruit.name = "Strawberry"
                    
                    for x in 1..<10 {
                        let newItem = Kategoria(context: viewContext)
                        //                    newItem.timestamp = Date()
                        newItem.name = "Owoc \(x)"
                        newItem.title = "Truskawka \(x)"
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
                //            saveItems()
            }
            
            private func deleteItems(offsets: IndexSet) {
                withAnimation {
                    //            @Environment(\.managedObjectContext)  var viewContext
                    //
                    offsets.map { items[$0] }.forEach(viewContext.delete)
                    
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
            }
            
            //            guard let index = offsets.first else { return }
            //            let fruitEntity = fruits[index]
            //
            //            viewContext.delete(fruitEntity)
            //
            //            saveItems()
            //        }
        }
        
        //    private func saveItems(){
        //        @Environment(\.managedObjectContext)  var viewContext
        //        do {
        //            try viewContext.save()
        //        } catch {
        //            // Replace this implementation with code to handle the error appropriately.
        //            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        //            let nsError = error as NSError
        //            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        //        }
        //    }
        
        
        private let itemFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .medium
            return formatter
        }()
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
        }
    

