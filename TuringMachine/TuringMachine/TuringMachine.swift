//
//  TuringMachine.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 12/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class TuringMachine {
	
	var tape: Tape
	var transitions: [Transition]
	var currentTransition: Transition
	var terminate: Bool

	init(tape: Tape, transitions: [Transition])
	{
		self.tape = tape
		self.transitions = transitions
		self.terminate = false
		self.currentTransition = self.transitions[0]
	}
	
	func executeTransition(transition: Transition)
	{
		
		for index in 0...transition.readSymbols.count
		{
			var currentTapeSymbol = self.tape.readCurrentCell()
			var currentTransitionSymbol = transition.readSymbols[index]
			if currentTransitionSymbol.isEqual(currentTapeSymbol)
			{
				// ok, we can write the new Symbol
				self.tape.writeCurrentCell(transition.writeSymbols[index])
				
				// Then pass to new State
				var newState = transition.newState;
				var tuple = self.transitionForState(newState)
				if let newTransition = tuple.transition
				{
					self.currentTransition = newTransition
				}
				else
				{
					// Error, TuringMachine is non terminating, force Stop
					self.terminate = newState.isStop
				}
				
				// Stop if state is stop
				self.terminate = newState.isStop
			}
		}
	}
	
	func transitionForState(state: State) -> (transition: Transition?, index: Int)
	{
		for index in 0...(self.transitions.count-1)
		{
			var current = self.transitions[index]
			if current.initialState.isEqual(state)
			{
				return (current,index)
			}
		}
	
		return (nil,0)
	}
	
	func execute()
	{
		// execute transition, starting by the 0 index one
		while !self.terminate
		{
			self.executeTransition(self.currentTransition);
		}
	}
}