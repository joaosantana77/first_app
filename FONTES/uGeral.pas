unit uGeral;

interface

Uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, Inifiles, Printers, Db,
  DbCtrls, DbGrids, comctrls, Registry, ShellAPI;

type
  Btns = set of 1 .. 30;
procedure ExecNewProcess(ProgramName: String; Wait: Boolean);
procedure IndiceInicialDBGrid(Table: TTable; DBGrid: TDBGrid;
  Indices: array of String; ColunaIndice: array of Integer;
  NumIndices: Integer);
procedure IndiceDBGrid(Table: TTable; Coluna: TColumn; DBGrid: TDBGrid;
  Indices: array of String; ColunaIndice: array of Integer;
  NumIndices: Integer);
procedure AbrirTab(Dataset: array of TDataset);
procedure FecharTab(Dataset: array of TDataset);
procedure Say(Nlin, Ncol: Integer; Var LinhaAtual: Integer; Var Arquivo: Text;
  Texto: String; col: Integer);
procedure Aviso(Msg: String);
procedure FazPrnAtualVirarDefault;

function Confirme(Msg: String): word;
function Arredondar(Num: real): real;
function IIF(Condicao: Boolean; Retorno1, Retorno2: variant): variant;
function nAcentos(Texto: String): String;
function IFC(Condicao: Boolean; Retorno1, Retorno2: Char): Char;
// function Acesso(Usuario,opcao: String):Boolean;

function VersaoOS: String;
// function MemoryReturn(Categoria: integer): integer;
function NomeComputador: String;
function NumeroSerie(Unidade: PChar): String;
function SubstVirgulaPonto(x: String): String;
function SubstBarraPonto(x: String): String;
function SerialNum(FDrive: String): String;
Function ValidaCGC(CGC: String): Boolean;
Function ValidaCPF(CPF: String): Boolean;
// Function ValidaValorFrac(Num : string):Boolean;
function CopiaArquivo(ArqOrigem, ArqDestino: string): Boolean;
function DVEAN(Strcod: String): String;
function StrZero(cNumero: Integer; cDigitos: Integer): String;
function lerRegistro(chave: String; variavel: String): String;
function IDTransaction : String;

procedure gravarRegistro(chave: String; variavel : String; valor : String);
  const
     MSG_OK = 'Informação cadastrada com sucesso';
     MSG_PERMISSOES = 'Você não tem permissão para executar essa ação';
     MSG_CAMPO_OBR = 'Campo obrigatório';
     MSG_ERRO = 'Ocorreu um erro!';


Var
  NomeUsuario: String;

implementation

function IDTransaction : String;
var
  i : Integer;
const
  str = '0123456789';
begin
  for i := 1 to 2 do
  begin
    Randomize;
    Result := Result + str[Random(Length(str))+1];
  end
end;


procedure IndiceInicialDBGrid(Table: TTable; DBGrid: TDBGrid;
  Indices: array of String; ColunaIndice: array of Integer;
  NumIndices: Integer);
var
  i: Integer;
