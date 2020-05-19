:Namespace Contest2020

        AboutMe←,⊂'Tell us a bit about yourself'
        ⍝ AboutMe,←⊂''  ⍝ copy, uncomment, and edit this line if you need more space

        Reaction←,⊂'Please share your thoughts about the 2020 competition'
        ⍝ Reaction,←⊂''  ⍝ copy, uncomment, and edit this line if you need more space


        :Namespace Problems
                (⎕IO ⎕ML ⎕WX)←1 1 3

                ∇ score←dd DiveScore scores
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 1, Task 1 - DiveScore
                  :If 7=≢scores
                          scores←scores[¯2↓2↓⍋scores]
                  :ElseIf 5=≢scores
                          scores←scores[¯1↓1↓⍋scores]
                  :Else
                          scores←scores
                  :EndIf
                  score←2(⍎⍕)dd×+/scores
                ∇

                ∇ steps←{p}Steps fromTo;segments;width
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 2, Task 1 - Steps
                  width←|-/fromTo
                  :If 0=⎕NC'p' ⍝ No left argument: same as Problem 5 of Phase I
                          segments←0,⍳width
                  :ElseIf p<0 ⍝ -⌊p is the number of equally-sized steps to take
                          segments←(-⌊p){0,⍵×⍺÷⍨⍳⍺}width
                  :ElseIf p>0 ⍝ p is the step size
                          segments←p{⍵⌊⍺×0,⍳⌈⍵÷⍺}width
                  :ElseIf p=0 ⍝ As if we took zero step
                          segments←0
                  :EndIf
                  ⍝ Take into account the start point and the direction.
                  steps←fromTo{(⊃⍺)+(-×-/⍺)×⍵}segments
                ∇

                ∇ urls←PastTasks url;r;paths
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 3, Task 1 - PastTasks
                  r←HttpCommand.Get url
                  paths←('[a-zA-Z0-9_/]+\.pdf'⎕S'&')r.Data
                  urls←('https://www.dyalog.com/'∘,)¨paths
                ∇

                ⍝ Test if a DNA string is a reverse palindrome.
                isrevp←{⍵≡⌽'TAGC'['ATCG'⍳⍵]}
                ⍝ Generate all subarrays (position, length) pairs, for
                ⍝ 4 ≤ length ≤ 12.
                subarrays←{⊃,/(⍳⍵),¨¨3↓¨⍳¨12⌊1+⍵-⍳⍵}
                ∇ r←revp dna;positions
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 4, Task 1 - revp
                  positions←subarrays⍴dna
                  ⍝ Filter subarrays which are reverse palindromes.
                  r←↑({isrevp dna[¯1+⍵[1]+⍳⍵[2]]}¨positions)/positions
                ∇

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Problem 4, Task 2 - sset
                sset←{((1E6|2∘×)⍣⍵)1}

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Problem 5, Task 1 - rr

                ⍝ First solution: ((1+⊢)⊥⊣) computes the total return
                ⍝ for a vector of amounts ⍺ and a vector of rates
                ⍝ ⍵. It is applied to every prefix subarray of amounts
                ⍝ and rates to get all intermediate values. However,
                ⍝ this has quadratic complexity.
                ⍝ rr←(,\⊣)((1+⊢)⊥⊣)¨(,\⊢)

                ⍝ Second solution: We want to be able to use the
                ⍝ recurrence relation (recur) and scan through the
                ⍝ vectors of amounts and rates, accumulating the total
                ⍝ value at every time step. However, APL evaluation is
                ⍝ right-associative, so a simple Scan
                ⍝ (recur\amounts,¨values) would not give the correct
                ⍝ result, since recur is not associative and we need
                ⍝ to evaluate it left-to-right. (In any case, in this
                ⍝ case, Scan would have quadratic complexity, so would
                ⍝ not bring any benefit over the previous solution.)
                ⍝ What we need is something akin to Haskell's scanl
                ⍝ function, which would evaluate left to right in O(n)
                ⍝ time. This is what we do here, accumulating values
                ⍝ from left to right. (This is inspired from
                ⍝ dfns.ascan, although heavily simplified.)
                rr←{recur←{⍵[1]+⍺×1+⍵[2]} ⋄ 1↓⌽⊃{(⊂(⊃⍵)recur⍺),⍵}/⌽⍺,¨⍵}

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Problem 5, Task 2 - pv
                ⍝ Simply apply the formula for cashflow calculations.
                pv←{+/⍺÷×\1+⍵}

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Problem 6, Task 1 - Merge
                ∇ val←ns getval var
                  :If ''≡var ⍝ literal '@'
                          val←'@'
                  :ElseIf (⊂var)∊ns.⎕NL ¯2
                          val←⍕ns⍎var
                  :Else
                          val←'???'
                  :EndIf
                ∇

                ∇ text←templateFile Merge jsonFile;template;ns
                  template←⊃⎕NGET templateFile 1
                  ns←⎕JSON⊃⎕NGET jsonFile
                  ⍝ We use a simple regex search and replace on the
                  ⍝ template.
                  text←↑('@[a-zA-Z]*@'⎕R{ns getval ¯1↓1↓⍵.Match})template
                ∇

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Problem 7, Task 1 - CheckDigit
                CheckDigit←{10|-⍵+.×11⍴3 1}

                ⍝ Left and right representations of digits. Decoding
                ⍝ the binary representation from decimal is more
                ⍝ compact than writing everything explicitly.
                lrepr←⍉(7⍴2)⊤13 25 19 61 35 49 47 59 55 11
                rrepr←~¨lrepr

                ∇ bits←WriteUPC digits;left;right
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 7, Task 2 - WriteUPC
                  :If (11=≢digits)∧∧/digits∊0,⍳9
                          left←,lrepr[1+6↑digits;]
                          right←,rrepr[1+6↓digits,CheckDigit digits;]
                          bits←1 0 1,left,0 1 0 1 0,right,1 0 1
                  :Else
                          bits←¯1
                  :EndIf
                ∇

                ∇ digits←ReadUPC bits
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 7, Task 3 - ReadUPC
                  :If 95≠⍴bits ⍝ incorrect number of bits
                          digits←¯1
                  :Else
                          ⍝ Test if the barcode was scanned right-to-left.
                          :If 0=2|+/bits[3+⍳7]
                                  bits←⌽bits
                          :EndIf
                          digits←({¯1+lrepr⍳⍵}¨(7/⍳6)⊆42↑3↓bits),{¯1+rrepr⍳⍵}¨(7/⍳6)⊆¯42↑¯3↓bits
                          :If ~∧/digits∊0,⍳9 ⍝ incorrect parity
                                  digits←¯1
                          :ElseIf (⊃⌽digits)≠CheckDigit ¯1↓digits ⍝ incorrect check digit
                                  digits←¯1
                          :EndIf
                  :EndIf
                ∇

                ∇ parts←Balance nums;subsets;partitions
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Problem 8, Task 1 - Balance

                  ⍝ This is a brute force solution, running in
                  ⍝ exponential time. We generate all the possible
                  ⍝ partitions, filter out those which are not
                  ⍝ balanced, and return the first matching one. There
                  ⍝ are more advanced approach running in
                  ⍝ pseudo-polynomial time (based on dynamic
                  ⍝ programming, see the "Partition problem" Wikipedia
                  ⍝ page), but they are not warranted here, as the
                  ⍝ input size remains fairly small.

                  ⍝ Generate all partitions of a vector of a given
                  ⍝ size, as binary mask vectors.
                  subsets←{1↓2⊥⍣¯1⍳2*⍵}
                  ⍝ Keep only the subsets whose sum is exactly
                  ⍝ (+/nums)÷2.
                  partitions←nums{((2÷⍨+/⍺)=⍺+.×⍵)/⍵}subsets⍴nums
                  :If 0=≢,partitions
                          ⍝ If no partition satisfy the above
                          ⍝ criterion, we return ⍬.
                          parts←⍬
                  :Else
                          ⍝ Otherwise, we return the first possible
                          ⍝ partition.
                          parts←nums{((⊂,(⊂~))⊃↓⍉⍵)/¨2⍴⊂⍺}partitions
                  :EndIf
                ∇

                ∇ weights←Weights filename;mobile;branches;mat
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 9, Task 1 - Weights
                  ⍝ Put your code and comments below here

                  ⍝ Parse the mobile input file.
                  mobile←↑⊃⎕NGET filename 1
                  branches←⍸mobile∊'┌┴┐'
                  ⍝ TODO: Build the matrix of coefficients mat.

                  ⍝ Solve the system of equations (arbitrarily setting
                  ⍝ the first variable at 1 because the system is
                  ⍝ overdetermined), then multiply the coefficients by
                  ⍝ their least common multiple to get the smallest
                  ⍝ integer weights.
                  weights←((1∘,)×(∧/÷))mat[;1]⌹1↓[2]mat
                ∇

        :EndNamespace
:EndNamespace
