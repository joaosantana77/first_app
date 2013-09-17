unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, PlatformDefaultStyleActnCtrls,
  ActnList, ActnMan, jpeg, ExtCtrls, StdCtrls, System.Actions;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    ActionManager1: TActionManager;
    Cadastros1: TMenuItem;
    FichaClnica1: TMenuItem;
    Backup1: TMenuItem;
    MnCadPaciente: TMenuItem;
    MnCadMedicos: TMenuItem;
    N1: TMenuItem;
    MnSair: TMenuItem;
    MnFCAtend: TMenuItem;
    MnFcRelat: TMenuItem;
    BackupBancodedados1: TMenuItem;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    actSair: TAction;
    actCadPacient: TAction;
    actUsuarios: TAction;
    Image1: TImage;
    actAtendimento: TAction;
    actBackup: TAction;
    Sobre1: TMenuItem;
    actAbout: TAction;
    procedure actSairExecute(Sender: TObject);
    procedure actCadPacientExecute(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actAtendimentoExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;
//  vTipoPessoa: string;
implementation

uses UCadpacientes, UCadMedicos, UAtendimento, UBackup, UABOUT;

{$R *.dfm}

procedure TF_Principal.actAboutExecute(Sender: TObject);
begin
  with TF_Sobre.Create(Self) do
    try
      ShowModal;
    finally
      FreeAndNil(F_Sobre);
    end;

end;

procedure TF_Principal.actAtendimentoExecute(Sender: TObject);
begin
  with TF_Atend.Create(Self) do
    try
      ShowModal;
    finally
      FreeAndNil(F_Atend);
    end;

end;

procedure TF_Principal.actBackupExecute(Sender: TObject);
begin
  with TF_Backup.Create(Self) do
    try
      ShowModal;
    finally
      FreeAndNil(F_Backup);
    end;

end;

procedure TF_Principal.actCadPacientExecute(Sender: TObject);
begin
  with TF_CadPacientes.Create(Self) do
    try
      ShowModal;
    finally
      FreeAndNil(F_CadPacientes);
    end;
end;

procedure TF_Principal.actSairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_Principal.actUsuariosExecute(Sender: TObject);
begin
  with TF_CadMed.Create(Self) do
    try
      ShowModal;
    finally
      FreeAndNil(F_CadMed);
    end;

end;

end.
