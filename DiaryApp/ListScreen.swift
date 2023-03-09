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
    
    @State var actionAddDiary: Int? = 0
    //baslangic degeri 0 tag 1 olunca tıklanınca destination oluyor kısaca mantik..
    
    
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                NavigationLink(destination: AddDiaryScreen(), tag: 1, selection:$actionAddDiary){
                EmptyView()
            }
            List{
                ForEach(items) { item in
                    VStack{
                        Text(item.detail  ?? "")
                        Text(item.title  ?? "")
                        //bunları add diary de + butonunu ekledıkten sonra yazdık ustteklerı ve vstack alt alta koyar
                        
                
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    }
                    
                    
                }
                }
                Button{
                    self.actionAddDiary = 1
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
