# Разработайте скрипт на языке PowerShell, вычисляющий, сколько первых подряд идущих строк файла,
# имя которого передано в качестве первого параметра командной строки, начинается с #.

if ( $args.Count -lt 1 ) { # ТУТ ПРОСТО ЗАЩИТА ОТ ДУРАКОВ!1!1!
    Write-Host "Количество аргументов введено не верно!" # Вывод сообщений
    Write-Host "Вы ввели"$args.Count", а нужно 1!"
    throw "Ошибка! Проверьте синтаксис команды!" # Выход из скрипта, для удобства я просто выдаю "исключение"
} else {
    $path = $args[0]
    $list = Get-Content -Path $path

    $rCounter = 0
    $counter = 0
    ForEach ($i in $list) {
        if($i.StartsWith("#")) {
            if($counter -eq 0) {
                if ($rCounter -eq 0) {
                    $rCounter = $rCounter + 1
                }
            }
            Write-Host $counter". Line, starts with #, so:"$i
        } else {
            Write-Host "Skipping line..."
        }
        $counter = $counter + 1
        Write-Host "First lines which start from #:"$rCounter
    }
}