unit uBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, StdCtrls, Buttons, ExtCtrls, ShlObj;

type
  TF_Backup = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDestino: TEdit;
    edtOrigem: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    spbutOpen: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure spbutOpenClick(Sender: TObject);
    function BrowseDialog (const Title: string; const Flag: integer): string;
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  F_Backup: TF_Backup;
  Origem, Destino, DirName : string;

implementation

{$R *.dfm}

procedure TF_Backup.FormShow(Sender: TObject);
begin
  GetDir(0,DirName);
  Origem := copy(DirName,1,2)+'\MeusPacientes\*.*';
  edtOrigem.Text := Origem;
end;

procedure TF_Backup.spbutOpenClick(Sender: TObject);
var ultDig : string;
begin
 { Exemplo:  BrowseDialog(Titulo,Flag);
  Flags:
  BIF_RETURNONLYFSDIRS   = Mostra pastas
  BIF_BROWSEINCLUDEFILES = Mostra pastas e arquivos
  BIF_BROWSEFORCOMPUTER  = Mostra Computadores
  BIF_BROWSEFORPRINTER   = Mostra Impressoras
  }
  Destino := BrowseDialog('Selecione o drive e pasta',BIF_RETURNONLYFSDIRS);
  ultDig  := Copy(Destino,Length(Destino),1);
//  showmessage('ultimo digito: '+ultDig);
  if ultDig <> '\' then
    Destino := Destino+'\MeusPacientes\'
  else
    Destino := Destino+'MeusPacientes\';
  edtDestino.Text := Destino;
end;

procedure TF_Backup.BitBtn2Click(Sender: TObject);
var Dados: TSHFileOpStruct;
begin
  FillChar(Dados,SizeOf(Dados), 0);
  with Dados do
  begin
      wFunc := FO_COPY;
      pFrom := PChar(Origem);
      pTo   := PChar(Destino);
      fFlags:= FOF_ALLOWUNDO;
  end;
  SHFileOperation(Dados);
  showmessage('Copia concluida! ');
end;

function TF_Backup.BrowseDialog (const Title: string; const Flag: integer): string;
var
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  Result:='';
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  with BrowseInfo do begin
    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName;
    lpszTitle := PChar(Title);
    ulFlags := Flag;
  end;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then begin
    SHGetPathFromIDList(lpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;

end.
