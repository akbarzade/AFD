//
//  ErrorTypes.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation

/**
 GlobalError
 
 - ErrorOnLoad: For the error's on Load
 - ErrorOnFetchData: For the error's on Fetching Data
 
 ##### Usage Example : ######
 ```
 func FunctionName(value: Type, otherValue: OtherType) throws -> {
 guard value == false else {
 throw GlobalError.ErrorOnLoad
 }
 guard otherValue == false {
 throw GlobalError.ErrorOnFetchData
 }
 }
 ```
 */
enum GlobalError: ErrorType {
    case ErrorOnLoad
    case ErrorOnFetchData
}

/**
 AirportError
 
 - AirportNotFound: Error When the requested airport not found
 - ErrorOnFetchData: For the error's on Fetching Data
 */
enum AirportError: ErrorType {
    case AirportNotFound
    case InvalidData(String)
}

/**
 CharttError
 
 - ChartNotFound: Error When the requested chart not found
 - ErrorOnFetchData: For the error's on Fetching Data
 */
enum ChartError: ErrorType {
    case ChartNotFound
    case InvalidData(String)
}
