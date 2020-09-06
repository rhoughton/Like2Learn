sub wb2wb
'both workbooks need to be open, check for correct file extension
'workbooks don't need to be macro enabled!

Workbooks("myCopy.xlsx").Worksheets("ExportSheet").Range("A1:D9").Copy 
    Workbooks("myOtherCopy.xlsx").Worksheets(4).Range("A1").PasteSpecial Paste:xlPasteValues

'in order to paste below the last cell you need:
Dim wsC As Worksheet
Dim wsD As Worksheet
Dim cLastRow As Long    
Dim dLastRow As Long

    Set wsC = Workbooks("myCopy.xlsx").Worksheets("ExportSheet")
    Set wsD = Workbooks("myOtherCopy.xlsx").Worksheets(4)
'count the rows in your origin doc using column A...
'find the last used row in the copy range based on data in column A
cLastRow = wsC.Cells(wsC.Rows.Count, "A").End(xlUp).Row
'I don't know why we need to do the above?

'now find the first blank row in the destination sheet, again based on what you see in column A
'the offset moves down 1 row!
dLastRow = wsD.Cells(wsD.Rows.Count, "A").End(xlUp).Offset(1).Row 

'now do all the logic
'just to make code more readable "A space followed by an underscore tells VBA that the current statement isn't finished yet but continues on the next line"
'however, an underscore in front of a var usually indicates that var is private to that class, also indicates it's a local variable
wsC.Range("A1:D" & cLastRow).Copy _
    wsD.Range("A" & dLastRow)
'you can f8 to step through in excel's vba editor

'to find duplicate values in the same workbook from different sheets you can:
'Conditional Formatting > New Rule > "use a formulat to determine which cells to format"
=countif('worksheetName'!$A$2:$A$18)>0
'now this will highlight all the cells "in front of you" on the current sheet you are on
'choose color from 'preview' box
