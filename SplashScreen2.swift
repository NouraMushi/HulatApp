//
//  SplashScreen2.swift
//  FinalProject
//
//  Created by shatha on 23/01/1445 AH.

import SwiftUI

struct SplashScreen2: View {
    //to tell if splash is active or not
    @State private var isActive=false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    let gradient = Gradient(colors:[Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
    
    var body: some View {
        
        //go to the next page
        if isActive{
            // add the name of the page
        HomePage()
        }
        
        else{//place the rest of the code here
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    
                    Image("LogoWhite").resizable().frame(width: 213,height:213)
                   
                    //  Text("App Name")
                    //    .foregroundColor(Color.white).font(.system(size:24)).bold()
                    
                    
              
                //animation part
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.1)){
                            self.size = 8.0
                            self.opacity=0.0
                        }
                        
                    }
                    Spacer()
                }
               
          
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()+1.3){
                            self.isActive = true
                        }
                    }
                
                
                Spacer()
            }
            .background(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing)).edgesIgnoringSafeArea(.all)
            
            
            
        }
    }
    
    struct splash_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen2()
        }
    }
}
