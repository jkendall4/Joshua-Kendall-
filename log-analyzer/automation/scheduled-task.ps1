# Scheduled Task Automation Example
$action = New-ScheduledTaskAction `
-Execute "powershell.exe" `
-Argument "-File C:\Scripts\LogAnalyzer.ps1"

$trigger = New-ScheduledTaskTrigger -Daily -At 9am

Register-ScheduledTask `
-TaskName "Log Analyzer" `
-Action $action `
-Trigger $trigger
