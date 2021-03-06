# Restarts specific printjob on specific server.
# Checks next printjob in queue and restarts printjob if status contains Error.

$Printer = "Printer name"
$Computer = "Server/computer name"

$PrintJobs = Get-PrintJob -PrinterName $Printer -ComputerName $Computer
 
If ($PrintJobs -ne  $null ){
    $PrintID = $PrintJobs[0].Id

    $GetLastPJ = Get-PrintJob -PrinterName $Printer -ID $PrintID
    $GetLastPJ.jobstatus

    if ($GetLastPJ.jobstatus -like "*Error*"){
        Restart-PrintJob -PrinterName $Printer -ID $PrintID  -ComputerName $Computer
        Write-Host "Error detected, restarting job"
        }
    Else {
        Write-Host "No errors detected"
        }
}
Else
    {
    Write-Host "No jobs active"
    }
    
