//
//  ExercisePage.swift
//  FinalProject
//
//  Created by shatha on 25/01/1445 AH.
//
import SwiftUI

struct ExercisePage: View {

    
    
    let gradient = Gradient(colors:[Color("Color1"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")])
    
  
  
    @ObservedObject var taskModel = taskViewModel()
    var body : some View {
        
        
        ZStack(){
            
            LinearGradient(gradient: gradient, startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
            
            
//            VStack(alignment: .leading , spacing: -40){
//                Text("Exercises").foregroundColor(.black).font(.system(size:40).bold()).padding()
            //                  .padding(.top, 50)
                
                VStack{

                    Spacer(minLength: 28)
//                RoundedRectangle(cornerRadius: 47)
//                    .fill(.white)
//                  .frame(width: 427,alignment: .center).padding(.bottom,-50).padding(.top,60)
                   
                    List() {
                        
                        ForEach(taskModel.Alltasks.indices, id: \.self) { index in
                            let task = taskModel.Alltasks[index]
                            
                            VStack {
                                Text("\(task.task_title)")
                                
                                HStack {
                                    Button {
                                        taskModel.Alltasks[index].checkBox.toggle()
                                        print(taskModel.Alltasks[index].checkBox)
                                    } label: {
                                        Image(systemName: taskModel.Alltasks[index].checkBox ? "checkmark.circle" : "circle")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(taskModel.Alltasks[index].checkBox ? .green : .black)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Spacer()
                                        
                                        Image("\(task.task_img)")
                                            .resizable()
                                            .frame(width: 250, height: 200)
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                if let url = URL(string: "\(task.task_link)") {
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
                        
                        
                  }.listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .frame(width: .infinity,height: .infinity)
                        .cornerRadius(radius:60, corners: [.topLeft,.topRight])
                        //  .edgesIgnoringSafeArea(.bottom)
                        //.listStyle(.insetGrouped)
//                    //.scrollContentBackground(.hidden)
//                    .frame(width: 400.0, height: 500.0)
//                    .scrollContentBackground(.hidden)
//                    .background(Color.clear)
//                    .tint(.clear)
                    
         
                    
//                }
            
                
                
                
                
                
                
                
                
                
            }
            
        }.navigationTitle("Exercises")
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .edgesIgnoringSafeArea(.bottom)
                      .navigationBarItems(
                          leading: CustomBackButton())//customize the back button
        
    }
}
struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward") .foregroundColor(.black)// You can customize the image
              //  Text("Back").foregroundColor(.black) // Customize the text
            }
        }
    }
}

struct ExercisePage_Previews: PreviewProvider {
    static var previews: some View {
        ExercisePage()
    }
}

