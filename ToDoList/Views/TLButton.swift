//
//  TLButton.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background:Color
    let action: () -> Void
    
    var body: some View {
        
        Button {
            //attempt login
            action()
            
        } label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                    Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
       
    }
}

#Preview {
    TLButton(title: "Value", background: .blue) {
        //action
    }
}
