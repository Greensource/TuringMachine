//
//  TableEntry.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Transition {
	var initialState: State
	var readSymbols: [Symbol]
	var writeSymbols: [Symbol]
	var newState: State
	
	init(initial: State, readables: [Symbol], writables: [Symbol], final: State)
	{
		self.initialState = initial
		self.readSymbols = readables
		self.writeSymbols = writables
		self.newState = final
	}
	
	func isEqual(otherTransition: Transition) -> Bool
	{
		var result = true
		
		result &= self.initialState.isEqual(otherTransition.initialState)
		for index in 0...self.readSymbols.count
		{
			result &= self.readSymbols[index].isEqual(otherTransition.readSymbols[index])
		}
		for index in 0...self.writeSymbols.count
		{
			result &= self.writeSymbols[index].isEqual(otherTransition.writeSymbols[index])
		}
		result &= self.newState.isEqual(otherTransition.newState)
		
		return result
	}
	
	func description() -> String
	{
		var result = "|\(self.initialState.description())|"
		for read in self.readSymbols
		{
			result += "\(read.description())|"
		}
		for write in self.writeSymbols
		{
			result += "\(write.description())|"
		}
		result += "\(self.newState.description())|"
		
		return result
	}
}