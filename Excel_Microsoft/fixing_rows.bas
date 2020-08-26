Sub FixRow_12_105()
'
' FixRow_12_105 Macro
'
' Keyboard Shortcut: Ctrl+Shift+F
'
    Cells.Select
    Selection.RowHeight = 12
    Rows("1:1").Select
    Selection.RowHeight = 105
 Dim i As Long

    For i = 4000 To 2 Step -1
        If IsEmpty(Range("A" & i)) Then Rows([i]).EntireRow.Delete
    Next i
End Sub
