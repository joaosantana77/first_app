unit UCadPacientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCadPadrao, DB, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, ComCtrls, Mask, SQLExpr;

type
  TF_CadPacientes = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBCbSexo: TDBComboBox;
    DBCbEstCiv: TDBComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadPacientes: TF_CadPacientes;

implementation

uses UDM;

{$R *.dfm}

procedure TF_CadPacientes.btnNovoClick(Sender: TObject);
var Qry: TSQLQuery;
begin
  inherited;
  Qry := TSQLQuery.Create(nil);  //cria uma instancia do
  try
     Qry.SQLConnection := DM.MEUSPACIENTES;  //o seu componente de conex�o com o banco
     Qry.SQL.Text := 'select max(idpessoa) from PESSOAS';
     Qry.Open;
     if not QRY.Fields[0].IsNull then   //se nao estiver vazia a tabela retornar� nulo
        DBEdit1.Text := IntToStr(QRY.Fields[0].AsInteger + 1)
     else
        DBEdit1.Text := '10001';

  finally
     FreeAndNil(QRY);    //libera o objeto da mem�ria
  end;
  DBEdit2.SetFocus;

end;

procedure TF_CadPacientes.FormCreate(Sender: TObject);
begin
  inherited;
  DataSource1.DataSet := DM.cdsCadPes;
  DataSource1.DataSet.Open;
end;

end.
