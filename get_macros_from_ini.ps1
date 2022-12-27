# Check if a section name was provided as a command line argument
if ($args.Count -eq 0) {
  Write-Error 'A section name must be provided as a command line argument'
  exit 1
}

# Get the section name from the command line argument
$sectionName = $args[0]

# Define the path to the INI file
$iniFile = 'C:\Users\feketej\Documents\MobaXterm_Portable_v20.5\MobaXterm.ini'

# Define the path to the output file
$outputFile = "C:\Users\feketej\Documents\MobaXterm_Portable_v20.5\$sectionName.txt"

# Read the INI file into a variable as a single string
$iniContents = Get-Content $iniFile -Raw

# Split the INI file into an array of lines
$iniLines = $iniContents -split "`n"

# Initialize an empty array to hold the lines of the specified section
$sectionLines = @()

# Flag to indicate whether we are currently in the specified section
$inSection = $false

# Iterate through each line of the INI file
foreach ($line in $iniLines) {
  # Check if this line starts the specified section
  if ($line -match "^\[$sectionName\]") {
    # Set the flag to indicate that we are in the specified section
    $inSection = $true
  }

  # Check if this line ends the specified section or is a section heading for a different section
  elseif ($line -match '^\[.+\]') {
    # Set the flag to indicate that we are no longer in the specified section
    $inSection = $false
  }

  # If we are in the specified section, add this line to the array of lines
  if ($inSection) {
    $sectionLines += $line
  }
}

# Join the lines of the specified section into a single string
$section = $sectionLines -join "`n"

# Write the specified section to the output file
$section | Out-File $outputFile

# Print the specified section to the console
$section
