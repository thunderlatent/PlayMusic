//
//  Enum+MusicName.swift
//  PlayMusic
//
//  Created by Jimmy on 2020/10/22.
//

import Foundation
enum MusicName: String
{
    case classical, love, village, rock
    var englishName : String
    {
        switch self {
        default:
            return rawValue
        }
    }
    
    var chineseName: String
    {
        switch self {
        case .classical:
            return "古典"
        case .love:
            return "情歌"
        case .rock:
            return "搖滾"
        case .village:
            return "鄉村"
        }
    }
}
