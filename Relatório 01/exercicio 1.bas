Dim peso As Integer
Dim agua1 As Integer
Dim agua2 As Integer
Dim meta As Integer

input peso
meta = peso * (35 / 1000)
input agua1

agua2 = agua1 / 1000

if agua2 >= meta Then
    Print "Meta Atingida!"
else
    Print "Meta nao atingida"
end if
Sleep
