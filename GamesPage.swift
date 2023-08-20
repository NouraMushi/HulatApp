import SwiftUI

//let textALL = [Text("Describe the person!"), Text("read story!"), Text("talk about anything!")]
let gradient3 = Gradient(colors: [Color("Color4"),Color("Color5")])
let gradient = Gradient(colors: [Color("Color1"), Color("Color2"), Color("Color3"), Color("Color4"), Color("Color5")])

struct CardView: View {
    var imageName: String
  //  var buttonText: String
    var cardText :String
    var body: some View {
        VStack {
      
         //  NavigationLink(destination: game1())
          Image(imageName)
           .resizable()
           .aspectRatio(contentMode: .fit)
          .frame(width: 150, height: 150)
         //**********
         
//         NavigationLink(destination: game1()){
//                                 Image(imageName)
//
//                             }
//
         //***********
         

     
//          Text("game").font(.headline)
//           .foregroundColor(.black)
//          .padding(.vertical, 10)
          
         
     
//         Button{    print("Edit button was tapped")
//         } label: {
//          Image(imageName)
//           .resizable()
//           .aspectRatio(contentMode: .fit)
//           .frame(width: 150, height: 150)
//         }
          ////         NavigationLink(destination: game1()) {
          ////                        Image(imageName)
          ////                            .resizable()
          ////                            .aspectRatio(contentMode: .fit)
          ////                            .frame(width: 220, height: 150)
          ////                    }
          //
          Text(cardText).frame(width: 200)
           .font(.headline)
           .foregroundColor(.black)
           .padding(.vertical, 10)
         
      
 //action: {
//                // Action to be performed when the button is tapped
//            }) {
//             Text(buttonText).frame(width: 150, height: 20)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(LinearGradient(gradient: gradient3, startPoint: .bottomLeading, endPoint: .topTrailing))
//                    .cornerRadius(10)
//            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
     
    }
}



struct GamesPage: View {
 var body: some View {
  
  //NavigationView{
   
   ZStack {
    LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing)
     .ignoresSafeArea()
    //VStack{
    // VStack {
    //        Text("Games")
    //         .foregroundColor(.white)
    //         .font(.system(size: 40).bold())
    //         .padding()
    //         .padding(.leading,-190)
    //         .padding(.top,50)
    
    //   }
    
    ScrollView(.vertical, showsIndicators: false) { // Change to vertical ScrollView
     //        VStack {
     
     //         ForEach(5..<8) { i in
        Spacer(minLength: 30)
     NavigationLink(destination: game1(), label:{ CardView(imageName: "imge5", cardText:"Describe the person!")})
     
     //  CardView(imageName: "imge5", cardText:"Describe the person!")
     NavigationLink(destination: game2(), label:{ CardView(imageName: "imge6", cardText:"Read story!")})
     .padding(6)
     //    CardView(imageName: "imge6",cardText:"Read story!")
     
     NavigationLink(destination: VoiceMemo() .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext), label:{ CardView(imageName: "imge7", cardText:"Talk about anything!")})
      .padding(6)
     
     //     CardView(imageName: "imge7" ,cardText:"Talk about anything!")
   //   .padding(6)
     //}
     //  }
    }
   }
  //}
   .navigationTitle("Games")
         .navigationBarBackButtonHidden(true) // Hide the default back button
         .navigationBarItems(leading: CustomBackButton())
 }
    struct CustomBackButton: View {
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.backward") .foregroundColor(.black)// You can customize the image
                   // Text("Back").foregroundColor(.black) // Customize the text
                }
            }
        }
    }
}


struct GamesPage_Previews: PreviewProvider {
    static var previews: some View {
        GamesPage()
    }
}
