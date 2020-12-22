Get-ChildItem $path -Recurse | Where-Object -FilterScript {
        ($_. -gt $date)
}