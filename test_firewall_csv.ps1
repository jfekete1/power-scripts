# Import the CSV file
$data = Import-Csv -Path "fosok.csv" -Delimiter ";"

# Iterate through each row in the CSV file
foreach ($row in $data) {
    # Get the current date and time
    $dateTime = Get-Date
    
    # Write the date and time to the console
    Write-Output "Running Test-NetConnection at $dateTime"
	$dateTime | Out-File -FilePath "test_firewall_csv.log" -Append

    # Get the IP address and port number from the row
    $ipAddress = $row.ipAddress
    $port = $row.port

    # Run the Test-NetConnection function on the IP address and port number
    Test-NetConnection -ComputerName $ipAddress -Port $port | Out-File -FilePath "test_firewall_csv.log" -Append
}
