program MeusPacientes;

uses
  Forms,
  SysUtils,
  UPrincipal in 'UPrincipal.pas' {F_Principal},
  ufrmCadPadrao in 'ufrmCadPadrao.pas' {frmCadastro},
  UCadPacientes in 'UCadPacientes.pas' {F_CadPacientes},
  UDM in 'UDM.pas' {DM: TDataModule},
  uGeral in 'uGeral.pas',
  UCadMedicos in 'UCadMedicos.pas' {F_CadMed},
  UAtendimento in 'UAtendimento.pas' {F_Atend},
  uBackup in 'uBackup.pas' {F_Backup},
  UABOUT in 'UABOUT.pas' {F_Sobre},
  UDMFR in 'UDMFR.pas' {DMFR: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ficha Cl�nica';
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMFR, DMFR);
  Application.Run;
end.
