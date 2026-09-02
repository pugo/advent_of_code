Class {
	#name : 'AoC2024Day06Grid',
	#superclass : 'Object',
	#instVars : [
		'grid',
		'width',
		'height'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'accessing' }
AoC2024Day06Grid class >> from: data [

	^ self new
		initializeFrom: data
		  yourself.
]

{ #category : 'running' }
AoC2024Day06Grid >> charAtPos: pos [

   ^ (grid at: (pos y)) at: (pos x)
]

{ #category : 'running' }
AoC2024Day06Grid >> charAtPos: pos set: newChar [

   (grid at: (pos y)) at: (pos x) put: newChar.
	
]

{ #category : 'initialization' }
AoC2024Day06Grid >> countX [
	| result |
	
	result := 0.
	
	grid do: [ :line |
		line do: [ :c | c = $X ifTrue: [ result := result + 1 ] ]
	 ].

   ^ result.
]

{ #category : 'initialization' }
AoC2024Day06Grid >> grid [
	^ grid
]

{ #category : 'initialization' }
AoC2024Day06Grid >> height [
	^ height
]

{ #category : 'initialization' }
AoC2024Day06Grid >> initializeFrom: data [

   grid := data.
	height := grid size.
	width := grid first size.
	
]

{ #category : 'running' }
AoC2024Day06Grid >> posIsInside: pos [
	"Return true if pos is inside the grid."
	
	^ ((pos x > 0) & (pos x <= width) & (pos y > 0) & (pos y <= height))

]

{ #category : 'initialization' }
AoC2024Day06Grid >> printGrid [

	grid do: [ :line | 
		line do: [ :c |
			Transcript show: c.
		].
		Transcript cr.
	].
]

{ #category : 'initialization' }
AoC2024Day06Grid >> width [
	^ width
]
