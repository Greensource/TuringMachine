//
//  Transition.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 14/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Transition {
    var initialState: State
    var transitionItems: [TransitionItem]
    
    init(initialState: State, items: [TransitionItem])
    {
        self.initialState = initialState
        self.transitionItems = items
    }
}