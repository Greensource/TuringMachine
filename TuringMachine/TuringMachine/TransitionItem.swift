//
//  TableEntry.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class TransitionItem {
	var readSymbol: Symbol
	var writeSymbol: Symbol
    var movement: Movement
	var newState: State
	
    init(readSymbol: Symbol, writeSymbol: Symbol, movement: Movement, final: State)
	{
		self.readSymbol = readSymbol
		self.writeSymbol = writeSymbol
        self.movement = movement
		self.newState = final
	}
	
	func isEqual(otherTransitionItem: TransitionItem) -> Bool
	{
		var result = true
		
		result &= self.readSymbol.isEqual(otherTransitionItem.readSymbol)
        result &= self.writeSymbol.isEqual(otherTransitionItem.writeSymbol)
        result &= self.movement == otherTransitionItem.movement
		result &= self.newState.isEqual(otherTransitionItem.newState)
		
		return result
	}
	
	func description() -> String
	{
		var result = "|\(self.readSymbol.description())|"
		result += "\(self.writeSymbol.description())|"
        switch self.movement {
        case .Left:
            result += "Left|"
        case .Right:
            result += "Right|"
        }
        result += "\(self.newState.description())|"

		return result
	}
}