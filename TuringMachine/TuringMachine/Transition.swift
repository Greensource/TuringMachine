//
//  TableEntry.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Transition {
    var oldState: State
	var readSymbol: Symbol
	var writeSymbol: Symbol
    var movement: Movement
	var newState: State
	
    init(oldState: State, readSymbol: Symbol, writeSymbol: Symbol, movement: Movement, final: State)
	{
        self.oldState = oldState
		self.readSymbol = readSymbol
		self.writeSymbol = writeSymbol
        self.movement = movement
		self.newState = final
	}
	
	init(string: String)
	{
		var components = string.componentsSeparatedByString("|");
		
		self.oldState = State(identifier: components[0])
		self.readSymbol = Symbol(string: components[1])
		self.writeSymbol = Symbol(string: components[2])
		switch components[3]
		{
		case "Left":
			self.movement = Movement.Left
		case "Right":
			self.movement = Movement.Right
		default:
			self.movement = Movement.Right
		}
		self.newState = State(identifier: components[4])
	}
    
    /*
     *  |<oldState>|<readSymbol>|<writeSymbol>|<movement>|<newState>|
     */
    init(description: String)
    {
        let elements = split(description, { (c: Character) -> Bool in
            c == "|"
        }, maxSplit: Int.max, allowEmptySlices: false)
        
        var index = 0
        let oldStateString = elements[index++]
        let readSymbolString = elements[index++]
        let writeSymbolString = elements[index++]
        let movementString = elements[index++]
        let newStateString = elements[index++]

        oldState = State(identifier: oldStateString)
        readSymbol = Symbol(string: readSymbolString)
        writeSymbol = Symbol(string: writeSymbolString)
        switch movementString {
            case "Left":
            movement = Movement.Left
            case "Right":
            movement = Movement.Right
        default:
            movement = Movement.Right
        }
        newState = State(identifier: newStateString)
        newState.isStop = newStateString == "stop"
    }
	
	func isEqual(otherTransition: Transition) -> Bool
	{
		var result = true
		
        result &= oldState.isEqual(otherTransition.oldState)
		result &= self.readSymbol.isEqual(otherTransition.readSymbol)
        result &= self.writeSymbol.isEqual(otherTransition.writeSymbol)
        result &= self.movement == otherTransition.movement
		result &= self.newState.isEqual(otherTransition.newState)
		
		return result
	}
	
	func description() -> String
	{
		var result = "|\(oldState.description())|"
        result += "\(self.readSymbol.description())|"
		result += "\(self.writeSymbol.description())|"
        switch self.movement {
        case .Left:
            result += "Left |"
        case .Right:
            result += "Right|"
        }
        result += "\(self.newState.description())|"

		return result
	}
}