//
//  TabUIView.swift
//  DiaryApp
//
//  Created by Ayça Işık on 8.03.2023.
//

import SwiftUI

struct TabUIView: View {
    var body: some View {
           TabView {
               ListScreen()
                   .tabItem {
                       Label("list_tab", systemImage: "list.dash")
                   }

               OtherScreen()
                   .tabItem {
                       Label("other_tab", systemImage: "gear")
                   }
           }
       }
}

struct TabUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView()
    }
}
