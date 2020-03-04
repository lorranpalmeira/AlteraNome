$dir = "c:/temp/"

$de = "tst1"
$para = "tst2"


<#
   Altera o nome dos diretórios e subDiretórios se der match no Nome
#>

Get-ChildItem $dir -Recurse -Filter *$de* | Rename-Item -NewName { $_.name -replace $de, $para} -verbose



<#
   Altera o conteúdo do arquivos se der match no Nome 
   Não esquecer de alterar a extensão do arquivo abaixo
#>

Get-ChildItem $dir'*.txt' -Recurse | ForEach {
     (Get-Content $_ | ForEach  { $_ -replace $de, $para }) |
     Set-Content $_
}
