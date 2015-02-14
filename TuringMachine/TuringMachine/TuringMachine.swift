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
	var currentTransition: Transition
	var terminate: Bool

	init(tape: Tape, transitions: [Transition])
	{
		self.tape = tape
		self.transitionTable = transitions
		self.terminate = false
		self.currentTransition = self.transitionTable[0]
	}
	
	func executeTransition(transition: Transition)
	{
        var foundSymbol = false
		for index in 0...(transition.transitionItems.count-1)
		{
            var currentTransition = transition.transitionItems[index]
			var currentTapeSymbol = self.tape.readCurrentCell()
			if currentTransition.readSymbol.isEqual(currentTapeSymbol)
			{
                foundSymbol = true
                
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
				var newState = currentTransition.newState;
                //println("New State is \(newState.description())")
                
                if !newState.isStop
                {
                    var tuple = self.transitionForState(newState)
                    if let newTransition = tuple.transition
                    {
                        self.currentTransition = newTransition
                        return
                    }
                    else
                    {
                        // Error, TuringMachine is non terminating, force Stop
                        self.terminate = newState.isStop
                        println("[Error] No next state found, this machine will not terminate")
                    }
                }
                else
                {
                    // Stop if state is stop
                    self.terminate = true
                    println("[STOP]")
                    return
                }
			}
            else
            {
               // Symbols are different
            }
		}
        
        if !foundSymbol
        {
            println("[Error] No Symbol matching on this Cell, this machine will not terminate")
            self.terminate = true
        }
	}
	
	func transitionForState(state: State) -> (transition: Transition?, index: Int)
	{
		for index in 0...(self.transitionTable.count-1)
		{
			var current = self.transitionTable[index]
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
            println("Tape : \(self.tape.fullDescription())")
		}
	}
}