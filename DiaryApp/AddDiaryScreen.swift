//
//  AddDiaryScreen.swift
//  DiaryApp
//
//  Created by Ayça Işık on 9.03.2023.
//

import SwiftUI

struct AddDiaryScreen: View {
    @State var title : String = ""
    @State var description : String = ""
    
    
    var body: some View {
        Form{
            TextField("diary_title",text: $title)
            TextField("diary_description",text: $description)
        }.navigationTitle(Text("add_diary"))
       
        
    }
}

struct AddDiaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryScreen()
    }
}
