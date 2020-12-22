# ����� �������:
#
# 74. ������������ ������ �� ����� PowerShell, ���������  �� ����� �������� ������������ ��������,
# ���������� � �������� ������� ��������� ��������� ������, ������� �������� � ������ ������ ��� ������ ����,
# ����� ������� ������ �� ������ ���������

# -ne - �������� ���� ���-�� ���������� �� ����� 2
# �� �� ������ �� ��� ���� �� else
# ���������: https://docs.microsoft.com/ru-ru/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.1
# $args.Count - ����� ����������
Write-Host "��� ����� �������, ������� ':', ���������� '-', ��������� ���� �� ������"

$datePattern = "([1-31]+.+[1-12]+.+[2000-2021])"
$dateTimePattern = "([1-31]+.+[1-12]+.+[2000-2021]\s+[0-23]+-+[1-60]+-+[1-60])\w+"
$timePattern = "([0-23]+-+[1-60]+-+[1-60])"

if ( $args.Count -lt 2 -or $args.Count -gt 3 ) { # ��� ������ ������ �� �������!1!1!
    Write-Host "���������� ���������� ������� �� �����!" # ����� ���������
    Write-Host "�� �����"$args.Count", � ����� 2 ��� 3!"
    throw "������! ��������� ��������� �������!" # ����� �� �������, ��� �������� � ������ ����� "����������"
} else {
    # ����������� path � ������� ���������
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

    if ($date -notmatch $datePattern) {
        if($date -notmatch $dateTimePattern -and $args.Count -eq 3) {
            throw "������! �������� ��������: " + $date + " �� ������� ����� �/��� ������ � ��������!"
        }
        throw "������! �������� ��������: " + $date + " �� ������� ����� �/��� ������ � ��������!"
    } else {
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host " "
        Write-Host " ����������:"$path
        Write-Host " �����:"($date -replace '-', ':')
        Write-Host " "
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host " "
        Write-Host " �������� �����    ����� ���������� ��������������     ����� ������     ���� ��������"
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