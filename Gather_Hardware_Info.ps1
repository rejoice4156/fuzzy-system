# Gather system hardware information
$systemInfo = @{
    ComputerName      = $env:COMPUTERNAME
    OS                = (Get-CimInstance -ClassName Win32_OperatingSystem).Caption
    Processor         = (Get-CimInstance -ClassName Win32_Processor).Name
    Cores             = (Get-CimInstance -ClassName Win32_Processor).NumberOfCores
    LogicalProcessors = (Get-CimInstance -ClassName Win32_Processor).NumberOfLogicalProcessors
    RAM               = "{0:N2} GB" -f ((Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB)
    GPU               = (Get-CimInstance -ClassName Win32_VideoController).Name -join ", "
    DiskDrives        = (Get-CimInstance -ClassName Win32_DiskDrive | ForEach-Object { $_.Model }) -join ", "
}

# Display the information
$systemInfo | ForEach-Object {
    Write-Output "$($_.Key): $($_.Value)"
}

# Optionally save to a file
$systemInfo | Out-File -FilePath "Hardware_Info_Windows.txt" -Encoding utf8

