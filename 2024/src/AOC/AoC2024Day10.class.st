Class {
	#name : 'AoC2024Day10',
	#superclass : 'Object',
	#instVars : [
		'inputData',
		'grid',
		'endpoints'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'parsing' }
AoC2024Day10 class >> demoData [
	^ '.....0.
..4321.
..5..2.
..6543.
..7..4.
..8765.
..9....'.

]

{ #category : 'as yet unclassified' }
AoC2024Day10 class >> on: input [
	^ self new
		inputData: input lines asArray;
		yourself

]

{ #category : 'parts' }
AoC2024Day10 >> checkChar: chr at: pos [
	(grid posIsInside: pos) ifFalse: [ ^ false ].
	
	^ (grid charAtPos: pos) = chr.
]

{ #category : 'accessing' }
AoC2024Day10 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day10 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day10 >> nextChar: chr [
	^ (chr asInteger + 1) asCharacter.
]

{ #category : 'parts' }
AoC2024Day10 >> part1 [
	| heads result |
	
	grid := AoCGrid from: self inputData.
	
	heads := grid listFromChar: $0.
	result := 0.

	endpoints := Set new.
	
	Transcript show: heads printString; cr.
	
	grid printGrid.
	
	Transcript show: (grid charAtPos: heads first); cr.
	
	heads do: [ :head | 
		| s |
		s := Set new.
		self searchFrom: head into: s.
		result := result + (s size) ].
	
	Transcript show: 'Endpoints: '; show: endpoints printString; cr.
	
	^ result .
]

{ #category : 'parts' }
AoC2024Day10 >> part2 [
	| heads result |
	
	grid := AoCGrid from: self inputData.
	
	heads := grid listFromChar: $0.
	result := 0.

	endpoints := Set new.
	
	Transcript show: heads printString; cr.
	
	grid printGrid.
	
	Transcript show: (grid charAtPos: heads first); cr.
	
	heads do: [ :head | 
		| s |
		s := Set new.
		result := result + (self searchFrom: head into: s).
		].
	
	Transcript show: 'Endpoints: '; show: endpoints printString; cr.
	
	^ result .
]

{ #category : 'running' }
AoC2024Day10 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 10 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]

{ #category : 'parts' }
AoC2024Day10 >> searchFrom: pos into: set [
	| result currentHeight nextHeight |
	
	result := 0.

	(grid posIsInside: pos) ifFalse: [ ^ result ].
	
	currentHeight := grid charAtPos: pos.
	(currentHeight = $9) ifTrue: [ set add: pos. ^ 1 ].
	
	nextHeight := self nextChar: currentHeight.

	(self checkChar: nextHeight at: (pos + (-1@0))) ifTrue: [ 
			result := result + (self searchFrom: (pos + (-1@0)) into: set).
		 ].

	(self checkChar: nextHeight at: (pos + (0@(-1)))) ifTrue: [ 
			result := result + (self searchFrom: (pos + (0@(-1))) into: set).
		 ].

	(self checkChar: nextHeight at: (pos + (1@0))) ifTrue: [ 
			result := result + (self searchFrom: (pos + (1@0)) into: set).
		 ].

	(self checkChar: nextHeight at: (pos + (0@1))) ifTrue: [ 
			result := result + (self searchFrom: (pos + (0@1)) into: set).
		 ].
	
	^ result.
]
