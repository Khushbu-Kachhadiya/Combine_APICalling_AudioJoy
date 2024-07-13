//
//  PostEmail.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 12/07/24.
//

import Foundation
import ObjectMapper

struct EmailPostModel: Codable{
    var appId:Int
    var email:String
}

class PostEmail: ImmutableMappable {
    let status: Bool
    let statusResult: String
    
    private enum Keys {
        static let status = "status"
        static let statusResult = "statusResult"
    }
    
    required public init(map: ObjectMapper.Map) throws {
        self.status = try map.value(Keys.status)
        self.statusResult = try map.value(Keys.statusResult)
    }
}