begin
  for i := 0 to NumIndices - 1 do
  begin
    Try
      if (Table.IndexName = Indices[i]) then
      begin
        DBGrid.Columns[ColunaIndice[i]].Title.Color := clHighlight;
        DBGrid.Columns[ColunaIndice[i]].Title.Font.Color := clHighlightText;
      end
      Except
      End;
    end
  end;

  procedure IndiceDBGrid(Table: TTable; Coluna: TColumn; DBGrid: TDBGrid;
    Indices: array of String; ColunaIndice: array of Integer;
    NumIndices: Integer);
  var
    i, j: Integer;
  begin
    for i := 0 to NumIndices - 1 do
    begin
      if (Coluna = DBGrid.Columns[ColunaIndice[i]]) then
      begin
        Try
          Table.IndexName := Indices[i];
          DBGrid.Columns[ColunaIndice[i]].Title.Color := clHighlight;
          DBGrid.Columns[ColunaIndice[i]].Title.Font.Color := clHighlightText;
        Except
        End;
      end
      else
      begin
        for j := 0 to NumIndices - 1 do
          if (Coluna = DBGrid.Columns[ColunaIndice[j]]) then
          begin
            DBGrid.Columns[ColunaIndice[i]].Title.Color := clBtnFace;
            DBGrid.Columns[ColunaIndice[i]].Title.Font.Color := clBlack;
          end
      end
    end
  end;

  procedure AbrirTab(Dataset: array of TDataset);
  var
    i: Integer;
  begin
    for i := Low(Dataset) to High(Dataset) do
    begin
      if (Dataset[i] is TTable) then
      begin
        Dataset[i].Close;
        Dataset[i].Open;
      end
      else if (Dataset[i] is TQuery) then
      begin
        Dataset[i].Close; (Dataset[i] as TQuery)
        .Prepare;
        Dataset[i].Open;
      end;
    end
  end;

  procedure FecharTab(Dataset: array of TDataset);
  var
    i: Integer;
  begin
    for i := Low(Dataset) to High(Dataset) do
    begin
      Dataset[i].Close;
      if (Dataset[i] is TQuery) then (Dataset[i] as TQuery)
        .UnPrepare;
    end
  end;

  procedure Say(Nlin, Ncol: Integer; Var LinhaAtual: Integer;
    Var Arquivo: Text; Texto: String; col: Integer);
  { Função para impressão de linhas em um relatorio }
  var
    x: Integer;
  begin

    Write(Arquivo, #13);
    If Nlin <> LinhaAtual then
    begin
      for x := LinhaAtual to (Nlin - 1) do
      begin
        WriteLn(Arquivo, '');
        LinhaAtual := LinhaAtual + 1;
      end;
    end;

    if col <> 0 then
      Ncol := Ncol + col - Length(Texto);

    If Ncol > 0 then
    begin
      For x := 0 to Ncol + col do
      begin
        Write(Arquivo, ' ');
      end;
    end;
    // este valor é para 8 lpp
    If LinhaAtual >= 85 then { 63 É O NÚMERO DA ÚLTIMA LINHA ANTES DO RODAPÉ }
    begin
      For x := 85 to 90 do { 67 É A QUANTIDADE DE LINHAS POR PÁGINA }
      begin
        WriteLn(Arquivo, '');
        LinhaAtual := 0;
      end;
    end;
    Texto := nAcentos(Texto);
    Write(Arquivo, Texto);
  end;

  Procedure Aviso(Msg: String);
  begin
    MessageDLG(Msg, mtInformation, [mbOk], 0);
  end;

  // Esta funçao irá configurar a impressora como padrao.
  procedure FazPrnAtualVirarDefault;
  var
    Res: DWORD;
    Device: array [0 .. 255] of Char;
    Driver: array [0 .. 255] of Char;
    Port: array [0 .. 255] of Char;
    WindowsStr: array [0 .. 255] of Char;
    hDeviceMode: THandle;
  begin
    // Pega dados da impressora atual
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
    // Monta string exigida pela API do Windows
    StrCat(Device, ',');
    StrCat(Device, Driver);
    StrCat(Device, ',');
    StrCat(Device, Port);
    StrPCopy(WindowsStr, 'windows');
    // Torna a impressora a atual;
    WriteProfileString(WindowsStr, 'device', Device);
    SendMessageTimeout(HWND_BROADCAST, WM_WININICHANGE, 0, DWORD(@WindowsStr),
      SMTO_NORMAL, 1000, Res);
  end;

  function Confirme(Msg: String): word;
  begin
    Result := MessageDLG(Msg, mtConfirmation, [mbYes, mbNo], 0);
  end;

  function Arredondar(Num: real): real;
  var
    Temp: string;
  begin
    Temp := formatfloat('#############0.00', Num);
    Result := StrtoFloat(Temp);
  end;

  function IIF(Condicao: Boolean; Retorno1, Retorno2: variant): variant;
  begin
    if Condicao = True then
      Result := Retorno1
    else
      Result := Retorno2;
  end;

  function nAcentos(Texto: String): String;
  Var
    Num: Integer;
    A, E, i, O, U, am, em, im, om, um: String;
  Begin
    A := ('ÀÁÂÃÄ');
    E := ('ÈÉÊË');
    i := ('ÌÍÎÏ');
    O := ('ÒÓÔÕÖ');
    U := ('ÙÚÛÜ');
    am := ('àáâãä');
    em := ('èéêë');
    im := ('ìíîï');
    om := ('òóôõö');
    um := ('ùúûü');
    for Num := 0 to Length(Texto) - 1 do
    begin
      Texto[Num] := IFC(Pos(Texto[Num], A) <> 0, 'A', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], E) <> 0, 'E', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], i) <> 0, 'I', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], O) <> 0, 'O', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], U) <> 0, 'U', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], am) <> 0, 'a', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], em) <> 0, 'e', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], im) <> 0, 'i', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], om) <> 0, 'o', Texto[Num]);
      Texto[Num] := IFC(Pos(Texto[Num], um) <> 0, 'u', Texto[Num]);
      Texto[Num] := IFC(Texto[Num] = 'Ç', 'C', Texto[Num]);
      Texto[Num] := IFC(Texto[Num] = 'ç', 'c', Texto[Num]);
    end;
    Result := Texto;
  End;

  function IFC(Condicao: Boolean; Retorno1, Retorno2: Char): Char;
  begin
    if Condicao = True then
      Result := Retorno1
    else
      Result := Retorno2;
  end;

  // function Acesso(Usuario,opcao: String):Boolean;
  // var
  // usu: string;
  // begin
  // if DM.QUsu.FieldByName('NOME').AsString <> Usuario then
  // DM.QUsu.Locate('NOME',Usuario,[]);

  // Result := DM.QUsu.FieldByName(opcao).Value;
  // if Not(Result) then begin
  // if Confirme('Usuário não possui acesso para esta opção! Deseja digitar outro USUÁRIO e SENHA?')=idYes then begin
  // fmLibera := TfmLibera.Create(Application);
  // with fmLibera do
  // try
  // if ShowModal = idOk then
  // usu := Edit1.Text;
  // finally
  // Free;
  // end;
  // end;
  // end;

  // if Result then
  // exit;

  // if DM.QUsu.FieldByName('NOME').AsString <> usu then
  // DM.QUsu.Locate('NOME',usu,[]);

  // Result := DM.QUsu.FieldByName(opcao).Value;
  // if Not(Result) then begin
  // Aviso('Este Usuário também não possui acesso para esta opção!!!');
  // Result := False;
  // end
  // else
  // Result := True;

  // end;

  function CPUSpeed: Double;
  // Retorna a frequencia do processador usado
  const
    DelayTime = 500; // measure time in ms
  var
    TimerHi, TimerLo: DWORD;
    PriorityClass, Priority: Integer;
  begin
    PriorityClass := GetPriorityClass(GetCurrentProcess);
    Priority := GetThreadPriority(GetCurrentThread);
    SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
    SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
    Sleep(10);
  asm
    dw 310Fh // rdtsc
    mov TimerLo, eax
    mov TimerHi, edx
  end;

    Sleep(DelayTime);
  asm
    dw 310Fh // rdtsc
    sub eax, TimerLo
    sbb edx, TimerHi
    mov TimerLo, eax
    mov TimerHi, edx
  end;

    SetThreadPriority(GetCurrentThread, Priority);
    SetPriorityClass(GetCurrentProcess, PriorityClass);
    Result := Trunc(TimerLo / (1000.0 * DelayTime));
  end;

  function VersaoOS: String;
  var
    verInfo: TOsVersionInfo;
  begin
    verInfo.dwOSVersionInfoSize := SizeOf(TOsVersionInfo);
    if GetVersionEx(verInfo) then
    begin
      case verInfo.dwPlatformId of
        VER_PLATFORM_WIN32s:
          Result := 'Windows 95';
        VER_PLATFORM_WIN32_WINDOWS:
          Result := 'Windows 95 Osr2 / 98';
        VER_PLATFORM_WIN32_NT:
          Result := 'Windows NT';
      end;
    end;
  end;

  function NomeComputador: String;
  // Retorna o nome do computador
  var
    lpBuffer: PChar;
    nSize: DWORD;
  const
    Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
  begin
    nSize := Buff_Size;
    lpBuffer := StrAlloc(Buff_Size);
    GetComputerName(lpBuffer, nSize);
    Result := String(lpBuffer);
    StrDispose(lpBuffer);
  end;

  function NumeroSerie(Unidade: PChar): String;
  { Retorna o Número serial da unidade especificada }
  var
    VolName, SysName: AnsiString;
    SerialNo, MaxCLength, FileFlags: DWORD;
  begin
    try
      SetLength(VolName, 255);
      SetLength(SysName, 255);
      GetVolumeInformation(Unidade, PChar(VolName), 255, @SerialNo, MaxCLength,
        FileFlags, PChar(SysName), 255);
      Result := IntToHex(SerialNo, 8);
    except
      Result := ' ';
    end;
  end;

  Function CopiaArquivo(ArqOrigem, ArqDestino: string): Boolean;
  var
    ArqOrig, ArqDest: array [0 .. 70] of Char;
  begin
    StrPCopy(ArqOrig, ArqOrigem);
    StrPCopy(ArqDest, ArqDestino);
    try
      CopyFile(ArqOrig, ArqDest, false);
      { pois True se o arquivo já existir ele não sobrepõe }
      Result := True;
    except
      Result := false;
    end;
  end;

  function SubstVirgulaPonto(x: String): String;
  Var
    Res: Integer;
  Begin
    Result := '';
    for Res := 1 to Length(x) do
      If x[Res] <> ',' then
        Result := Result + x[Res]
      else
        Result := Result + '.'
  end;

  function SubstBarraPonto(x: String): String;
  Var
    Res: Integer;
  Begin
    Result := '';
    for Res := 1 to Length(x) do
      If x[Res] <> '/' then
        Result := Result + x[Res]
      else
        Result := Result + '.'
  end;

  Function SerialNum(FDrive: String): String;
  var
    Serial: DWORD;
    DirLen, Flags: DWORD;
    DLabel: Array [0 .. 11] of Char;
  begin
    Try
      GetVolumeInformation(PChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen,
        Flags, nil, 0);
      Result := IntToHex(Serial, 8);
    Except
      Result := '';
    end;
  end;

  // Funcao para criar digito verificador codigo barras
  Function DVEAN(Strcod: String): String;
  var
    intPar, intImpar, intSomaPar, intSomaImpar: Integer;
    intTotalSoma, intDv, i: Integer;
  begin
    If Length(Strcod) <> 12 Then
    begin
      ShowMessage(
        'O Código para cálculo do dígito verificado está errado. Favor corrigir'
        );
      Exit
    End;

    intSomaPar := 0;
    intSomaImpar := 0;
    intTotalSoma := 0;
    intDv := 0;
    For i := 1 To 12 do
    begin
      if (i mod 2) = 0 then
      begin
        intPar := StrToInt(Copy(Strcod, i, 1));
        intSomaPar := intSomaPar + intPar;
      end;
    end;

    For i := 1 To 12 do
    begin
      if (i mod 2) <> 0 then
      begin
        intImpar := StrToInt(Copy(Strcod, i, 1));
        intSomaImpar := intSomaImpar + intImpar;
      end;
    end;

    intSomaPar := intSomaPar * 3;
    intTotalSoma := intSomaPar + intSomaImpar;

    While (intTotalSoma mod 10) <> 0 do
    begin
      intDv := intDv + 1;
      intTotalSoma := intTotalSoma + 1
    end;
    Result := Strcod + IntToStr(intDv);
  End;

  {
    Function ValidaValorFrac(Num : string) : Boolean;
    var s1 : string; s2 : Integer;
    begin
    s1 := Num;
    if Pos(',',s1) > 0 then
    begin
    s2 := StrToInt(Copy(s1,Pos(',',s1)+1,2));
    if s2 > 0 then
    Result :=  True;
    end
    else
    Result := False;
    end;
    }
  Function ValidaCGC(CGC: String): Boolean;
  var
    i, dv1, dv2, soma1, soma2, wm11, digit1, digit2: Integer;
  begin
    digit1 := 0;
    digit2 := 0;
    soma1 := 0;
    soma2 := 0;
    wm11 := 2;
    CGC := Copy(CGC, 1, 2) + Copy(CGC, 4, 3) + Copy(CGC, 8, 3) + Copy(CGC, 12,
      4) + Copy(CGC, 17, 2);
    Result := True;
    try
      dv1 := StrToInt(Copy(CGC, 13, 1));
      dv2 := StrToInt(Copy(CGC, 14, 1));
      for i := 1 to 12 do
      begin
        soma1 := soma1 + wm11 * StrToInt(Copy(CGC, 13 - i, 1));
        if (wm11 < 9) then
          wm11 := wm11 + 1
        else
          wm11 := 2;
      end;
      digit1 := 11 - (soma1 mod 11);
      if (digit1 > 9) then
        digit1 := 0;
      if (digit1 = dv1) then
      begin
        wm11 := 2;
        for i := 1 to 13 do
        begin
          soma2 := soma2 + wm11 * StrToInt(Copy(CGC, 14 - i, 1));
          if (wm11 < 9) then
            wm11 := wm11 + 1
          else
            wm11 := 2;
        end;
        digit2 := 11 - (soma2 mod 11);
        if (digit2 > 9) then
          digit2 := 0;
      end;
      if (not((dv1 = digit1) and (dv2 = digit2))) then
      begin
        MessageDLG('CGC Inválido !!!', mtInformation, [mbOk], 0);
        Result := false;
      end;
    except
      MessageDLG('CGC Inválido !!!', mtInformation, [mbOk], 0);
      Result := false;
    end;
  end;

  Function ValidaCPF(CPF: String): Boolean;
  var
    i, dv1, dv2, soma1, soma2, digit1, digit2: Integer;
  begin
    digit1 := 0;
    digit2 := 0;
    soma1 := 0;
    soma2 := 0;
    CPF := Copy(CPF, 1, 3) + Copy(CPF, 5, 3) + Copy(CPF, 9, 3) + Copy(CPF, 13,
      2);
    Result := True;
    try
      dv1 := StrToInt(Copy(CPF, 10, 1));
      dv2 := StrToInt(Copy(CPF, 11, 1));
      for i := 1 to 9 do
        soma1 := soma1 + (i + 1) * StrToInt(Copy(CPF, 10 - i, 1));
      digit1 := 11 - (soma1 mod 11);
      if (digit1 > 9) then
        digit1 := 0;
      if (digit1 = dv1) then
      begin
        for i := 1 to 10 do
          soma2 := soma2 + (i + 1) * StrToInt(Copy(CPF, 11 - i, 1));
        digit2 := 11 - (soma2 mod 11);
        if (digit2 > 9) then
          digit2 := 0;
      end;
      if (not((dv1 = digit1) and (dv2 = digit2))) then
      begin
        MessageDLG('CPF Inválido !!!', mtInformation, [mbOk], 0);
        Result := false;
      end;
    except
      MessageDLG('CPF Inválido !!!', mtInformation, [mbOk], 0);
      Result := false;
    end;
  end;

