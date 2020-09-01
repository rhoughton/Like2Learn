sub wb2wb
'both workbooks need to be open, check for correct file extension
'workbooks don't need to be macro enabled!

Workbooks("myCopy.xlsx").Worksheets("Export").Range("A1:D9").Copy 
    Workbooks("myOtherCopy.xlsx").Worksheets(4).Range("A1").PasteSpecial Paste:xlPasteValues

