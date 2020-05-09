:Namespace Phase1
        ⍝ 1: Let's Split!
        split←(0>⊣)⌽((⊂↑),(⊂↓))
        ⍝ 2: Character Building
        characters←{(~⍵∊127+⍳64)⊂⍵}
        ⍝ 3: Excel-lent Columns
        columns←26⊥64-⍨⎕UCS
        ⍝ 4: Take a Leap
        leap←1 3∊⍨(0+.=400 100 4∘.|⊢)
        ⍝ 5: Stepping in the Proper Direction
        stepping←{(⊃⍵)+(-×-/⍵)×0,⍳|-/⍵}
        ⍝ 6: Please Move to the Front
        movefront←{⍵[⍋⍺≠⍵]}
        ⍝ 7: See You in a Bit
        bits←{f←⍸∘⌽(2∘⊥⍣¯1)⋄∧/(f⍺)∊f⍵}
        ⍝ 8: Zigzag Numbers
        zigzag←∧/2=∘|2-/∘×2-/(10∘⊥⍣¯1)
        ⍝ 9: Rise and Fall
        risefall←{∧/(⍳∘≢≡⍋)¨(⊂((⊢⍳⌈/)↑⊢),⍵),⊂⌽((⊢⍳⌈/)↓⊢),⍵}
:EndNamespace
