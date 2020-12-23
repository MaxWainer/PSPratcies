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
    Write-Host "����� ����� � ������ �����, ������� ���������� �� '#':"$rCounter
}