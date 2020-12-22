# Текст задания:
#
# 74. Разработайте скрипт на языке PowerShell, выводящий  на экран названия подкаталогов каталога,
# указанного в качестве первого параметра командной строки, которые изменены в минуту любого дня любого часа,
# номер которой указан во втором аргументе

# -ne - означает если кол-во аргументов не равно 2
# то мы делаем всё что ниже до else
# Подробнее: https://docs.microsoft.com/ru-ru/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.1
# $args.Count - число аргументов
Write-Host "При вводе времени, заместо ':', указывайте '-', программа сама всё замени"

$datePattern = "([1-31]+.+[1-12]+.+[2000-2021])"
$dateTimePattern = "([1-31]+.+[1-12]+.+[2000-2021]\s+[0-23]+-+[1-60]+-+[1-60])\w+"
$timePattern = "([0-23]+-+[1-60]+-+[1-60])"

if ( $args.Count -lt 2 -or $args.Count -gt 3 ) { # ТУТ ПРОСТО ЗАЩИТА ОТ ДУРАКОВ!1!1!
    Write-Host "Количество аргументов введено не верно!" # Вывод сообщений
    Write-Host "Вы ввели"$args.Count", а нужно 2 или 3!"
    throw "Ошибка! Проверьте синтаксис команды!" # Выход из скрипта, для удобства я просто выдаю "исключение"
} else {
    # Присваиваем path к первому аргументу
    $path = $args[0]
    # Присваиваем date к второму аргументу
    if ( $args.Count -eq 2 ) {
        $date = $args[1]
    } elseif ( $args.Count -eq 3 ) {
        $date = $args[1] + " " + $args[2]
    }
    else {
        $date = $args[1]
    }

    if ($date -notmatch $datePattern) {
        if($date -notmatch $dateTimePattern -and $args.Count -eq 3) {
            throw "Ошибка! Введённое значение: " + $date + " не явлется датой и/или дайтой с временем!"
        }
        throw "Ошибка! Введённое значение: " + $date + " не явлется датой и/или дайтой с временем!"
    } else {
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host " "
        Write-Host " Директория:"$path
        Write-Host " Время:"($date -replace '-', ':')
        Write-Host " "
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host " "
        Write-Host " Название Файла    Время последнего редактирования     Время достпа     Дата создания"
        Write-Host " "
        $list = Get-ChildItem $path -Recurse #| Where-Object -FilterScript {
        #($_.CreationTime -like ($date -replace '-', ':'))
        #}
        ForEach ($item in $list) {
            if ($item.CreationTime -match $datePattern) {
                Write-Host "Passed!"
            } else {
                Write-Host "Incorrect!"
            }
            Write-Host ""$item.FullName "     " $item.LastAccessTimeUtc "      " $item.LastWriteTimeUtc "      " $item.CreationTime
        }
        Write-Host " "
        Write-Host "--------------------------------------------------------------------"
    }
}