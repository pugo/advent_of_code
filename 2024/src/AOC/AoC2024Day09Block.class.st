Class {
	#name : 'AoC2024Day09Block',
	#superclass : 'Object',
	#instVars : [
		'index',
		'size',
		'pos',
		'moved'
	],
	#category : 'AOC-Utils',
	#package : 'AOC',
	#tag : 'Utils'
}

{ #category : 'accessing' }
AoC2024Day09Block class >> initializeIndex: anIndex size: aSize pos: aPos [
    ^ self new
        initializeIndex: anIndex size: aSize pos: aPos 
]

{ #category : 'accessing' }
AoC2024Day09Block >> index [
    ^ index
]

{ #category : 'accessing' }
AoC2024Day09Block >> index: aIndex [
    index := aIndex
]

{ #category : 'accessing' }
AoC2024Day09Block >> initializeIndex: anIndex size: aSize pos: aPos [
    index := anIndex.
    size := aSize.
		 pos := aPos.
		 moved := false.
    ^ self
]

{ #category : 'accessing' }
AoC2024Day09Block >> moved [
    ^ moved
]

{ #category : 'accessing' }
AoC2024Day09Block >> moved: aMoved [
    ^ moved
]

{ #category : 'accessing' }
AoC2024Day09Block >> pos [
    ^ pos
]

{ #category : 'accessing' }
AoC2024Day09Block >> prettyStr [
    ^ '[', (index asString), ' : ', (size asString), ']'.
]

{ #category : 'accessing' }
AoC2024Day09Block >> size [
    ^ size
]

{ #category : 'accessing' }
AoC2024Day09Block >> size: aSize [
    size := aSize
]
