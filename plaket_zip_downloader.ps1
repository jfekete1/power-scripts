telnet 195.228.10.196 443



######################################################################################
# 
# Plaket Adatb�zis ment�s let�lt� script
#
# K�sz�tette: Fekete J�zsef
# El�felt�telek:
# A script m�k�d�s�hez sz�ks�ges powershell script futtat�si jog!
# Ezt be�ll�thatjuk a jelenleg bel�pett felhaszn�l� sz�m�ra.
# pl.
#    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# 
# A let�lt�s c�lhely�t is �rdemes be�ll�tani, mert jelenleg a C:\-re szedi.
# pl.
#    $destination = "C:\Users\valaki\Downloads\$zipname"
#
######################################################################################


$date = (Get-Date).AddDays(-(get-date).dayofWeek.value__)
$datestr = $date.ToString('yyyy-MM-dd')
$zipname = "plaket_BASE_$datestr.zip"
$destination = "C:\$zipname"
$url = "https://organ.zalaszam.hu/adattrezor/plaket/$zipname"
$username = 'plaket'
$password = 'asdasdasd'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$pair = "$($username):$($password)"
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($pair))
$basicAuthValue = "Basic $encodedCreds"
$authHeader = @{
Authorization = $basicAuthValue
}

Invoke-WebRequest -uri $url -Headers $authHeader -UseBasicParsing -ErrorAction Stop -Verbose -OutFile $destination
