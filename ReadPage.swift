//
//  ContentView.swift
//  Reading page
//
//  Created by Rawan on 19/01/1445 AH.




// ORIGINAL CODE


//import SwiftUI
//
//struct ReadPage: View {
//    @State var ch1 = false
//    @State var ch2 = false
//    @State var ch3 = false
//
//    let gradient = Gradient(colors:[Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
//
//    var body : some View {
//        // NavigationView()
//        //  {
//
//        ZStack{
//
//            LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
//            VStack(alignment: .leading , spacing: -40){
//                Text("Reading").foregroundColor(.black).font(.system(size:40).bold()).padding()
//                    .padding(.top, 50)
//
//                ZStack{
//                    RoundedRectangle(cornerRadius: 47)
//                        .fill(.white)
//                        .frame(width: 390,alignment: .center).padding(.bottom,-50).padding(.top,60)
//
//                    List() {
//                        HStack {
//                           Spacer()
//
//                            Text("Read outloud")
//                                .font(.title)
//                                .font(.body)
//                                .multilineTextAlignment(.center)
//                            Image(systemName: "person.wave.2.fill")
//                            Text(":  ")
//                            Text("\n")
//                            Spacer()
//                        }
//
//                        VStack{
//                            Text("“Quran“")
//                            HStack {
//                                Button {
//                                    self.ch1.toggle()
//                                    print(ch1)
//                                } label: {
//
//                                    if(ch1){Image(systemName: "checkmark.circle")
//                                            .resizable()
//                                            .frame(width: 20,height: 20)
//                                        .foregroundColor(.green)}
//                                    else
//                                    {
//                                        Image(systemName: "circle")
//                                            .resizable()
//                                            .frame(width: 20,height: 20)
//
//                                    }
//                                }
//
//                                Image("image4")
//                                    .resizable()
//                                    .frame(width: 200, height: 100)
//                                    .cornerRadius(10)
//
//                                //Text("https://goo.by/RsvwE")
//                                    .onTapGesture {
//                                        if let url = URL(string: "https://goo.by/RsvwE") {
//                                            UIApplication.shared.open(url)
//                                        }
//                                    }
//                            }
//                        }
//
//
//                        VStack{
//                            Text("“ The power of now ”")
//
//                            HStack{
//                                Button {
//                                    self.ch2.toggle()
//                                    print(ch2)
//
//                                } label: {
//                                    if(ch2){Image(systemName: "checkmark.circle")
//                                            .resizable()
//                                            .frame(width: 20,height: 20)
//                                        .foregroundColor(.green)}
//                                    else
//                                    {
//                                        Image(systemName: "circle")
//                                            .resizable()
//                                            .frame(width: 20,height: 20)
//                                    }
//                                }
//
//
//                                Image("image5")
//                                    .resizable()
//                                    .frame(width: 200, height: 100)
//                                    .cornerRadius(10)
//                                    .onTapGesture {
//                                        if let url = URL(string: "https://goo.by/RsvwE"){
//                                            UIApplication.shared.open(url)
//                                        }
//                                    }
//                            }
//                        }
//
//                        VStack{
//                            Text("“Atomic Habits”")
//                            HStack {
//                                Button {
//                                    self.ch3.toggle()
//                                    print(ch3)
//
//                                } label: {
//
//                                    if(ch3){Image(systemName: "checkmark.circle")
//                                            .resizable()
//                                            .frame(width: 20,height: 20)
//                                        .foregroundColor(.green)}
//                                    else
//                                    {
//                                        Image(systemName: "circle")
//                                            .resizable()
//                                            .frame(width: 20,height: 20)
//                                    }
//                                }
//                                Image("image6")
//                                    .resizable()
//                                    .frame(width: 200, height: 100)
//                                    .cornerRadius(10)
//                                    .onTapGesture {
//                                        if let url = URL(string: "https://goo.by/DyY7S") {
//                                            UIApplication.shared.open(url)
//                                        }
//
//                                    }
//                            }
//                        }
//                    }
//                    .scrollContentBackground(.hidden)
//
//                    .frame(width: 400.0, height: 400.0)
//                    .listStyle(.plain)
//
//                }
//            } //vstack
//
//                //  .navigationTitle("Reading")
//
//            // }
//            }
//
//        }
//
//    struct ReadPage_Previews: PreviewProvider {
//        static var previews: some View {
//            ReadPage()
//        }
//    }
//}




//MVVM Concept
import SwiftUI

struct ReadPage: View {
  
    
    let gradient = Gradient(colors:[Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
    
    @ObservedObject var taskModel = taskViewModel()
    
    var body : some View {
        // NavigationView()
        //  {
    
        ZStack{
            
            LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
//           RoundedRectangle(cornerRadius: 47)
//                             .fill(.white)
//                            .frame(width: 390,alignment: .center).padding(.bottom,-50).padding(.top,60)
          //  VStack(alignment: .leading , spacing: -40){
               // Text("Reading").foregroundColor(.black).font(.system(size:40).bold()).padding()
               //     .padding(.top, 50)
             
//               ZStack{
                  
                  
           // padding(.top,10)
                //.padding(.top, 20)
          //  VStack{
//                NavigationLink("", destination: EmptyView()) // Empty link for proper spacing
            VStack {
               Spacer(minLength: 28)
                List() {
                        HStack {
                            Spacer()
                            
                            Text("Read outloud")
                                .font(.system(size:24,weight:.regular))
                                .font(.body)
                                .multilineTextAlignment(.center)
                            Image(systemName: "person.wave.2.fill")
                            Text(":  ")
                            Text("\n")
                            Spacer()
                        }
                        ForEach(taskModel.AllReading.indices, id: \.self) { index in
                            let read = taskModel.AllReading[index]
                            
                            VStack {
                                Text("\(read.task_title)")
                                
                                HStack {
                                    Button {
                                        taskModel.AllReading[index].checkBox.toggle()
                                        print(taskModel.Alltasks[index].checkBox)
                                    } label: {
                                        Image(systemName: taskModel.AllReading[index].checkBox ? "checkmark.circle" : "circle")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(taskModel.AllReading[index].checkBox ? .green : .black)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Spacer()
                                        
                                        Image("\(read.task_img)")
                                            .resizable()
                                            .frame(width: 150, height: 200)
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                if let url = URL(string: "\(read.task_link)") {
                                                    UIApplication.shared.open(url)
                                                }
                                            }
                                        
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                        }
                        
                        
                        
                        
                        
                    }
                    .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .frame(width: .infinity)
                        .cornerRadius(radius:60, corners: [.topLeft,.topRight])
                    //.padding(.top,15)
                    .edgesIgnoringSafeArea(.bottom)
            }
                //  .cornerRadius(47)
                // .padding(.top, 20)
                // .clipShape(RoundedRectangle(cornerRadius: 47, style: .continuous))
          //  }
                    
               // }
            //} //vstack
                
                //  .navigationTitle("Reading")
                
//            }
        }.navigationTitle("Reading")
            
  //      .navigationBarTitle("Reading",displayMode:.inline)
        
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
    
    struct ReadPage_Previews: PreviewProvider {
        static var previews: some View {
            ReadPage()
        }
    }
}






