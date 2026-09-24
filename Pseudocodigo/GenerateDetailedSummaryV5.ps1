$outputPath = "Pseudocodigo\Resumen_Estructurado_v5.md"
"# Resumen Estructurado de Pseudocodigo (v5)" | Out-File -FilePath $outputPath -Encoding UTF8
"" | Out-File -FilePath $outputPath -Append -Encoding UTF8
"## Tabla resumen de acciones" | Out-File -FilePath $outputPath -Append -Encoding UTF8
"" | Out-File -FilePath $outputPath -Append -Encoding UTF8
"| Archivo | Acción | Tiene E/S | Tiene Condicional |" | Out-File -FilePath $outputPath -Append -Encoding UTF8
"|---------|--------|-----------|-------------------|" | Out-File -FilePath $outputPath -Append -Encoding UTF8

$files = Get-ChildItem -Path Pseudocodigo -Filter *.txt | Sort-Object Name
$summaryRows = @()
$details = @()

foreach ($file in $files) {
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
    # description: first non-empty line after accion that is not Ambiente, Procedimiento, etc.
    $description = ""
    $foundAccion = $false
    foreach ($line in $lines) {
        if ($line -match '(?i)^\s*(?:accion|Accion)\s+[^\s;]+') {
            $foundAccion = $true
            continue
        }
        if ($foundAccion) {
            $trim = $line.Trim()
            if ($trim -eq '') { continue }
            if ($trim -match '(?i)^(Ambiente|Procedimiento|Proceso|Algoritmo|Fin_|FinAccion|FinMientras|FinPara|FinSi|FinSegun|\{|})') { break }
            $description = $trim
            break
        }
    }
    # classify proceso lines
    $asignaciones = @()
    $bucles = @()
    $llamadas = @()
    $entradaSalida = @()
    $condicional = @()
    foreach ($line in $procesoBlock -split "`n") {
        $trim = $line.Trim()
        if ($trim -eq '') { continue }
        if ($trim -match '^(?i)LEER\s*\(') { $entradaSalida += $trim; continue }
        if ($trim -match '^(?i)ESCRIBIR\s*\(') { $entradaSalida += $trim; continue }
        if ($trim -match '^(?i)Si\s+.*Entonces') { $condicional += $trim; continue }
        if ($trim -match '^(?i)Segun\s+.*Hacer') { $condicional += $trim; continue }
        if ($trim -match '(?i):=|=$') { $asignaciones += $trim; continue }
        if ($trim -match '^(?i)Mientras\s+|^(?i)Repetir\s+|^(?i)Para\s+') { $bucles += $trim; continue }
        # else treat as llamada a procedimiento u otra
        $llamadas += $trim
    }
    $tieneES = $entradaSalida.Count -gt 0
    $tieneCond = $condicional.Count -gt 0
    $summaryRows += "| $($file.Name) | $accionName | $($tieneES.ToString()) | $($tieneCond.ToString()) |"
    # Build detail section
    $detail = @()
    $detail += "## $($file.Name)"
    $detail += ""
    $detail += "**Acción:** $accionName"
    $detail += ""
    $detail += "[ACCIONES SECUENCIAL]"
    $detail += "ACCION [$accionName] ES;"
    $detail += ""
    $detail += "AMBIENTE"
    if ($ambienteBlock.Trim()) { $detail += $ambienteBlock } else { $detail += "(vacío)" }
    $detail += ""
    $detail += "PROCESO"
    $detail += ""
    $detail += "### Asignaciones"
    if ($asignaciones) { $detail += $asignaciones } else { $detail += "(ninguna)" }
    $detail += ""
    $detail += "### Bucles"
    if ($bucles) { $detail += $bucles } else { $detail += "(ninguna)" }
    $detail += ""
    $detail += "### Llamadas a procedimientos"
    if ($llamadas) { $detail += $llamadas } else { $detail += "(ninguna)" }
    $detail += ""
    $detail += "[ACCIONES DE ENTRADA SALIDA]"
    if ($entradaSalida) { $detail += $entradaSalida } else { $detail += "(ninguna)" }
    $detail += ""
    $detail += "[CONDICIONAL]"
    if ($condicional) { $detail += $condicional } else { $detail += "(ninguna)" }
    $detail += ""
    $detail += "FIN_ACCION."
    $detail += ""
    $detail += "### Ejemplo de uso"
    if ($description) { $detail += $description } else { $detail += "(no se encontró descripción)" }
    $detail += ""
    $detail += "---"
    $detail += ""
    $details += $detail
}
# Write table rows
$summaryRows | Out-File -FilePath $outputPath -Append -Encoding UTF8
"" | Out-File -FilePath $outputPath -Append -Encoding UTF8
# Write details
$details | Out-File -FilePath $outputPath -Append -Encoding UTF8
