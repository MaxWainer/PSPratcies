# -ne - означает если кол-во аргументов не равно 2
# то мы делаем всё что ниже до else
# Подробнее: https://docs.microsoft.com/ru-ru/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.1
# $args.Count - число аргументов
if ( $args.Count -ne 3 ) { # ТУТ ПРОСТО ЗАЩИТА ОТ ДУРАКОВ!1!1!
    Write-Host "Количество аргументов введено не верно!" # Вывод сообщений
    Write-Host "Вы ввели"$args.Count", а нужно 2 или 3!"
    throw "Ошибка! Проверьте синтаксис команды!" # Выход из скрипта, для удобства я просто выдаю "исключение"
} else {
    # Присваиваем filePath к первому аргументу
    $path = $args[0]
    # Присваиваем date к второму аргументу
    if ( $args.Count -eq 2 ) {
        $date = $args[1]
    } else {
        $date = $args[1] + " " + $args[2]
    }
    #Get-ChildItem -Path $path -Recurse -Include *.exe | where -FilterScript {
    #   ($_.LastWriteTime -gt $date) -and ($_.Length -ge 1kb) -and ($_.Length -le 10mb)
    #}
    Write-Host " "
    Write-Host "Директория:"$path
    Write-Host " "
    Write-Host "-------------------------------------------------------------------"
    Write-Host " "
    Write-Host " Название Файла    Время последнего редактирования     Время достпа"
    $list = Get-ChildItem $path -Recurse | Where-Object -FilterScript {
        ($_.LastAccessTime -gt $date)
    }
    Write-Host " "
    ForEach ($item in $list) {
        Write-Host ""$item.FullName "     " $item.LastWriteTime "      " $item.LastAccessTime
    }
    Write-Host " "
    Write-Host "-------------------------------------------------------------------"
    Write-Host "Current time:"System.DateTime.ToString
}