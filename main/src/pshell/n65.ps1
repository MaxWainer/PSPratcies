# ������������ ������ �� ����� PowerShell, �����������, ������� ������ ������ ������ ����� �����,
# ��� �������� �������� � �������� ������� ��������� ��������� ������, ���������� � #.

if ( $args.Count -lt 1 ) { # ��� ������ ������ �� �������!1!1!
    Write-Host "���������� ���������� ������� �� �����!" # ����� ���������
    Write-Host "�� �����"$args.Count", � ����� 1!"
    throw "������! ��������� ��������� �������!" # ����� �� �������, ��� �������� � ������ ����� "����������"
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