program DKR5;

uses crt, system;

var
  input: file of char;
  output: text;
  arr: array [1..10000] of char;
  start, start1, stop, stop1, n: integer;
  s: string;


function kos: integer;
var
  i, j: integer;
  a: char;
begin
  for i := 1 to n - 1 do
    for j := 1 to n - i do
      if arr[j] > arr[j + 1] then begin
        a := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := a
      end;
end;

function th: integer;
var
  i, j: integer;
  a: char;
begin
  for i := 1 to n - 1 do
    for j := 1 to n - i do
      if arr[j] < arr[j + 1] then begin
        a := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := a
      end;
end;

procedure yep(a, c: integer);
var
    x, j, i, n1, n2: integer;
    rez: array[1..1000] of char;
begin
    if c <= a then 
        exit 
    else 
    begin
        x := (a + c) div 2;
        yep(a, x);
        yep(x + 1, c);
        n1 := a;
        n2 := x + 1;
        for i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (arr[n1] < arr[n2])) then
            begin
                rez[i] := arr[n1];
                inc(n1);
            end 
            else 
            begin
                rez[i] := arr[n2];
                inc(n2);
            end;
        end;
        for j := a to c do
            arr[j] := rez[j];
    end; 
end;

procedure dz(a, c: integer);
var
    x, j, i, n1, n2: integer;
    rez: array[1..1000] of char;
begin
    if c <= a then 
        exit 
    else 
    begin
        x := (a + c) div 2;
        dz(a, x);
        dz(x + 1, c);
        n1 := a;
        n2 := x + 1;
        for i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (arr[n1] > arr[n2])) then
            begin
                rez[i] := arr[n1];
                inc(n1);
            end 
            else 
            begin
                rez[i] := arr[n2];
                inc(n2);
            end;
        end;
        for j := a to c do
            arr[j] := rez[j];
    end; 
end;

begin
  assign(input, 'C:\OAIP\DKR5\text1.txt'); assign(output, 'C:\OAIP\DKR5\text2.txt');
  rewrite(input); rewrite(output);
  writeln('Введите длинну массива');
  readln(n);
  writeln('Введите массив');
  for var i := 1 to n do
  begin
    readln(arr[i]);
    write(input, arr[i]);
  end;
  var st: integer;
  st := 1;
  while st <> 0 do
  begin
    clrscr;
    writeln('Выберите сортировку');
    writeln('Сортировка пузырьком по возрастанию - 1');
    writeln('Сортировка слиянием по возрастанию - 2');
    writeln('Сортировка пузырьком по убыванию - 3');
    writeln('Сортировка слиянием по убыванию - 4');
    writeln('Выход из программы - 0');
    readln(st);
    start := DateTime.Now.Second;
    start1 := DateTime.Now.MilliSecond;
    case st of
      1: kos;
      2: yep(1, n);
      3: th;
      4: dz(1, n);
      0: exit;
    end;
    for var i := 1 to n do
      print(output, arr[i]);
    stop := DateTime.Now.Second;
    stop1 := DateTime.Now.MilliSecond;
    close(output);
    reset(output);
    read(output, s);
    close(output);
    rewrite(output);
    write(s);
    writeln;
    writeln('Время выполнения: ', stop - start, ' секнуд, ', abs(stop1 - start1), ' милисекунд');
    writeln('Для продолжения дважды нажмите enter');
    readln;
    readln;
  end;
end.
