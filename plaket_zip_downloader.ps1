telnet 195.228.10.196 443



######################################################################################
# 
# Plaket Adatbázis mentés letöltõ script
#
# Készítette: Fekete József
# Elõfeltételek:
# A script mûködéséhez szükséges powershell script futtatási jog!
# Ezt beállíthatjuk a jelenleg belépett felhasználó számára.
# pl.
#    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# 
# A letöltés célhelyét is érdemes beállítani, mert jelenleg a C:\-re szedi.
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
