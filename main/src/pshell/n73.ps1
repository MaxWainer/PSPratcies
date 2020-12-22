#!/usr/bin/python

if ( $args.Count -lt 2 -or $args.Count -gt 3 ) { # ТУТ ПРОСТО ЗАЩИТА ОТ ДУРАКОВ!1!1!
    Write-Host "Количество аргументов введено не верно!" # Вывод сообщений
    Write-Host "Вы ввели"$args.Count", а нужно 2 или 3!"
    throw "Ошибка! Проверьте синтаксис команды!" # Выход из скрипта, для удобства я просто выдаю "исключение"
} else {
    $path = $args[0]

    $collect = Get-ChildItem $path -Recurse | where {
        $_.basename -match '(#!/usr/bin/python)\Z'
    } | select name, length, creationtime, attributes | tee list.txt

    for ($item in $collect) {
        Write-Host $item.Name
    }


}






#>