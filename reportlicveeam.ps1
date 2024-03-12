
#Importar Modulo de Veeam Backup
Add-PSSnapin VeeamPSSnapIn -ErrorAction SilentlyContinue
#Crear Directorio
New-Item "C:\licencesReport" -Type Directory
#variable con la fecha de la ejecucion del reporte
$date = Get-Date -UFormat "%m%Y "

#pacht de la creacion del reporte
$pathreport = "C:\licencesReport\Reporte_$date.pdf"
#Generar reporte  de licencia de Veeam Backup 
Generate-VBRLicenseUsageReport -Path $pathreport -Type Pdf
#Variable Asunto con la fecha
$asunto = "Reporte de Licencia "  + $date
#Envio de Correo Electronico
Send-MailMessage -From 'noreply@iclos.com.uy' -To 'mguerra@at.com.uy' -Subject $asunto -Body 'Reporte de licencia' -SmtpServer 'mail.megapharma.com' -Port '25' -Attachments  $pathreport
