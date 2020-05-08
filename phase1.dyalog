 ⍝ 1: Let's Split!
 {(0>⍺)⌽(⊂⍺↑⍵),⊂⍺↓⍵}
 ((0>⊣)⌽((⊂↑),(⊂↓)))
 ⍝ 2: Character Building
 {(~⍵∊127+⍳64)⊂⍵}
 ⍝ 3: Excel-lent Columns
 (26⊥64-⍨⎕UCS)
 ⍝ 6: Please Move to the Front
 {⍵[⍋⍺≠⍵]}
 ⍝ 7: See You in a Bit
 {f←⍸∘⌽(2∘⊥⍣¯1)⋄∧/(f⍺)∊f⍵}
