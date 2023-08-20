//
//  taskModel.swift
//  demo
//
//  Created by LEEN KHALID ALGHANIM on 22/01/1445 AH.
//

import Foundation

struct taskModel:Identifiable{
    
    let id = UUID()
    var task_img:String
    var task_title:String
    var task_link:String
    var checkBox:Bool

    
}
