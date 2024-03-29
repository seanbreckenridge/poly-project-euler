Object
    subclass: #Euler
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Euler 41'.

Euler methodsFor: 'Euler 41'
!
isPrime: n
    2 to: (n sqrt floor) do: [:x |
        n even
        ifTrue: [ ^ false. ]
        ifFalse: [ n \\ x = 0 ifTrue: [ ^ false. ] ].
    ].
    ^ true.
!
isPandigital: n
    | s st |
    s := n printString.
    st := s asSet.
    (st includes: $0) ifTrue: [ ^ false. ]. " can't have 0 "
    ^ (st size == (st asSortedCollection last digitValue))
!
solve
    "any odd pandigital bigger than this is divisible by 3"
    9999999 to: 1 by: -2 do: [:n |
        (self isPandigital: n)
        ifTrue: [
            (self isPrime: n)
            ifTrue: [ ^ n. ].
        ].
    ].
!!

Euler new solve printNl.

