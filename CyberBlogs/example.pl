    #!/usr/bin/perl -w  
    use strict;
    use Spreadsheet::WriteExcel;
    
    my $workbook  = Spreadsheet::WriteExcel->new('bigfile.xls');
    my $worksheet = $workbook->add_worksheet();
    
    $worksheet->set_column(0, 50, 18);
    
    for my $col (0 .. 50) {
        for my $row (0 .. 5) {
            $worksheet->write($row, $col, "Row: $row Col: $col");
        }
    }
    
    __END__