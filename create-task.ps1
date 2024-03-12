# Definir la acción que realizará la tarea: ejecutar PowerShell con un script específico
$accion = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File C:\Scripts\MiScript.ps1"

# Definir el desencadenante de la tarea: el primer día de cada mes a las 8:00 AM
$desencadenante = New-ScheduledTaskTrigger -Monthly -DaysOfMonth 1 -At 8am

# Registrar (crear) la tarea programada con un nombre, una acción y un desencadenante
Register-ScheduledTask -TaskName "MiTareaMensual" -Action $accion -Trigger $desencadenante
