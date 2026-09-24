$md = '# Resumen detallado de acciones en Pseudocodigo' + "`n`n"
Get-ChildItem -Path Pseudocodigo -Filter *.txt | ForEach-Object {
    $content = Get-Content -LiteralPath $_.FullName
    $actionLine = $content | Where-Object { $_ -match '^\s*Accion\s+' } | Select-Object -First 1
    if(-not $actionLine){ return }
    $name = $actionLine -replace '^\s*Accion\s+(\w+)\s+ES;.*', '$1'
    # get description: first non-empty line after Accion that is not Ambiente, Algoritmo, etc.
    $description = ''
    $found = $false
    foreach($line in $content){
        if($line -match '^\s*Accion\s+'){
            $found = $true
            continue
        }
        if($found){
            $trim = $line.Trim()
            if($trim -eq ''){ continue }
            if($trim -match '^(Ambiente|Algoritmo|Proceso|Procedimiento|Funcion|Fin_|FinAccion|FinMientras|FinPara|FinSi|FinSegun|\{|})'){ break }
            $description = $trim
            break
        }
    }
    $md += "## $($_.Name)" + "`n"
    $md += "**Acción:** $name  " + "`n"
    if($description){ $md += "**Descripción breve:** $description  " + "`n" }
    $md += "`n"
}
$md | Set-Content -Path Pseudocodigo\Resumen_Detallado.md
