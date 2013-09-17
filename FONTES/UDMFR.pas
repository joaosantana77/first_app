unit UDMFR;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet;

type
  TDMFR = class(TDataModule)
    frxReport1: TfrxReport;
    frxAtendimento: TfrxDBDataset;
    frxCadPes: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFR: TDMFR;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDM, UAtendimento;

{$R *.dfm}

end.
