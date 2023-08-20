import SwiftUI
import UserNotifications


//struct game1: View {
//  var body: some View {
//
//      Home()
//  }
//}


struct game1: View {

  @State var start = false
  @State var to : CGFloat = 0
  @State var count = 0
  @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
    //COLOR
    
let gradient = Gradient(colors: [Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
    let gradient2 = Gradient(colors: [Color("Color3"),Color("Color4"),Color("Color5")])
    let gradient3 = Gradient(colors: [Color("Color4"),Color("Color5")])
    let imageNames = ["imge2", "imge3", "imge4"]
   // @State private var currentImageIndex = 0
    @State private var currentImageName = "imge2"
//    @State var start1 = false
//        @State var to1: CGFloat = 0
//        @State var count1 = 0
//        @State var time1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//        let imageName = "imge2"
    
   
  var body: some View{
      
      
      ZStack{
          
          Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
          
          
          VStack{
              VStack {
             //  Image(imageNames.randomElement() ?? "imge2")
                  Image(currentImageName)
//                 // Image("imge2")
//                   //.resizable()
               
//                 //.padding(.top,-50)
//                 //  .padding(.leading,100)
             
              .resizable()
              .aspectRatio(contentMode: .fit)
                              .scaledToFit()
                              .cornerRadius(10)
                          
                              .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
                           //   .overlay(
           //     .overlay(
//                Rectangle()
             //    .stroke(Color.black, lineWidth: 1))
                 .padding(20)
                
                 .onAppear {
                             currentImageName = imageNames.randomElement() ?? "imge2"
                         }
                  
                  

                   
                //   .padding(2)
                  Text("Describe the person in the picture in 15 words")
                      .font(.title2)
                      //.padding(.top, 10)
                      .foregroundColor(.black)
                 
                      .padding(30)
                  ZStack{
                      
                      Circle()
                          .trim(from: 0, to: 1)
                          .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                          .frame(width: 210, height: 210)
                      
                      Circle()
                          .trim(from: 0, to: self.to)
                          .stroke(LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing), style: StrokeStyle(lineWidth: 30, lineCap: .round))//اغير لون الخط اللي يمشي
                          .frame(width: 210, height: 210)
                          .rotationEffect(.init(degrees: -90))
                      
                      
                      VStack{
                          
                          Text("\(self.count)")
                              .font(.system(size: 50))
                              .fontWeight(.bold)
                          
                          Text("Of 75 sec")
                              .font(.title2)
                              .padding(.top)
                      }
                  }}
              
              HStack(spacing: 20){
                  
                  Button(action: {
                      
                      if self.count == 75{
                          
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
              .padding(.top, 55)
          }.navigationBarTitle(Text("Describe the person"), displayMode: .inline)
        
          
      }
      .onAppear(perform: {
          
          UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
          }
      })
      .onReceive(self.time) { (_) in
          
          if self.start{
              
              if self.count != 75{
                  
                  self.count += 1
                  print("hello")
                  
                  withAnimation(.default){
                      
                      self.to = CGFloat(self.count) / 75
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


struct game1_Previews: PreviewProvider  {
  static var previews: some View {
      
          game1()
  }
}



