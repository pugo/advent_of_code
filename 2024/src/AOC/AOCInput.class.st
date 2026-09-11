Class {
	#name : 'AOCInput',
	#superclass : 'Object',
	#instVars : [
		'base'
	],
	#classInstVars : [
		'base'
	],
	#category : 'AOC-Utils',
	#package : 'AOC',
	#tag : 'Utils'
}

{ #category : 'as yet unclassified' }
AOCInput class >> initializeWithBase: path [

	^ self new
		base: path
		  yourself.
]

{ #category : 'as yet unclassified' }
AOCInput >> base [
	^ base.
]

{ #category : 'as yet unclassified' }
AOCInput >> base: aBase [
	base := aBase.
]

{ #category : 'as yet unclassified' }
AOCInput >> day: dayNumber [

    | filename |

    filename := 'day',
        (dayNumber printString padLeftTo: 2 with: $0),
        '.txt'.

	" /home/pugo/src/advent_of_code/2024/input "

    ^ (base asFileReference / filename) contents
]
