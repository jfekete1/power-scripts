# Import the required .NET assemblies
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing') | Out-Null

# Create the form and set its properties
$form = New-Object System.Windows.Forms.Form
$form.Text = 'My GUI Application'
$form.Size = New-Object System.Drawing.Size(300, 200)

# Create the input field and set its properties
$inputField = New-Object System.Windows.Forms.TextBox
$inputField.Location = New-Object System.Drawing.Size(10, 10)
$inputField.Size = New-Object System.Drawing.Size(260, 20)

# Create the button and set its properties
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size(10, 40)
$button.Size = New-Object System.Drawing.Size(75, 23)
$button.Text = 'Click me'

# Add the input field and button to the form
$form.Controls.Add($inputField)
$form.Controls.Add($button)

# Show the form
$form.ShowDialog()
