//
//  FabButton.swift
//  DiaryApp
//
//  Created by Ayça Işık on 9.03.2023.
//

import SwiftUI

struct FabButton: View {
    var body: some View {
        Text("+")
            .foregroundColor(Color.white)
            .font(.title)
            .padding()
            .background(Color.blue)
            .mask(Circle())
                  
        
    }
}

struct FabButton_Previews: PreviewProvider {
    static var previews: some View {
        FabButton()
    }
}
