$outputPath = "Pseudocodigo\Resumen_Estructurado_v2.md"
"# Resumen Estructurado de Pseudocodigo (v2)" | Out-File -FilePath $outputPath -Encoding UTF8

Get-ChildItem -Path Pseudocodigo -Filter *.txt | ForEach-Object {
    $file = $_
    $content = Get-Content -LiteralPath $file.FullName
    $text = $content -join "`n"
    # extract Accion name (case-insensitive)
    $accionName = "DESCONOCIDO"
    if ($text -match '(?ims)^\s*accion\s+(\w+)\s+ES;') {
        $accionName = $matches[1]
    } elseif ($text -match '(?ims)^\s*Accion\s+(\w+)\s+ES;') {
        $accionName = $matches[1]
    }
    # extract Ambiente block (between Ambiente and Proceso/Algoritmo)
    $ambienteBlock = ""
    if ($text -match '(?ims)^\s*Ambiente\s*(.*?)(?=^\s*(Proceso|Algoritmo)\b)') {
        $ambienteBlock = $matches[1].Trim()
    }
    # extract Proceso/Algoritmo block (until FinAccion)
    $procesoBlock = ""
    if ($text -match '(?ims)^\s*(Proceso|Algoritmo)\s*(.*?)(?=^\s*FinAccion\b)') {
        $procesoBlock = $matches[2].Trim()
    }
    # split procesoBlock into lines
    $lines = $procesoBlock -split "`n"
    $secuencial = @()
    $entradaSalida = @()
    $condicional = @()
    foreach ($line in $lines) {
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
        } elseif ($trim -match '(?i):=|=$') { # assignment
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
    if ($ambienteBlock) {
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
