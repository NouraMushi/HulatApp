//
//  game2.swift
//  FinalProject
//
//  Created by shatha on 27/01/1445 AH.
//

import SwiftUI

//struct game2: View {
//    var body: some View {
//
//        Home()
//    }
//
//}


struct game2: View {

  @State var start = false
  @State var to : CGFloat = 0
  @State var count = 0
  @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
    //COLOR
    
let gradient = Gradient(colors: [Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
    let gradient2 = Gradient(colors: [Color("Color3"),Color("Color4"),Color("Color5")])
    let gradient3 = Gradient(colors: [Color("Color4"),Color("Color5")])
    
  var body: some View{
      
      
      ZStack{
          
          Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
          
          
          VStack{
              VStack {
                 // Image("imge2")
                  // .resizable().frame(width: 190, height: 150)
                 //  .padding(.top,-50)
                 //  .padding(.leading,100)
                   //.padding(.all,-6)
                 
                  //.clipShape(Circle())
                   //.overlay(
                       //    Circle()
                        //   .stroke(Color.black, lineWidth: 2))
                  
                   
                  ScrollView{
                      Text("A group of adults with speech difficulties decided to embark on a journey to a magical island known as 'Sound Island' , where they could learn proper pronunciation and improve their speech skills.")
                      
                      Text("Upon their arrival on the island, they were greeted by a small guide named Link, who was an expert in phonetics and speech. Link led them to a place filled with enchanting trees called 'Letter Trees'")
                      
                      Text("Link explained to them that each tree contained a specific letter, and when they approached the tree and focused on listening carefully, magical sounds would emerge from their mouths and transform into correct letters.")
                      
                      Text("One by one, they visited the Letter Trees and listened attentively to the magical sounds emanating from them. They learned how to articulate the letters and produce the sounds correctly, gaining confidence in their ability to speak.")
                      
                      Text("At the end of their journey, Link presented them with a small gift. It was a magical mirror that reflected their images while laughing and speaking fluently. The message was clear: they possessed the ability and power within themselves to achieve improvement and excellence in their language skills.")
                      
                      Text("The adult friends returned to their homes filled with enthusiasm and confidence. They began practicing what they had learned on the magical island, encouraging and supporting each other in their journey towards linguistic improvement.")
                      
                      Text("Over time, the adult friends became more articulate in their speech and more confident in their pronunciation. Words flowed smoothly and confidently from their mouths, filling them with pride and joy at their progress.")
                      
                      Text("And so, the adult friends learned that teamwork and dedication to training and practice lead to improvement and excellence in speech skills. With their continued commitment to practice and training, they were able to achieve their goal and enhance their proficiency in letter pronunciation and fluent speech.")}
                  
                  
                  
                  
                  
                  
                  
                  
                  
            
                      .foregroundColor(.black).scrollContentBackground(.hidden)
                 
                      .padding(30)
                  ZStack{
                      
                      Circle()
                          .trim(from: 0, to: 1)
                          .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                          .frame(width: 170, height: 170)
                      
                      Circle()
                          .trim(from: 0, to: self.to)
                          .stroke(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing), style: StrokeStyle(lineWidth: 30, lineCap: .round))//اغير لون الخط اللي يمشي
                          .frame(width: 170, height: 170)
                          .rotationEffect(.init(degrees: -90))
                      
                      
                      VStack{
                          
                          Text("\(self.count)")
                              .font(.system(size: 30))
                              .fontWeight(.bold)
                          
                          Text("Of 25 Min")
                              .font(.title3)
                              .padding(.top)
                      }
                  }}
              
              HStack(spacing: 10){
                  
                  Button(action: {
                      
                      if self.count == 240{
                          
                          self.count = 0
                          withAnimation(.default){
                              
                              self.to = 0
                          }
                      }
                      self.start.toggle()
                      
                  }) {
                      
                      HStack(spacing: 15){
                          
                          Image(systemName: self.start ? "pause.fill" : "play.fill")
                              .foregroundColor(.white)
                          
                          Text(self.start ? "Pause" : "Play")
                              .foregroundColor(.white)
                      }
                      .padding(.vertical)
                      .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                      .background(LinearGradient(gradient: gradient3, startPoint: .bottomLeading, endPoint: .topTrailing))//اغير لون بوتن play
                      .clipShape(Capsule())
                      .shadow(radius: 6)
                  }
                  
                  Button(action: {
                      
                      self.count = 0
                      
                      withAnimation(.default){
                          
                          self.to = 0
                      }
                      
                  }) {
                      
                      HStack(spacing: 15){
                          
                          Image(systemName: "arrow.clockwise")
                             .foregroundColor(.black) // color of arrow
                          Text("Restart")
                          
                              .foregroundColor(Color.black)
                            //  .foregroundStyle(LinearGradient(gradient: gradient3, startPoint: .bottomLeading, endPoint: .topTrailing))//color of text
                          
                      }
                      .padding(.vertical)
                      .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                      .background(
                      
                          Capsule()
                            //.stroke(Color.gray)
                        .stroke(LinearGradient(gradient: gradient3, startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2)//color of line butten
                      )
                      .shadow(radius: 6)
                  }
              }
              .padding(.top, 40)
          }
          
      }.navigationBarTitle(Text("Read a story"), displayMode: .inline)
      .onAppear(perform: {
          
          UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
          }
      })
      .onReceive(self.time) { (_) in
          
          if self.start{
              
              if self.count != 1510{
                  
                  self.count += 1
                  print("hello")
                  
                  withAnimation(.default){
                      
                      self.to = CGFloat(self.count) / 1510
                  }
              }
              else{
              
                  self.start.toggle()
                  self.Notify()
              }

          }
          
      }
  }
  
  func Notify(){
      
      let content = UNMutableNotificationContent()
      content.title = "Message"
      content.body = "Timer Is Completed Successfully In Background !!!"
      
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
      
      let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
      
      UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
  }
}

struct game2_Previews: PreviewProvider  {
  static var previews: some View {
      
          game2()
  }
}
