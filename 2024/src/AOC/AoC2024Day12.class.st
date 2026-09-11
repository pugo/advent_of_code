Class {
	#name : 'AoC2024Day12',
	#superclass : 'Object',
	#instVars : [
		'inputData',
		'grid',
		'endpoints',
		'garden',
		'visited'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'parsing' }
AoC2024Day12 class >> demoData [
	^ 'AAAA
BBCD
BBCC
EEEC'.

]

{ #category : 'as yet unclassified' }
AoC2024Day12 class >> on: input [
	^ self new
		inputData: input lines asArray;
		yourself

]

{ #category : 'parts' }
AoC2024Day12 >> checkPlot: aPlot connectedTo: pos [
	^ (grid charAtPos: aPlot pos) = (grid charAtPos: pos).

]

{ #category : 'parts' }
AoC2024Day12 >> connectGarden [
	| |


	garden do: [ :row |
		 row do: [ :plot |
			| up right down left other |
			up := plot pos + (0@(-1)).
			right := plot pos + (1@0).
			down := plot pos + (0@1).
			left := plot pos + (-1@0).
			
			(grid posIsInside: up) ifTrue: [
				(self checkPlot: plot connectedTo: up) ifTrue: [ 
						other := self plotAtPos: up.
						plot up: other.
						other down: plot.
					 ]
				].

			(grid posIsInside: right) ifTrue: [
				(self checkPlot: plot connectedTo: right) ifTrue: [ 
						other := self plotAtPos: right.
						plot right: other.
						other left: plot.
					 ]
				].
			
			(grid posIsInside: down) ifTrue: [
				(self checkPlot: plot connectedTo: down) ifTrue: [ 
						other := self plotAtPos: down.
						plot down: other.
						other up: plot.
					 ]
				].

			(grid posIsInside: left) ifTrue: [
				(self checkPlot: plot connectedTo: left) ifTrue: [ 
						other := self plotAtPos: left.
						plot left: other.
						other right: plot.
					 ]
				].
			
		 ].
	].


]

{ #category : 'parts' }
AoC2024Day12 >> initGarden [
	| result |

	result := OrderedCollection new.

	grid grid withIndexDo: [ :row :y |
 		 | gr |
		 gr := OrderedCollection new.

		 row withIndexDo: [ :c :x |
				gr add: (AoC2024Day12Plot initializeAt: x@y withPlant: c).
		 ].

		 result add: gr.
	].

	^ result.
]

{ #category : 'accessing' }
AoC2024Day12 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day12 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day12 >> part1 [

	| total |
	
	grid := AoCGrid from: self inputData.
	garden := self initGarden.
	visited := Set new.
	total := 0.

	self connectGarden.

	garden do: [ :row |
		row do: [ :plot |
			| result cost |
			result := plot calcRegion: visited.
			cost := result first * result second.
			
			total := total + cost.
		]
	].

	
	Transcript show: 'Cost total: '; show: total; cr.
	 
]

{ #category : 'parts' }
AoC2024Day12 >> part2 [

	| total |
	
	grid := AoCGrid from: self inputData.
	garden := self initGarden.
	visited := Set new.
	total := 0.

	self connectGarden.

	garden do: [ :row |
		row do: [ :plot |
			| result cost |
			result := plot calcRegion: visited.
			
			
			cost := result first * result third.
			
			total := total + cost.
		]
	].

	
	Transcript show: 'Cost total: '; show: total; cr.
	 
]

{ #category : 'running' }
AoC2024Day12 >> plotAtPos: pos [

   ^ (garden at: (pos y)) at: (pos x)
]

{ #category : 'running' }
AoC2024Day12 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 12 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]
