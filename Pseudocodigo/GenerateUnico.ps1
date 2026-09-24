$outputPath = "Pseudocodigo\Resumen_Unico.md"
"# Resumen Único de Pseudocodigo" | Out-File -FilePath $outputPath -Encoding UTF8

Get-ChildItem -Path Pseudocodigo -Filter *.txt | Sort-Object Name | ForEach-Object {
    $file = $_
    $lines = Get-Content -LiteralPath $file.FullName
    $text = $lines -join "`n"
    # extract Accion name
    $accionName = "DESCONOCIDO"
    if ($text -match '(?ims)^\s*(?:accion|Accion)\s+([^\s;]+)') {
        $accionName = $matches[1]
    }
    # Find index of line with accion
    $accionIdx = -1
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '(?i)^\s*(?:accion|Accion)\s+[^\s;]+') {
            $accionIdx = $i
            break
        }
    }
    $ambienteLines = @()
    $procesoLines = @()
    if ($accionIdx -ge 0) {
        $j = $accionIdx + 1
        while ($j -lt $lines.Count -and $lines[$j].Trim() -eq '') { $j++ }
        while ($j -lt $lines.Count -and -not ($lines[$j] -match '(?i)^\s*(Procedimiento|Proceso|Algoritmo)')) {
            $ambienteLines += $lines[$j]
            $j++
        }
        while ($j -lt $lines.Count) {
            $procesoLines += $lines[$j]
            $j++
        }
    } else {
        $ambienteStart = -1
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match '(?i)^\s*Ambiente\s*') {
                $ambienteStart = $i
                break
            }
        }
        if ($ambienteStart -ge 0) {
            $j = $ambienteStart + 1
            while ($j -lt $lines.Count -and -not ($lines[$j] -match '(?i)^\s*(Proceso|Algoritmo)\b')) {
                $ambienteLines += $lines[$j]
                $j++
            }
            for ($k = $j; $k -lt $lines.Count; $k++) {
                $procesoLines += $lines[$k]
            }
        } else {
            $procesoLines = $lines
        }
    }
    $ambienteBlock = $ambienteLines -join "`n"
    $procesoBlock = $procesoLines -join "`n"
    # classify proceso lines
    $entradaSalida = @()
    $condicional = @()
    foreach ($line in $procesoBlock -split "`n") {
        $trim = $line.Trim()
        if ($trim -eq '') { continue }
        if ($trim -match '^(?i)LEER\s*\(') { $entradaSalida += $trim }
        elseif ($trim -match '^(?i)ESCRIBIR\s*\(') { $entradaSalida += $trim }
        elseif ($trim -match '^(?i)Si\s+.*Entonces') { $condicional += $trim }
        elseif ($trim -match '^(?i)Segun\s+.*Hacer') { $condicional += $trim }
    }
    # Write section for this file
    "## $($file.Name)" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "[ACCIONES SECUENCIAL]" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "ACCION [$accionName] ES;" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "AMBIENTE" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    if ($ambienteBlock.Trim()) {
        $ambienteBlock | Out-File -FilePath $outputPath -Append -Encoding UTF8
    } else {
        "(vacío)" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    }
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "PROCESO" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "[ACCIONES DE ENTRADA SALIDA]" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    if ($entradaSalida) {
        $entradaSalida | Out-File -FilePath $outputPath -Append -Encoding UTF8
    } else {
        "(ninguna)" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    }
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "[CONDICIONAL]" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    if ($condicional) {
        $condicional | Out-File -FilePath $outputPath -Append -Encoding UTF8
    } else {
        "(ninguna)" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    }
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "FIN_ACCION." | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "---" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
}