procedure ExecNewProcess(ProgramName: String; Wait: Boolean);
  var
    StartInfo: TStartupInfo;
    ProcInfo: TProcessInformation;
    CreateOK: Boolean;
  begin
    { fill with known state }
    FillChar(StartInfo, SizeOf(TStartupInfo), #0);
    FillChar(ProcInfo, SizeOf(TProcessInformation), #0);
    StartInfo.cb := SizeOf(TStartupInfo);
    CreateOK := CreateProcess(nil, PChar(ProgramName), nil, nil, false,
      CREATE_NEW_PROCESS_GROUP + NORMAL_PRIORITY_CLASS, nil, nil, StartInfo,
      ProcInfo);
    { check to see if successful }
    if CreateOK then
    begin
      // may or may not be needed. Usually wait for child processes
      if Wait then
        WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    end
    else
    begin
      ShowMessage('Unable to run ' + ProgramName);
    end;

    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
end;

function StrZero(cNumero: Integer; cDigitos: Integer): String;
var
    i: Integer;
    Texto: String;
begin
    Texto := IntToStr(cNumero);
    for i := 1 to cDigitos do
    begin
      Texto := '0' + Texto;
    end;
    Result := Texto;
end;

function lerRegistro(chave: String; variavel: String): String;
var
    Reg: TRegistry;
    retorno: String;
begin
    Reg := TRegistry.Create;
    try
       Reg.RootKey := HKEY_CURRENT_USER;
       Reg.OpenKey(chave, false);
       retorno := Reg.ReadString(variavel);
    finally
       Reg.CloseKey; Reg.Free;
    end;
    result := retorno;
end;

procedure gravarRegistro(chave: String; variavel : String; valor : String);
var Reg: TRegistry;
begin
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey(chave, True);
      Reg.WriteString(variavel, valor);
   finally
      Reg.CloseKey;
      Reg.Free;
   end;
end;


end.
