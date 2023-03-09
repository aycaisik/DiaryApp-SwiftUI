//
//  AddDiaryScreen.swift
//  DiaryApp
//
//  Created by Ayça Işık on 9.03.2023.
//

import SwiftUI

struct AddDiaryScreen: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var title : String = ""
    @State var description : String = ""
    
    
    var body: some View {
        Form{
            TextField("diary_title",text: $title)
            TextField("diary_description",text: $description)
        }.navigationBarItems( trailing:
                                Button(action: {
            addItem()
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
