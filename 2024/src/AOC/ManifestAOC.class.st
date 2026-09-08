"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestAOC',
	#superclass : 'PackageManifest',
	#category : 'AOC-Manifest',
	#package : 'AOC',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestAOC class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#AOC)) #'2026-09-02T21:40:49.728942+02:00') )
]

{ #category : 'code-critics' }
ManifestAOC class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#AOC)) #'2026-09-02T21:08:56.256703+02:00') )
]

{ #category : 'code-critics' }
ManifestAOC class >> ruleConsistencyCheckRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AoC2024Day09 #part1 #false)) #'2026-09-08T00:14:05.010974+02:00') )
]

{ #category : 'code-critics' }
ManifestAOC class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#AOC)) #'2026-09-08T01:46:43.086259+02:00') )
]

{ #category : 'code-critics' }
ManifestAOC class >> ruleReGuardClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AoC2024Day09 #part1 #false)) #'2026-09-08T00:14:09.56696+02:00') #(#(#RGClassDefinition #(#AoC2024Day09)) #'2026-09-08T00:25:14.9109+02:00') )
]

{ #category : 'code-critics' }
ManifestAOC class >> ruleToDoWithIncrementRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AoC2024Day09 #checksum #false)) #'2026-09-08T01:11:20.605752+02:00') #(#(#RGMethodDefinition #(#AoC2024Day09 #checksum2 #false)) #'2026-09-08T14:52:20.170777+02:00') )
]
