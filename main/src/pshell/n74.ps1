# -ne - �������� ���� ���-�� ���������� �� ����� 2
# �� �� ������ �� ��� ���� �� else
# ���������: https://docs.microsoft.com/ru-ru/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.1
# $args.Count - ����� ����������
if ( $args.Count -ne 2 ) { # ��� ������ ������ �� �������!1!1!
    Write-Host "���������� ���������� ������� �� �����!" # ����� ���������
    Write-Host "�� �����"$args.Count", � ����� 2 ��� 3!"
    throw "������! ��������� ��������� �������!"; # ����� �� �������, ��� �������� � ������ ����� "����������"
} else {
    # ����������� filePath � ������� ���������
    $path = $args[0]
    # ����������� date � ������� ���������
    if ( $args.Count -eq 2 ) {
        $date = $args[1]
    } elseif ( $args.Count -eq 3 ) {
        $date = $args[1] + " " + $args[2]
    }
    else {
        $date = $args[1]
    }
    #Get-ChildItem -Path $path -Recurse -Include *.exe | where -FilterScript {
    #   ($_.LastWriteTime -gt $date) -and ($_.Length -ge 1kb) -and ($_.Length -le 10mb)
    #}
    Write-Host " "
    Write-Host "����������:"$path
    Write-Host " "
    Write-Host "--------------------------------------------------------------------"
    Write-Host " "
    Write-Host ""
    $list = Get-ChildItem $path -Recurse | Where-Object -FilterScript {
        ($_.LastAccessTime -gt $date)
    }
    Write-Host " "
    ForEach ($item in $list) {
        Write-Host ""$item.FullName "     " $item.LastWriteTime "      " $item.LastAccessTime
    }
    Write-Host " "
    Write-Host "--------------------------------------------------------------------"
}