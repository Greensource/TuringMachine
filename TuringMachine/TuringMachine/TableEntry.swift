//
//  TableEntry.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class TableEntry {
	var initialState: State
	var readSymbol: Symbol
	var writeSymbol: Symbol
	var newState: State
	
	init(initial: State, read: Symbol, write: Symbol, final: State)
	{
		self.initialState = initial
		self.readSymbol = read
		self.writeSymbol = write
		self.newState = final
	}
}