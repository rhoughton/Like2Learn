$testcomputers = Get-Content -Path 'C:\scripts\computers.txt'
$exportLocation = 'C:\scripts\pcInventory.csv'

#test connection for each pc
foreach ($computer in $testcomputers) {
    if (Test-Connection -ComputerName $computer -Quiet -count 2) {
        Add-Content -value $computer -path C:\scripts\livePCs.txt
    } else {
        Add-Content -value $computer -path c:\scripts\deadPCs.txt
    }
}
 
$computers = Get-Content -Path 'C:\scripts\livePCs.txt'
for each ($computer in $computers){
    $Bios = Get-WmiObject win32_bios -Computername $computer
    $Hardware = Get-WmiObject win32_computerSystem -ComputerName $computer
    $Sysbuild = Get-WmiObject win32_wmiSetting -ComputerName $computer
    $OS = Get-WmiObject Win32_OperatingSystem -Computername $computer
    $Networks = Get-WmiObject win32_NetworkAdapterConfiguration -ComputerName $computer | where-object {$_.IPEnabled}
    $driveSpace = Get-WmiObject win32_volume -computername $Computer -Filter 'drivetype = 3' | Select-object PScomputername, driveletter, label, @{LABLE='GBfreespace';EXPRESSION ={'{0:N2'} -f($_.freespace/1GB)}} | Where-object {$_.driveletter -match 'C:'}
    $cpu = Get-childitem "\\$computer\c$\Users" | Sort-object LastWriteTime -Descending | Select-Object Name, LastWriteTime
    $totalMemory = [math]::round($Hardware. TotalPhysicalMemory/1024/1024/1024, 2)
    $lastBoot = $OS.ConvertToDateTime($OS.LastBootUpTime)

    $IPAddress = $Networks.IpAddress[0]
    $MACAddress = $Networks.MACAddress
    $systemBios = $Bios.serialnumber

    OutputObj = New-Object -Type PSObject
    OutputObj | Add-Member -MemberType NoteProperty -Name Computername -value $computer.ToUpper()
    OutputObj | Add-Member -MemberType NoteProperty -Name Manufacturer -Value $Hardware.Manufacturer
    OutputObj | Add-Member -MemberType NoteProperty -Name Model -Value $Hardware.Model
    OutputObj | Add-Member -MemberType NoteProperty -Name Processor_Type -value $cpu.Name
    OutputObj | Add-Member -MemberType NoteProperty -Name System_Type -value $Hardware.SystemType 
    OutputObj | Add-Member -MemberType NoteProperty -Name Operating_system_version -value $OS.Caption 
    OutputObj | Add-Member -MemberType NoteProperty -Name Operating_system_BuildVersion -value $SysBuild.Buildversion 
    OutputObj | Add-Member -MemberType NoteProperty -Name Serial_Number -value $systemBios
    OutputObj | Add-Member -MemberType NoteProperty -Name IP_Address -value $IPAddress
    OutputObj | Add-Member -MemberType NoteProperty -Name MAC_Address -value $MACAddress
    OutputObj | Add-Member -MemberType NoteProperty -Name Last_User -value $username.Name 
    OutputObj | Add-Member -MemberType NoteProperty -Name User_Last_Login -value $username.LastWriteTime 
    OutputObj | Add-Member -MemberType NoteProperty -Name C:_FreeSpace_GB -value $driveSpace.GBfreespace
    OutputObj | Add-Member -MemberType NoteProperty -Name Total_Memory_GB -value $totalMemory 
    OutputObj | Add-Member -MemberType NoteProperty -Name Last_ReBoot -value $lastboot 
    $OutputObj | Export-Csv $exportLocation -Append -NoTypeInformation
}