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
    $isStarting = "false"
    ForEach ($i in $list) {
        if($i.StartsWith("#")) {
            if($counter -eq 0) {
                $isStarting = "true"
            }
            if ($isStarting -eq "true") {
                $rCounter = $rCounter + 1
            }
        } else {
            $isStarting = "false"
        }
        $counter = $counter + 1
    }
    Write-Host "Всего строк в начале файла, которые начинаются на '#':"$rCounter
}