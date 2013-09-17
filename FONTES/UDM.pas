unit UDM;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, FMTBcd, DBClient,
  Provider, Dialogs, Forms;

type
  TDM = class(TDataModule)
    sqlCadPes: TSQLDataSet;
    dspCadPes: TDataSetProvider;
    cdsCadPes: TClientDataSet;
    cdsCadPesIDPESSOA: TIntegerField;
    cdsCadPesNOME: TStringField;
    cdsCadPesBAIRRO: TStringField;
    cdsCadPesCIDADE: TStringField;
    cdsCadPesFONE: TStringField;
    cdsCadPesUF: TStringField;
    cdsCadPesCPF: TStringField;
    cdsCadPesRG: TStringField;
    cdsCadPesEMISSAORG: TDateField;
    cdsCadPesNASCIMENTO: TDateField;
    cdsCadPesNATURALIDADE: TStringField;
    cdsCadPesPROFISSAO: TStringField;
    cdsCadPesFILIACAO: TStringField;
    cdsCadPesSEXO: TStringField;
    cdsCadPesCONVENIO: TStringField;
    cdsCadPesALTURA: TStringField;
    cdsCadPesENDERECO: TStringField;
    spCadPes_IU: TSQLStoredProc;
    cdsCadPesESTADOCIVIL: TStringField;
    spCadPes_D: TSQLStoredProc;
    sqlCadUsu: TSQLDataSet;
    dspCadUsu: TDataSetProvider;
    cdsCadUsu: TClientDataSet;
    cdsCadUsuIDUSUARIO: TIntegerField;
    cdsCadUsuNOME: TStringField;
    cdsCadUsuLOGIN: TStringField;
    cdsCadUsuSENHA: TStringField;
    cdsCadUsuCARGO: TStringField;
    cdsCadUsuCRM: TStringField;
    cdsCadUsuFONE: TStringField;
    spCadUsu_IU: TSQLStoredProc;
    spCadUsu_D: TSQLStoredProc;
    sqlPesAtd: TSQLDataSet;
    dspPesAtd: TDataSetProvider;
    cdsPesAtd: TClientDataSet;
    cdsPesAtdIDPESSOA: TIntegerField;
    cdsPesAtdNOME: TStringField;
    cdsPesAtdENDERECO: TStringField;
    cdsPesAtdBAIRRO: TStringField;
    cdsPesAtdCIDADE: TStringField;
    cdsPesAtdFONE: TStringField;
    cdsPesAtdUF: TStringField;
    cdsPesAtdCPF: TStringField;
    cdsPesAtdRG: TStringField;
    cdsPesAtdEMISSAORG: TDateField;
    cdsPesAtdNASCIMENTO: TDateField;
    cdsPesAtdNATURALIDADE: TStringField;
    cdsPesAtdPROFISSAO: TStringField;
    cdsPesAtdFILIACAO: TStringField;
    cdsPesAtdSEXO: TStringField;
    cdsPesAtdCONVENIO: TStringField;
    cdsPesAtdALTURA: TStringField;
    cdsPesAtdESTADOCIVIL: TStringField;
    MEUSPACIENTES: TSQLConnection;
    procedure cdsCadPesBeforePost(DataSet: TDataSet);
    procedure cdsCadPesBeforeDelete(DataSet: TDataSet);
    procedure cdsCadUsuBeforeDelete(DataSet: TDataSet);
    procedure cdsCadUsuBeforePost(DataSet: TDataSet);
    procedure MEUSPACIENTESBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Transc: TTransactionDesc;
    procedure Start;
    procedure Comit;
    procedure Rollback;
  end;

var
  DM: TDM;

implementation

//uses uLibrary, Uprincipal, UGeral;
uses UGeral;

{$R *.dfm}

procedure TDM.Start;
begin
  Transc.IsolationLevel := xilREADCOMMITTED;
  Transc.TransactionID := StrToInt(IdTransaction);
  MEUSPACIENTES.StartTransaction(Transc);
end;

