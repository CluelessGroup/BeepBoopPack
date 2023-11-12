$jsonFilePath = "instance.json"
$jsonContent = Get-Content -Raw -Path $jsonFilePath | ConvertFrom-Json

## check if java string is "" and if so, set it to the default java Path
if ($jsonContent.java -eq "") {
    $jsonContent.java = "java"
}
else {
    $jsonContent.java = $jsonContent.java
}

Invoke-Expression -Command "$java -jar .\packwiz-installer-bootstrap.jar https://cluelessgroup.github.io/BeepBoopPack/pack.toml"
