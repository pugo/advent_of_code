Class {
	#name : 'AoCGrid',
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
AoCGrid class >> from: data [

	^ self new
		initializeFrom: data
		  yourself.
]

{ #category : 'running' }
AoCGrid >> charAtPos: pos [

   ^ (grid at: (pos y)) at: (pos x)
]

{ #category : 'running' }
AoCGrid >> charAtPos: pos set: newChar [

   (grid at: (pos y)) at: (pos x) put: newChar.
	
]

{ #category : 'initialization' }
AoCGrid >> countChar: chr [
	| result |
	
	result := 0.
	
	grid do: [ :line |
		line do: [ :c | c = chr ifTrue: [ result := result + 1 ] ]
	 ].

   ^ result.
]

{ #category : 'initialization' }
AoCGrid >> grid [
	^ grid
]

{ #category : 'initialization' }
AoCGrid >> height [
	^ height
]

{ #category : 'initialization' }
AoCGrid >> initializeFrom: data [

   grid := data.
	height := grid size.
	width := grid first size.
	
]

{ #category : 'initialization' }
AoCGrid >> listFromChar: chr [
	| result |
	
	result := OrderedCollection new.
	
	grid withIndexDo: [ :line :y | 
		line withIndexDo: [ :c :x |
			(c = chr) ifTrue: [ result add: x@y ].			
		].
	].
	
   ^ result.
]

{ #category : 'running' }
AoCGrid >> posIsInside: pos [
	"Return true if pos is inside the grid."
	
	^ ((pos x > 0) & (pos x <= width) & (pos y > 0) & (pos y <= height))

]

{ #category : 'initialization' }
AoCGrid >> printGrid [

	grid do: [ :line | 
		line do: [ :c |
			Transcript show: c.
		].
		Transcript cr.
	].
]

{ #category : 'initialization' }
AoCGrid >> width [
	^ width
]
