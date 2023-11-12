$jsonFilePath = "instance.json"
$jsonContent = Get-Content -Raw -Path $jsonFilePath | ConvertFrom-Json

$java = $jsonContent.java

Invoke-Expression -Command "$java -jar .\packwiz-installer-bootstrap.jar http://127.0.0.1:8080/pack.toml"