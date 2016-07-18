//
//  LogHandler.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation

struct LogHandler {
    
    static var CallCount: [String: Int] = [String: Int]()
    
    static func Log(funcName: String = #function){
        if self.CallCount[funcName] == nil {
            self.CallCount[funcName] = 1
        } else if let oldCallCount =  self.CallCount[funcName] {
            self.CallCount[funcName]  = oldCallCount + 1
        }
        if let countTime = CallCount[funcName] {
            let logOutput = "Counted Time [\(countTime)] Function: \(funcName) Logged."
            print(logOutput)
            LogHandler.LogsCollector.appendContentsOf("\n"+logOutput)
        }
    }

    static var LogsCollector: String = "Logs Collection \n"
}