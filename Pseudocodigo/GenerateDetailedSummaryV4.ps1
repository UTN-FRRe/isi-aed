$outputPath = "Pseudocodigo\Resumen_Estructurado_v4.md"
"# Resumen Estructurado de Pseudocodigo (v4)" | Out-File -FilePath $outputPath -Encoding UTF8

Get-ChildItem -Path Pseudocodigo -Filter *.txt | ForEach-Object {
    $file = $_
    $lines = Get-Content -LiteralPath $file.FullName
    # join for regex search
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
        # start scanning after accion line
        $j = $accionIdx + 1
        # skip blank lines
        while ($j -lt $lines.Count -and $lines[$j].Trim() -eq '') { $j++ }
        # collect until we hit a line that starts with Procedimiento, Proceso, Algoritmo (case-insensitive)
        while ($j -lt $lines.Count -and -not ($lines[$j] -match '(?i)^\s*(Procedimiento|Proceso|Algoritmo)')) {
            $ambienteLines += $lines[$j]
            $j++
        }
        # the rest is proceso lines
        while ($j -lt $lines.Count) {
            $procesoLines += $lines[$j]
            $j++
        }
    } else {
        # fallback: try to find Ambiente keyword
        $ambienteStart = -1
        $ambienteEnd = -1
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
            $ambienteEnd = $j - 1
            # proceso lines from j onward
            for ($k = $j; $k -lt $lines.Count; $k++) {
                $procesoLines += $lines[$k]
            }
        } else {
            # no ambiente, treat all lines as proceso
            $procesoLines = $lines
        }
    }
    $ambienteBlock = $ambienteLines -join "`n"
    $procesoBlock = $procesoLines -join "`n"
    # split procesoBlock into lines for classification
    $procLines = $procesoBlock -split "`n"
    $secuencial = @()
    $entradaSalida = @()
    $condicional = @()
    foreach ($line in $procLines) {
        $trim = $line.Trim()
        if ($trim -eq '') { continue }
        if ($trim -match '^(?i)LEER\s*\(') {
            $entradaSalida += $trim
        } elseif ($trim -match '^(?i)ESCRIBIR\s*\(') {
            $entradaSalida += $trim
        } elseif ($trim -match '^(?i)Si\s+.*Entonces') {
            $condicional += $trim
        } elseif ($trim -match '^(?i)Segun\s+.*Hacer') {
            $condicional += $trim
        } elseif ($trim -match '(?i):=|=$') {
            $secuencial += $trim
        } elseif ($trim -match '^(?i)Mientras\s+|^(?i)Repetir\s+|^(?i)Para\s+') {
            $secuencial += $trim
        } else {
            $secuencial += $trim
        }
    }
    # Append to markdown
    "## $($file.Name)" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "" | Out-File -FilePath $outputPath -Append -Encoding UTF8
    "**Acción:** $accionName" | Out-File -FilePath $outputPath -Append -Encoding UTF8
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
