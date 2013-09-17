unit UAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DBClient, Provider, StdCtrls, DBCtrls, DB, Mask,
  Grids, DBGrids, ComCtrls, ExtCtrls, Buttons, DateUtils;

type
  TF_Atend = class(TForm)
    GroupBox1: TGroupBox;
    cbAtend: TComboBox;
    Label1: TLabel;
    sqlConsPes: TSQLQuery;
    dblkpPessoa: TDBLookupComboBox;
    butNovo: TButton;
    Paciente: TLabel;
    dspConsPes: TDataSetProvider;
    cdsConsPes: TClientDataSet;
    sqlAcomp: TSQLDataSet;
    dspAcomp: TDataSetProvider;
    cdsAcomp: TClientDataSet;
    cdsConsPesIDPESSOA: TIntegerField;
    cdsConsPesNOME: TStringField;
    dsAcomp: TDataSource;
    dsConsPes: TDataSource;
    cdsAcompIDACOMP: TIntegerField;
    cdsAcompIDPESSOA: TIntegerField;
    cdsAcompIDATENDENTE: TIntegerField;
    cdsAcompDATA: TDateField;
    cdsAcompDIAGNOSTICO: TStringField;
    cdsAcompANTECEDENTES: TStringField;
    cdsAcompPA: TStringField;
    cdsAcompFC: TStringField;
    cdsAcompPESO: TStringField;
    cdsAcompALTURA: TStringField;
    cdsAcompCONDUTA: TStringField;
    cdsAcompEVOLUCAO: TStringField;
    butAtender: TButton;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    dbAnteced: TDBEdit;
    Label3: TLabel;
    dbPA: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbFC: TDBEdit;
    dbPESO: TDBEdit;
    dbALT: TDBEdit;
    dbCOND: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbEVOL: TDBEdit;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    dtpData: TDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    edtDiag: TEdit;
    Label12: TLabel;
    edtAnt: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtPA: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtFC: TEdit;
    edtPeso: TEdit;
    edtAlt: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edtCond: TEdit;
    edtEvol: TEdit;
    butCancelar: TBitBtn;
    butGravar: TBitBtn;
    butSair: TBitBtn;
    spACOMP_IU: TSQLStoredProc;
    butImprimir: TBitBtn;
    Label21: TLabel;
    cdsConsPesNASCIMENTO: TDateField;
    edtIdade: TEdit;
    edtHist: TMemo;
    Memo1: TMemo;
    cdsAcompHISTORIA: TStringField;
    cdsTMP: TClientDataSet;
    cdsTMPIDACOMP: TIntegerField;
    cdsTMPIDPESSOA: TIntegerField;
    cdsTMPIDATENDENTE: TIntegerField;
    cdsTMPDATA: TDateField;
    cdsTMPDIAGNOSTICO: TStringField;
    cdsTMPHISTORIA: TMemoField;
    cdsTMPANTECEDENTES: TMemoField;
    cdsTMPPA: TStringField;
    cdsTMPFC: TStringField;
    cdsTMPPESO: TStringField;
    cdsTMPALTURA: TStringField;
    cdsTMPCONDUTA: TMemoField;
    cdsTMPEVOLUCAO: TMemoField;
    cdsTMPIDADE: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cbAtendExit(Sender: TObject);
    procedure butAtenderClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure butGravarClick(Sender: TObject);
    procedure cdsAcompBeforePost(DataSet: TDataSet);
    procedure butImprimirClick(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblkpPessoaExit(Sender: TObject);
    procedure dsAcompDataChange(Sender: TObject; Field: TField);
    procedure butNovoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Atend: TF_Atend;
  vAtendente, flagImp: string;
  vIdAtend, vIdAcomp, vIdPessoa, vIdadeAnos : Integer;

implementation

uses UDM, UPrincipal, UDMFR;
{$R *.dfm}


procedure TF_Atend.butCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja Cancelar os dados da ficha?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    edtDiag.Clear;
    edtHist.Clear;
    edtPA.Clear;
    edtFC.Clear;
    edtPeso.Clear;
    edtAlt.Clear;
    edtCond.Clear;
    edtEvol.Clear;
    showmessage('Dados cancelados!');
  end;
end;

procedure TF_Atend.butGravarClick(Sender: TObject);
var  Qry: TSQLQuery;
begin
  if edtDiag.Text <> '' then
  begin
    if MessageDlg('Deseja salvar a ficha?', mtConfirmation, [mbYes, mbNo], 0)
      = mrYes then
    begin
      vIDACOMP := 1;
      Qry := TSQLQuery.Create(nil);  //cria uma instancia do
      try
         Qry.SQLConnection := DM.MEUSPACIENTES;  //o seu componente de conex�o com o banco
         Qry.SQL.Text := 'SELECT MAX(IDACOMP) from ACOMPANHAMENTO';
         Qry.Open;
         if not QRY.Fields[0].IsNull then   //se nao estiver vazia a tabela retornar� nulo
         begin
            vIDACOMP := (QRY.Fields[0].AsInteger + 1);
         end;
      finally
        FreeAndNil(QRY);    //libera o objeto da mem�ria
      end;
      {if cdsTMP.Active then
         cdsTMP.EmptyDataSet;
      cdsTMP.CreateDataSet;
      cdsTMP.Append;
      cdsTMP.Edit;
      // Atribui os campos temporarios as variaveis e salva
      cdsTMPIDACOMP.Value      := vIdAcomp;
      cdsTMPIDPESSOA.Value     := vIdPessoa;
      cdsTMPIDATENDENTE.Value  := vIdAtend;
      cdsTMPDATA.AsDateTime    := dtpData.DateTime;
      cdsTMPDIAGNOSTICO.Value  := edtDiag.Text;
      cdsTMPHISTORIA.AsString  := edtHist.Text;
      cdsTMPANTECEDENTES.Value := edtAnt.Text;
      cdsTMPPA.Value           := edtPA.Text;
      cdsTMPFC.Value           := edtFC.Text;
      cdsTMPPESO.Value         := edtPeso.Text;
      cdsTMPALTURA.Value       := edtAlt.Text;
      cdsTMPCONDUTA.Value      := edtCond.Text;
      cdsTMPEVOLUCAO.Value     := edtEvol.Text;
      cdsTMPIDADE.Value        := vIdadeAnos;}

      // Atribui os campos as variaveis e salva
      flagImp := '1';
      cdsAcomp.Append;
      cdsAcomp.Edit;
      cdsAcompIDACOMP.Value      := vIdAcomp;
      cdsAcompIDPESSOA.Value     := vIdPessoa;
      cdsAcompIDATENDENTE.Value  := vIdAtend;
      cdsAcompDATA.AsDateTime    := dtpData.DateTime;
      cdsAcompDIAGNOSTICO.Value  := edtDiag.Text;
      cdsAcompHISTORIA.AsString  := edtHist.Text;
      cdsAcompANTECEDENTES.Value := edtAnt.Text;
      cdsAcompPA.Value           := edtPA.Text;
      cdsAcompFC.Value           := edtFC.Text;
      cdsAcompPESO.Value         := edtPeso.Text;
      cdsAcompALTURA.Value       := edtAlt.Text;
      cdsAcompCONDUTA.Value      := edtCond.Text;
      cdsAcompEVOLUCAO.Value     := edtEvol.Text;
      cdsAcomp.Post;
      showmessage('Ficha clinica gravada!');
      // cdsAcomp.Close;
    end;
  end
  else
    showmessage('Diagnostico deve ser preenchido!');

end;

procedure TF_Atend.butImprimirClick(Sender: TObject);
var vID : Integer;
begin
  if flagImp = '0' then
  begin
    showmessage('Por favor, grave antes de imprimir!');
  end
  else
  begin
    DM.cdsCadPes.Open;
    DM.cdsCadPes.Locate('IDPESSOA',vIdPessoa,[]);
    cdsAcomp.Filtered := False;
    cdsAcomp.Filter := 'IDACOMP = '+IntToStr(vIdAcomp);
    cdsAcomp.Filtered := True;
    DMFR.frxReport1.LoadFromFile('FichaClinica.fr3');
    DMFR.frxReport1.ShowReport();
    DM.cdsPesAtd.Close;
    cdsAcomp.Filtered := False;
  end;
  cdsTmp.Close;
end;

procedure TF_Atend.butNovoExit(Sender: TObject);
begin
   cdsConspes.Close;
   cdsConspes.Open;
end;

procedure TF_Atend.butSairClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Atend.butAtenderClick(Sender: TObject);
begin

  // abrir a tabela acomp, filtrando pelo cliente selecionado
  cdsTmp.Close;
  edtDiag.Clear;
  edtHist.Clear;
  edtAnt.Clear;
  edtPA.Clear;
  edtFC.Clear;
  edtPeso.Clear;
  edtAlt.Clear;
  edtCond.Clear;
  edtEvol.Clear;

  vIdPessoa := cdsConsPesIDPESSOA.AsInteger;
  cdsAcomp.Open;
  cdsAcomp.Filtered := False;
  cdsAcomp.Filter := 'IDPESSOA = ' + IntToStr(vIdPessoa);
  cdsAcomp.Filtered := True;
  // colocar o cursor na data, mas permitir o acesso aos dados
  edtDiag.SetFocus;
  edtDiag.Color := clYellow;
end;

procedure TF_Atend.cbAtendExit(Sender: TObject);
begin
  DM.cdsCadUsu.Locate('NOME', cbAtend.Text, []);
  vIdAtend := DM.cdsCadUsuIDUSUARIO.AsInteger;
end;

procedure TF_Atend.cdsAcompBeforePost(DataSet: TDataSet);
begin
  // abrir um sp e gravar
  DM.Start;
  try
    with spACOMP_IU do
    begin
      Params[00].AsInteger := cdsAcompIDACOMP.AsInteger;
      Params[01].AsInteger := cdsAcompIDPESSOA.AsInteger;
      Params[02].AsInteger := cdsAcompIDATENDENTE.AsInteger;
      Params[03].AsDateTime := cdsAcompDATA.AsDateTime;
      Params[04].AsString := cdsAcompDIAGNOSTICO.AsString;
      Params[05].AsString := cdsAcompHISTORIA.AsString;
      Params[06].AsString := cdsAcompANTECEDENTES.AsString;
      Params[07].AsString := cdsAcompPA.AsString;
      Params[08].AsString := cdsAcompFC.AsString;
      Params[09].AsString := cdsAcompPESO.AsString;
      Params[10].AsString := cdsAcompALTURA.AsString;
      Params[11].AsString := cdsAcompCONDUTA.AsString;
      Params[12].AsString := cdsAcompEVOLUCAO.AsString;
      ExecProc;
      DM.Comit;
    end;
  except
    DM.Rollback
  end;

end;

procedure TF_Atend.dblkpPessoaExit(Sender: TObject);
var
  Data1, Data2: TDateTime;
  Anos, Meses, Dias: Integer;
  msgId, flagId: string;
begin
  // Pega a data de nascimento e calcula a idade
  flagId := '0';
  Data1 := cdsConsPesNASCIMENTO.AsDateTime;
  if Data1 > StrToDate('01/01/1900') then
  begin
    flagId := '1';
    Data2 := now();
    Anos := YearsBetween(Data1, Data2);
    Data1 := incYear(Data1, Anos);
    Meses := MonthsBetween(Data1, Data2);
    Data1 := incMonth(Data1, Meses);
    Dias := daysBetween(Data1, Data2);
  end;

  if flagId = '1' then
  begin
    if Anos > 0 then
    begin
      vIdadeAnos := Anos;
      msgId := IntToStr(Anos) + ' Anos ';
      if Meses > 0 then
      begin
        if Meses > 1 then
          msgId := msgId + IntToStr(Meses) + ' Meses '
        else
          msgId := msgId + IntToStr(Meses) + ' Mes ';
        if Dias > 0 then
        begin
          if Dias > 1 then
            msgId := msgId + IntToStr(Dias) + ' Dias'
          else
            msgId := msgId + IntToStr(Dias) + ' Dia';
        end
      end
      else // meses = 0
      begin
        if Dias > 0 then
        begin
          if Dias > 1 then
            msgId := msgId + IntToStr(Dias) + ' Dias'
          else
            msgId := msgId + IntToStr(Dias) + ' Dia';
        end
      end;
    end
    else // anos = 0
    begin
      if Meses > 0 then
      begin
        if Meses > 1 then
          msgId := msgId + IntToStr(Meses) + ' Meses '
        else
          msgId := msgId + IntToStr(Meses) + ' Mes ';
        if Dias > 0 then
        begin
          if Dias > 1 then
            msgId := msgId + IntToStr(Dias) + ' Dias'
          else
            msgId := msgId + IntToStr(Dias) + ' Dia';
        end
      end
      else // meses = 0
      begin
        if Dias > 0 then
        begin
          if Dias > 1 then
            msgId := msgId + IntToStr(Dias) + ' Dias'
          else
            msgId := msgId + IntToStr(Dias) + ' Dia';
        end
      end;
    end;
  end;
  if (flagId = '0') then
  begin
    vIdadeAnos := 0;
    msgId := 'Data Nascimento n�o Informado';
  end;
  edtIdade.Text := msgId;
  // edtIdade.Text := IntToStr(Anos)+' Anos '+IntToStr(Meses)+' Meses '+IntToStr(Dias)+' Dias';

end;

procedure TF_Atend.dsAcompDataChange(Sender: TObject; Field: TField);
begin
   Memo1.Clear;
   Memo1.Lines.Text := cdsAcompHISTORIA.AsString;
end;

procedure TF_Atend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsAcomp.Filtered := False;
  cdsAcomp.Filtered := True;
  cdsAcomp.Close;
  cdsConsPes.Close;
end;

procedure TF_Atend.FormCreate(Sender: TObject);
begin
  flagImp := '0';
  cbAtend.Clear;
  DM.cdsCadUsu.Open;
  DM.cdsCadUsu.First;
  dtpData.DateTime := now();
  while not DM.cdsCadUsu.Eof do
  begin
    cbAtend.Items.Append(Trim(DM.cdsCadUsuLOGIN.AsString));
    DM.cdsCadUsu.Next;
  end;
  cbAtend.ItemIndex := 0;
  dsConsPes.DataSet.Open;
  Memo1.Clear;
end;

procedure TF_Atend.FormKeyPress(Sender: TObject; var Key: Char);
begin
  { : troca ENTER por TAB }
  if Key = #13 then
  begin
    Perform(CM_DialogKey, VK_TAB, 0);
    Key := #0;
  end

end;

end.
