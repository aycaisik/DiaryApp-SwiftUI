//
//  AddDiaryScreen.swift
//  DiaryApp
//
//  Created by Ayça Işık on 9.03.2023.
//

import SwiftUI

struct AddDiaryScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode)  var presentationMode
    //bu presentation modu ekledık sonra altta add itemin altına yeni
    //kod satırları ekledık gözat oraya
    

    @State var title : String = ""
    @State var description : String = ""
    //emoji eklicez
    @State var emoji : String = ""
    
    
    
    var body: some View {
        Form{
            TextField("diary_title",text: $title)
            TextField("diary_description",text: $description)
            TextField("emoji",text: $emoji)
            
        }.navigationBarItems( trailing:
                                Button(action: {
            addItem()
            presentationMode.wrappedValue.dismiss()
            //bu sayede veri kaydedince bir önceki sayfaya yönlendirildik.
        }, label: {
            Image(systemName: "plus.square")
        }))
    
        .navigationTitle(Text("add_diary"))
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.title = title
            newItem.detail = description
            newItem.emoji = emoji
            //soldaki core datadan alıyor sağdaki üstteki state degerine esitliyor.

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                debugPrint(nsError.localizedDescription)

            }
        }
    }
}

struct AddDiaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryScreen()
    }
}
