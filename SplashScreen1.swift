//
//  SplashScreen1.swift
//  FinalProject
//
//  Created by shatha on 23/01/1445 AH.
//

import SwiftUI

struct SplashScreen1: View {
    @State private var isActive=false
    
    // TO ADD GRADIENT CUSTOM COLOR
    let gradient = Gradient(colors:[Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
    var body: some View {
        if isActive{
    // Add the name of the page
            SplashScreen2()
        }
        else{
            
            VStack{
           
            Spacer()
                HStack{
                    
                Spacer()
                    Image("LogoWhite").resizable().frame(width: 213,height:213)
                Spacer()
                }
                
                Text("( وَٱحْلُلْ عُقْدَةً مِّن لِّسَانِي )").bold()
                    .foregroundColor(Color.white).font(.custom("NotoNakashArabic", size: 24)).frame(alignment:.center).kerning(3)
                
            
                Spacer()
               
                
            }
      
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+1.7){
                    self.isActive = true
                    
                }
            }
            .background(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing)).edgesIgnoringSafeArea(.all)
        
        }
        
    }
}

struct SplashScreen1_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen1()
    }
}

