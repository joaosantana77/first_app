unit UQrFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TF_QRFicha = class(TForm)
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_QRFicha: TF_QRFicha;

implementation

uses UDM, UAtendimento;

{$R *.dfm}

procedure TF_QRFicha.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

var I, cTam, cLin : Integer;
    vLab : TQRLabel;
    S : string;
begin
    S    := F_Atend.cdsAcompHISTORIA.AsString;
    I    := 1;
    cLin := 1;
    cTam := Length(S);
    while ((cTam > 0) and (I < 4)) do
    begin
       vLab := TQRLabel(FindComponent('QRHist'+IntToStr(i)));
       With vLab do
       begin
         Caption := Copy(S,cLin,60);
       end;
       cTam := cTam - 60;
       cLin := cLin + 60;
       I    := I + 1;
    end;

end;

end.
