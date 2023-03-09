//
//  ListScreen.swift
//  DiaryApp
//
//  Created by Ayça Işık on 8.03.2023.
//

import SwiftUI

struct ListScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
            List{
                ForEach(items) { item in
                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    
                }
                }
                Button{
                    debugPrint("slm bana tıkladın")
                }label: {
                    FabButton().padding().padding()
                    //.bottom,16
                    //.leading (yöne göre)
                    //trailing,24 bla bla da yapabiliriz ama ben yerini begendım
                }
                
                
                
            .navigationTitle(Text("list_tab"))
                
            }
        }
     
        
    }
    private let itemFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateStyle = .short
         formatter.timeStyle = .medium
         return formatter
     }()
    
    struct ListScreen_Previews: PreviewProvider {
        static var previews: some View {
            ListScreen()
        }
    }
}
