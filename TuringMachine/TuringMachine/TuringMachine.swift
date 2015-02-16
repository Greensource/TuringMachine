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
	var transitionTable: [Transition]
    var currentState: State
	var currentTransition: Transition
	var terminate: Bool

    init(tape: Tape, initialState: State, transitions: [Transition])
	{
		self.tape = tape
		self.transitionTable = transitions
		self.terminate = false
		self.currentTransition = self.transitionTable[0]
        self.currentState = initialState
	}
	
	func executeTransition() -> Bool
	{
        var transitionWasExecuted = false
        var currentTapeSymbol = self.tape.readCurrentCell()
        if self.currentTransition.readSymbol.isEqual(currentTapeSymbol)
        {
			//println("Execute transition \(self.currentTransition.description())")

            transitionWasExecuted = true
            
            // ok, we can write the new Symbol
            //println("Change Cell value from \(self.tape.currentCell().description()) to \(currentTransition.writeSymbol.description())")
            self.tape.writeCurrentCell(currentTransition.writeSymbol)
            
            // execute movement on tape
            switch currentTransition.movement
            {
            case .Left:
                self.tape.previousCell()
                //println("Move to Left")
            case .Right:
                self.tape.nextCell()
                //println("Move to Right")
            }
            
            // Then pass to new State
            self.currentState = currentTransition.newState;
            //println("New State is \(newState.description())")
            
            if self.currentState.isStop
            {
                // Stop if state is stop
                self.terminate = true
                println("[STOP]")
            }
        }
        else
        {
            // Symbols are different
        }
		
		return transitionWasExecuted
    }
	
	func transitionsForState(state: State) -> [Transition]
	{
		var result: [Transition] = []
		for index in 0...(self.transitionTable.count-1)
		{
			let current = self.transitionTable[index]
			if current.oldState.isEqual(state)
			{
				result.append(current)
			}
		}
	
		return result
	}
	
	func execute()
	{
		// execute transition, starting by the 0 index one
		while !self.terminate
		{
            // Find right Transition
            let possibleTransitions = self.transitionsForState(currentState)

			var transitionSucceed = false
            for transition in possibleTransitions
            {
                if transition.oldState.isEqual(currentState) && !transitionSucceed
                {
                    self.currentTransition = transition
					transitionSucceed = self.executeTransition();
                }
            }
            if !transitionSucceed
            {
                self.terminate = true
                println("[Error] Current state doesn't match with any state")
            }
            
            println("Tape : \(self.tape.fullDescription()) state:\(self.currentState.description())")
		}
	}
}