//
//  EmojiView.swift
//  DiaryApp
//
//  Created by Ayça Işık on 9.03.2023.
//

import SwiftUI
import UIKit
struct EmojiView: View {
    
    @Binding var txt: String
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        NavigationView{
            ZStack(alignment: .topLeading){
                ScrollView(.vertical,showsIndicators:false){
                    VStack(spacing:15){
                        ForEach(self.getEmojList(),id: \.self){i in
                            HStack(spacing:25)
                            {
                                ForEach(i,id: \.self){j in
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                        self.txt = String(UnicodeScalar(j)!)
                                    }
                                    ){
                                        if(UnicodeScalar(j)?.properties.isEmoji)!{
                                            Text(String(UnicodeScalar(j)!)).font(.system(size:36))
                                            
                                        }
                                        else{
                                            Text("")
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
            }
            
            .navigationBarTitle(Text("select_emoji"),displayMode: .automatic)
            .navigationBarItems(trailing: Button(action:{
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName:"xmark").foregroundColor(.gray)
            }
            )
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    func getEmojList()->[[Int]]{
        var emojis : [[Int]] = []
        
        for i in stride(from: 0x1F601, to: 0x1F64F, by: 4){
            var temp : [Int] = []
            
            for j in i...i+4{
                temp.append(j)
            }
            emojis.append(temp)
        }
        return emojis
    }
}
