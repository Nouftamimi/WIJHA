//
//  Intro.swift
//  Bookmarked
//
//  Created by Nouf  on 20/05/1444 AH.
//

import SwiftUI

//intro model and sample screen
struct Intro: Identifiable{
    
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var pic: String
    var color: Color
    var offset: CGSize = .zero
}

