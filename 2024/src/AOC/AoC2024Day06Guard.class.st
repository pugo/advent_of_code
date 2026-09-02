Class {
	#name : 'AoC2024Day06Guard',
	#superclass : 'Object',
	#instVars : [
		'pos',
		'dir',
		'grid',
		'inside'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'accessing' }
AoC2024Day06Guard class >> on: grid [

	^ self new
		initializeOn: grid
		  yourself.
]

{ #category : 'accessing' }
AoC2024Day06Guard >> charAhead [
	| pa |

	pa := self posAhead.
	
	(grid posIsInside: pa) ifTrue: [ 
		^ grid charAtPos: pa.
	 ].

   ^ $?


]

{ #category : 'running' }
AoC2024Day06Guard >> charFromDir [

   dir caseOf: {
      [ #up ]    -> [ ^ $^ ].
      [ #right ]    -> [ ^ $> ].
      [ #down ]    -> [ ^ $v ].
      [ #left ]    -> [ ^ $< ].
   }.

	^ $?
]

{ #category : 'accessing' }
AoC2024Day06Guard >> dir [
   ^ dir
]

{ #category : 'running' }
AoC2024Day06Guard >> dirFromChar: chr [

   chr caseOf: {
      [ $^ ]    -> [ ^#up ].
      [ $> ]    -> [ ^#right ].
      [ $v ]    -> [ ^#down ].
      [ $< ]    -> [ ^#left ].
   }.

	^ #none
]

{ #category : 'running' }
AoC2024Day06Guard >> findStartPos [
	grid grid withIndexDo: [ :line :y | 
		line withIndexDo: [ :c :x |
			('^>v<' includes: c) ifTrue: [ ^ x@y. ].			
		].
	].

]

{ #category : 'accessing' }
AoC2024Day06Guard >> initializeOn: newGrid [

	grid := newGrid.

	pos := self findStartPos.
	dir := self dirFromChar: (grid charAtPos: pos).

	inside := grid posIsInside: pos.
	
	Transcript 
		show: 'Initialized guard at: ';
		show: pos;
		show: ', direction: ';
		show: dir; cr.
]

{ #category : 'accessing' }
AoC2024Day06Guard >> inside [
   ^ inside
]

{ #category : 'accessing' }
AoC2024Day06Guard >> pos [
   ^ pos
]

{ #category : 'accessing' }
AoC2024Day06Guard >> posAhead [

	dir 
	    caseOf: {
	        [ #up ]    -> [ ^ pos + (0 @ -1) ].
	        [ #right ] -> [ ^ pos + (1 @ 0) ].
	        [ #down ]  -> [ ^ pos + (0 @ 1) ].
	        [ #left ]  -> [ ^ pos + (-1 @ 0) ].
	    }.
	
	^ pos.
]

{ #category : 'accessing' }
AoC2024Day06Guard >> turnRight [
	
	dir 
	    caseOf: {
	        [ #up ]    -> [ dir := #right ].
	        [ #right ] -> [ dir := #down ].
	        [ #down ]  -> [ dir := #left ].
	        [ #left ]  -> [ dir := #up ].
	    }.
	
	grid charAtPos: pos set: self charFromDir.

]

{ #category : 'accessing' }
AoC2024Day06Guard >> walk [

	grid charAtPos: pos set: $X.

	pos := self posAhead.

	(grid posIsInside: pos) 
		ifTrue: [ grid charAtPos: pos set: self charFromDir ]
		ifFalse: [ inside := false ].




]
