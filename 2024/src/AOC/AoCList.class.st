Class {
	#name : 'AoCList',
	#superclass : 'Object',
	#instVars : [
		'head',
		'tail'
	],
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'accessing' }
AoCList >> head [
	^ head.
]

{ #category : 'accessing' }
AoCList >> printList [
	| node |
	
	node := head.

	[node isNotNil] whileTrue: [
			Transcript show: 'Node: '; show: (node value) prettyStr; cr.
			node := node next.
		].
]

{ #category : 'accessing' }
AoCList >> pushBack: node [

   tail ifNotNil: [
      tail next: node.
      node previous: tail
   ].

   head ifNil: [ head := node ].
   tail := node.
]

{ #category : 'accessing' }
AoCList >> tail [
	^ tail.
]
