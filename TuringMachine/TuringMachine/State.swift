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
		self.isStop = identifier == "stop"
	}
	
	func isEqual(otherState: State) -> Bool
	{
		return self.identifier == otherState.identifier
	}
	
	func description() -> String
	{
        if isStop
        {
            return "STOP"
        }
        else
        {
            return self.identifier
        }
	}
}