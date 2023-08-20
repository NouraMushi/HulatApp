//
//  taskViewModel.swift
//  FinalProject
//
//  Created by shatha on 25/01/1445 AH.
//

import SwiftUI
import Foundation

class taskViewModel:ObservableObject{
    
    
    @Published var Alltasks: [taskModel] = [
        taskModel(task_img: "image1",task_title: "Exercise 1: Diaphragmatic breathing",task_link: "https://youtu.be/F6tEygVuy1Y?t=25&si=72HPIUIq3wEEz8Pk",checkBox: false),
        
        taskModel(task_img: "image2",task_title: "Exercise 2: Speaking on the exhale",task_link: "https://youtu.be/F6tEygVuy1Y?t=153&si=cGurn9z-IEC-kDqH",checkBox: false),
        taskModel(task_img: "image3",task_title: "Exercise 3: Pacing",task_link:"https://youtu.be/F6tEygVuy1Y?t=217&si=Tb40k_hecIsY45Cs",checkBox: false)
        
        
        
        
    ]
    
    @Published var AllReading: [taskModel] = [
        taskModel(task_img: "image4",task_title: "“Quran“",task_link: "https://goo.by/RsvwE",checkBox: false),
        
        taskModel(task_img: "image5",task_title: "“ The power of now ”",task_link: "https://ia601000.us.archive.org/33/items/ThePowerOfNowEckhartTolle_201806/The%20Power%20Of%20Now%20-%20Eckhart%20Tolle.pdf",checkBox: false),
        taskModel(task_img: "image6",task_title: "“Atomic Habits”",task_link:"https://goo.by/DyY7S",checkBox: false)
    ]
}
    
    
    
