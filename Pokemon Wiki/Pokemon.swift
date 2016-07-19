//
//  Pokemon.swift
//  Pokemon Wiki
//
//  Created by Wilson Ding on 7/19/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import Foundation

class Pokemon {
    var number : Int = 0
    var name = ""
    var classification = ""
    var types : [String] = []
    var weaknesses : [String] = []
    var fastAttacks : [String] = []
    var weight : Int = 0
    var height : Int = 0
    var evolutionReq = [String: String]()
    var evolutions : [String] = []
    var maxCP : Int = 0
    var maxHP : Int = 0
}