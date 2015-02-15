//
//  DataManager.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 15/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class DataManager {
    
    class func extractMachineFromJSONWithSuccess(name: String, success: ((data: NSData) -> Void)) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            let filePath = NSBundle.mainBundle().pathForResource(name,ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
}