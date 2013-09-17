unit ufrmCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ExtCtrls, DBCtrls, DB, StdCtrls, Mask, DBClientActns,
  DBActns, ComCtrls, Buttons, Grids, DBGrids, DBClient;

type
  TfrmCadastro = class(TForm)
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnSair: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure DataSource1StateChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure LocalizarExAfterSearch(Sender: TObject; AModalResult: Integer);
    procedure LocalizarExecute(Sender: TObject);
    procedure btnNovoEnter(Sender: TObject);

  private
    { Private declarations }

  public
    procedure EnableDisableControls(Value: Boolean);
    function FieldsWrithe(DtSrc: TDataSource): Boolean;

  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses UDM;
{$R *.dfm}

function TfrmCadastro.FieldsWrithe(DtSrc: TDataSource): Boolean;
var
  i: Integer;
  // : verifica quais os campos que estão em branco no cadastro
begin
  inherited;
  Result := True; // : assume que estão todos preenchidos
  for i := 0 to DtSrc.DataSet.FieldCount - 1 do
    if DtSrc.DataSet.Fields[i].Required then
    BEGIN
      if (DtSrc.DataSet.Fields[i].IsNull) Or
        (DtSrc.DataSet.Fields[i].AsString = '') then
      begin
        MessageDlg('Preencha o campo " ' + DtSrc.DataSet.Fields[i]
            .DisplayLabel + '"', mtWarning, [mbOk], 0);
        Result := False;
        DtSrc.DataSet.Fields[i].FocusControl; // : coloca o foco no controle
        Break;
      end;
    end;
end;

procedure TfrmCadastro.DataSource1StateChange(Sender: TObject);
var
  x: Boolean;
begin
  btnNovo.Enabled := Not(DataSource1.State in [DSINSERT, DSEDIT]);
  btnEditar.Enabled := Not(DataSource1.State in [DSINSERT, DSEDIT]);
  btnExcluir.Enabled := Not(DataSource1.State in [DSINSERT, DSEDIT]);
  // btnLocalizar.Enabled := Not (DataSource1.State in [DSINSERT,DSEDIT]);
  btnGravar.Enabled := DataSource1.State in [DSINSERT, DSEDIT];
  btnCancelar.Enabled := DataSource1.State in [DSINSERT, DSEDIT];
  btnSair.Enabled := Not(DataSource1.State in [DSINSERT, DSEDIT]);

  if not(DataSource1.State in [DSINSERT, DSEDIT]) then
    x := False;
  EnableDisableControls(x);
end;

procedure TfrmCadastro.btnNovoClick(Sender: TObject);
begin
  if not(DataSource1.DataSet.State in [DSINSERT, DSEDIT]) then
  begin
    DataSource1.DataSet.Insert;
    // DataSource1.DataSet.Fields[1].FocusControl;
  end;
end;

procedure TfrmCadastro.btnExcluirClick(Sender: TObject);
begin
  if (DataSource1.DataSet.Active) and (DataSource1.DataSet.RecordCount > 0) then
  begin
    if MessageDlg('Tem certeza que deseja excluir o registro ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DataSource1.DataSet.Delete;
      except
        ShowMessage('Não foi possível excluir o registro');
      end;
    end;
  end;
end;

procedure TfrmCadastro.btnGravarClick(Sender: TObject);
begin
  { : salvo as dados se os campos estiverem preenchidos }
  if FieldsWrithe(DataSource1) and (DataSource1.State in [DSEDIT, DSINSERT])
    then
  begin
    DataSource1.DataSet.Post;
    MessageDlg('O registro foi gravado com sucesso .', mtInformation, [mbOk],
      0);
  end;
end;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
  if (DataSource1.DataSet.State in [DSINSERT, DSEDIT]) then
    DataSource1.DataSet.Cancel;
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DataSource1.State in [DSEDIT, DSINSERT] then
  begin
    case MessageDlg('Deseja salvar as alterações realizados no Cadastro ?',
      mtConfirmation, [mbYes, mbNo], 0) of
      mrYes:
        begin
          btnGravar.Click;
        end;
      mrNo:
        begin
          DataSource1.DataSet.Cancel;
          DataSource1.DataSet.Close;
          Close;
        end;
    end;
  end
  else
  begin
    DataSource1.DataSet.Close;
  end;
end;

procedure TfrmCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  { : troca ENTER por TAB }
  if Key = #13 then
  begin
    Perform(CM_DialogKey, VK_TAB, 0);
    Key := #0;
  end
end;

procedure TfrmCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { : Esc para Sair }
  if Key = VK_Escape then
  begin
    DataSource1.DataSet.Close;
    Close;
  end;
end;

procedure TfrmCadastro.EnableDisableControls(Value: Boolean);
var
  i: Integer;
begin
  { : faz um laço em todos os componentes }
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TDBEdit) then (Components[i] as TDBEdit)
      .Enabled := Value;

    if (Components[i] is TDBComboBox) then (Components[i] as TDBComboBox)
      .Enabled := Value;

    if (Components[i] is TDBLookupComboBox) then
  (Components[i] as TDBLookupComboBox)
      .Enabled := Value;

    if (Components[i] is TDBMemo) then (Components[i] as TDBMemo)
      .Enabled := Value;

    { if (Components[i] is TDBDateTime) then
      (Components[i] as TDBDateTime).Enabled := Value; }

  end;
end;

procedure TfrmCadastro.btnEditarClick(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
//  DataSource1.DataSet.Fields[1].FocusControl;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  DataSource1.DataSet.Open;
  DataSource1.DataSet.First;
end;

procedure TfrmCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.LocalizarExAfterSearch(Sender: TObject;
  AModalResult: Integer);
begin
  if AModalResult = mrOK then
  begin
    EnableDisableControls(True);
  end;
end;

procedure TfrmCadastro.LocalizarExecute(Sender: TObject);
begin
  { : verifica se esta em modo de edição ou inserção }
  if DataSource1.State in [DSEDIT, DSINSERT] then
    case MessageDlg('Deseja salvar as alterações realizados no Cadastro?',
      mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes:
        btnGravar.Click;
      mrNo:
        DataSource1.DataSet.Cancel;
    end
  else
    // LocalizarEx.Execute;
  end;

  procedure TfrmCadastro.btnNovoEnter(Sender: TObject);
  begin
    StatusBar1.Panels[0].Text := (Sender as TControl).Hint;
  end;

end.
