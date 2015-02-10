//
//  State.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class State {
	
	var identifier: String
	var isStop = false
	
	init (identifier: String)
	{
		self.identifier = identifier
	}
	
	func description() -> String
	{
		return self.identifier
	}
}