procedure TDM.Comit;
begin
  MEUSPACIENTES.Commit(Transc);
end;

procedure TDM.MEUSPACIENTESBeforeConnect(Sender: TObject);
var Nomearq : string;
begin
   Nomearq := ExtractFilePath(Application.ExeName)+'MEUSPACIENTES.FDB';
   //Nomearq := Copy(Nomearq,1,length(Nomearq)-4)+'\MEUSPACIENTES.FDB';
   // SHOWMESSAGE('Arquivo '+Nomearq);
   Try
     with DM.MEUSPACIENTES do
     begin
       Params.Values['DATABASE'] := Nomearq;
       Params.Values['USERNAME'] := 'SYSDBA';
       Params.Values['PASSWORD'] := 'masterkey';
     end;
   Except
     ShowMessage('N�o foi possivel conectar! Nenhum servidor dispon�vel...');
   End;

end;

procedure TDM.Rollback;
begin
  MEUSPACIENTES.Rollback(Transc);
  raise Exception.Create(MSG_ERRO);
end;

procedure TDM.cdsCadPesBeforeDelete(DataSet: TDataSet);
begin
  with spCadPes_D do
  begin
     Params[0].AsInteger := cdsCadPesIDPESSOA.AsInteger;
     ExecProc;
  end;

end;

procedure TDM.cdsCadPesBeforePost(DataSet: TDataSet);
begin
  DM.Start;
  try
     with spCadPes_IU do
     begin
        Params[00].AsInteger  := cdsCadPesIDPESSOA.AsInteger;
        Params[01].AsString   := cdsCadPesNOME.AsString;
        Params[02].AsString   := cdsCadPesENDERECO.AsString;
        Params[03].AsString   := cdsCadPesBAIRRO.AsString;
        Params[04].AsString   := cdsCadPesCIDADE.AsString;
        Params[05].AsString   := cdsCadPesUF.AsString;
        Params[06].AsString   := cdsCadPesFONE.AsString;
        Params[07].AsString   := cdsCadPesNATURALIDADE.AsString;
        Params[08].AsDateTime := cdsCadPesNASCIMENTO.AsDateTime;
        Params[09].AsString   := cdsCadPesSEXO.AsString;
        Params[10].AsString   := cdsCadPesESTADOCIVIL.AsString;
        Params[11].AsString   := cdsCadPesFILIACAO.AsString;
        Params[12].AsString   := cdsCadPesPROFISSAO.AsString;
        Params[13].AsString   := cdsCadPesCONVENIO.AsString;
        Params[14].AsString   := cdsCadPesCPF.AsString;
        Params[15].AsString   := cdsCadPesRG.AsString;
        Params[16].AsDateTime := cdsCadPesEMISSAORG.AsDateTime;
        Params[17].AsString   := cdsCadPesALTURA.AsString;
        ExecProc;
        DM.Comit;
    end;
  except
     DM.Rollback
  end;


end;

procedure TDM.cdsCadUsuBeforeDelete(DataSet: TDataSet);
begin
  with spCadUsu_D do
  begin
     Params[0].AsInteger := cdsCadusuIDUSUARIO.AsInteger;
     ExecProc;
  end;
end;

procedure TDM.cdsCadUsuBeforePost(DataSet: TDataSet);
begin
  DM.Start;
  try
     with spCadUsu_IU do
     begin
        Params[00].AsInteger  := cdsCadUsuIDUSUARIO.AsInteger;
        Params[01].AsString   := cdsCadUsuNOME.AsString;
        Params[02].AsString   := cdsCadUsuCARGO.AsString;
        Params[03].AsString   := cdsCadUsuCRM.AsString;
        Params[04].AsString   := cdsCadUsuLOGIN.AsString;
        Params[05].AsString   := cdsCadUsuSENHA.AsString;
        Params[06].AsString   := cdsCadUsuFONE.AsString;
        ExecProc;
        DM.Comit;
    end;
  except
     DM.Rollback
  end;

end;


end.
