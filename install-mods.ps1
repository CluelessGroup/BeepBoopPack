$jsonFilePath = "instance.json"
$jsonContent = Get-Content -Raw -Path $jsonFilePath | ConvertFrom-Json

$java = $jsonContent.java

Invoke-Expression -Command "$java -jar .\packwiz-installer-bootstrap.jar https://cluelessgroup.github.io/BeepBoopPack/pack.toml"