:Namespace Contest2020

        AboutMe←,⊂'Tell us a bit about yourself'
        ⍝ AboutMe,←⊂''  ⍝ copy, uncomment, and edit this line if you need more space

        Reaction←,⊂'Please share your thoughts about the 2020 competition'
        ⍝ Reaction,←⊂''  ⍝ copy, uncomment, and edit this line if you need more space


        :Namespace Problems
                (⎕IO ⎕ML ⎕WX)←1 1 3

                ∇ score←dd DiveScore scores
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 1, Task 1 - DiveScore
                  ⍝ Put your code and comments below here
                  :If 7=≢scores
                          scores←scores[¯2↓2↓⍋scores]
                  :ElseIf 5=≢scores
                          scores←scores[¯1↓1↓⍋scores]
                  :Else
                          scores←scores
                  :EndIf
                  score←2(⍎⍕)dd×+/scores
                ∇

                ∇ steps←{p}Steps fromTo
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 2, Task 1 - Steps
                  ⍝ Put your code and comments below here
                ∇

                ∇ urls←PastTasks url;r;paths
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 3, Task 1 - PastTasks
                  ⍝ Put your code and comments below here
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
                  ⍝ Stub function for Problem 4, Task 1 - revp
                  ⍝ Put your code and comments below here
                  positions←subarrays⍴dna
                  ⍝ Filter subarrays which are reverse palindromes.
                  r←↑({isrevp dna[¯1+⍵[1]+⍳⍵[2]]}¨positions)/positions
                ∇

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Stub function for Problem 4, Task 2 - sset
                ⍝ Put your code and comments below here
                sset←{((1E6|2∘×)⍣⍵)1}

                ⍝ 2020 APL Problem Solving Competition Phase II
                ⍝ Problem 5, Task 1 - rr
                ⍝ ((1+⊢)⊥⊣) computes the total return for a vector of
                ⍝ amounts ⍺ and a vector of rates ⍵. It is applied to
                ⍝ every prefix subarray of amounts and rates to get
                ⍝ all intermediate values. Quadratic complexity.
                rr←(,\⊣)((1+⊢)⊥⊣)¨(,\⊢)

                ∇ r←amounts rr2 rates;recur
                  ⍝ Second solution
                  ⍝ The recurrence relation (⍺ is the previous value,
                  ⍝ ⍵[1] is the current amount, and ⍵[2] is the
                  ⍝ current rate).
                  recur←{⍵[1]+⍺×1+⍵[2]}
                  ⍝ Because APL evaluates from right to left, we can't
                  ⍝ use Scan directly, as recur is not associative. We
                  ⍝ need something like Haskell's scanl, that will
                  ⍝ accumulate left-to-right and accumulate
                  ⍝ left-to-right. Scan accumulates left-to-right but
                  ⍝ evaluates right-to-left. This solution therefore
                  ⍝ folds for all subarrays, but it is not good in
                  ⍝ terms of performance.
                  r←{⊃⊃f⍨/(⌽⍵↑amounts,¨rates),⊂0 0}¨⍳⍴amounts
                ∇

                ∇ r←cashFlow pv rates
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 5, Task 2 - pv
                  ⍝ Put your code and comments below here
                ∇

                ∇ text←templateFile Merge jsonFile
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 6, Task 1 - Merge
                  ⍝ Put your code and comments below here
                ∇

                ∇ digit←CheckDigit digits
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 7, Tasl 1 - CheckDigit
                  ⍝ Put your code and comments below here
                ∇

                ∇ bits←WriteUPC digits
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 7, Task 2 - WriteUPC
                  ⍝ Put your code and comments below here
                ∇

                ∇ digits←ReadUPC bits
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 7, Task 3 - ReadUPC
                  ⍝ Put your code and comments below here
                ∇

                ∇ parts←Balance nums
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 8, Task 1 - Balance
                  ⍝ Put your code and comments below here
                ∇

                ∇ weights←Weights filename
                  ⍝ 2020 APL Problem Solving Competition Phase II
                  ⍝ Stub function for Problem 9, Task 1 - Weights
                  ⍝ Put your code and comments below here
                ∇

        :EndNamespace
:EndNamespace
