//
//  HomePage.swift
//  FinalProject
// 
//  Created by shatha on 25/01/1445 AH.
//
//import SwiftUI
//
//struct HomePage: View {
//    @State private var goesToDetail: Bool = false
//
//    var body: some View {
//        NavigationView {
//            ScrollView{
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//
//                VStack(alignment: .leading) {
//                    Image("mg1")
//                        .resizable()
//                        .frame(width: 250, height: 200)
//                        .padding(.top, -21)
//                        .padding(.bottom, 50)
//                        .padding(.leading, 50)
//
//                  //  NavigationLink(destination:ReadPage())//Text("Read")
//
//                       Button(action: {}) {
//                            Text("Read")
//                                .font(.title)
//                                .padding(.leading)
//                                .foregroundColor(Color.black)
//
//                            Image("read")
//                                .resizable()
//                                .frame(width: 110, height: 80)
//                                .padding(.top, 10)
//                                .padding(.leading, 143)
//                        }
//                        //                .buttonStyle(.bordered)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
//                                .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
//                        )
//
//
//
//
//
//                    Button(action: {}) {
//                        Text("Games")
//                            .font(.title)
//                            .padding(.leading)
//                            .foregroundColor(Color.black)
//
//                        Image("game")
//                            .resizable()
//                            .frame(width: 110, height: 80)
//                            .padding(.top, 10)
//                            .padding(.leading, 123)
//                    }
//                    //                .buttonStyle(.bordered)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
//                            .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
//                    )
//
//
//
//                    Button(action: {}) {
//                        Text("Exercise")
//                            .padding(.leading)
//                            .font(.title)
//                            .foregroundColor(Color.black)
//
//                        Image("Exercise")
//                            .resizable()
//                            .frame(width: 110, height: 80)
//                            .padding(.top, 10)
//                            .padding(.leading, 110)
//                    }
//                    //                .buttonStyle(.bordered)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
//                            .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
//                    )
//
//
//
//                }
//
//
//
//
//                .navigationTitle("Start ")
//            }
//        }
//    }
//}
//
//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePage()
//    }
//}



import SwiftUI

struct HomePage: View {
    var body: some View {
        
        let gradient = Gradient(colors:[Color("Color5"),Color("Color4"),Color("Color3"),Color("Color2"),Color("Color1")])
        
        NavigationView {
            VStack(alignment: .leading) {
                
                
//Spacer()
                
                
                Image("Logo")
                    .resizable()
                    .frame(width: 300, height: 300,alignment: .center)
                 .padding(.leading, 30)
                 .padding(.bottom,11)
                    
                
                Spacer()
                
            
                

                
                
                
                
                
                Button(action: {}) {
                    
                    NavigationLink(destination:ReadPage() , label:{
                        
                        Text("Reading").font(.system(size: 28, weight:.medium))
                            .font(.title)
                            .padding(.leading)
                            .foregroundColor(Color.white)
                        
                        
                        Image("")
                            .resizable()
                            .frame(width: 65, height: 70)
                            .padding(.top, 10)
                            .padding(.bottom,10).padding(.leading, 154)
//
                        //Text(buttonText)
                                           
                        
                        
                        
                    })
                }
                //.foregroundColor(.white)
                //.padding()
                .background(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 2)
                        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
                )
                
                
                
                
                
             
                
                
                Button(action: {}) {
                    
                    NavigationLink(destination: GamesPage(), label:{
                        
                        Text("Games").font(.system(size: 28, weight:.medium))
                            .font(.title)
                            .padding(.leading)
                            .foregroundColor(Color.white)
                        
                        Image("")
                            .resizable()
                            .frame(width: 80, height: 70)
                            .padding(.top, 10)
                            .padding(.bottom,10)
                            .padding(.leading,154)
                    })
                    
                }
                
                    
                .background(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 2)
                        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
                )
                
                
                
                
                
                
                
                
                Button(action: {}) {
                    NavigationLink(destination: ExercisePage(), label:{
                        
                        Text("Exercises").font(.system(size: 28, weight:.medium))
                            .padding(.leading)
                            .font(.title)
                            .foregroundColor(Color.white)
                        
                        Image("")
                            .resizable()
                            .frame(width: 80, height: 70)
                            .padding(.top, 19)
                            .padding(.bottom,0)
                            .padding(.leading, 124)
                    })
                }
                .background(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 2)
                        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
                )
                Spacer()
                Spacer()
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
        
            
            .navigationTitle("Welcome")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
