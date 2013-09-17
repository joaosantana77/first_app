object F_Backup: TF_Backup
  Left = 392
  Top = 227
  Caption = 'Backup dos arquivos'
  ClientHeight = 197
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 38
    Height = 13
    Caption = 'Origem:'
  end
  object Label2: TLabel
    Left = 24
    Top = 66
    Width = 40
    Height = 13
    Caption = 'Destino:'
  end
  object Label3: TLabel
    Left = 88
    Top = 45
    Width = 126
    Height = 13
    Caption = 'Escolha o Local de Destino'
  end
  object spbutOpen: TSpeedButton
    Left = 392
    Top = 63
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = spbutOpenClick
  end
  object edtDestino: TEdit
    Left = 80
    Top = 64
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object edtOrigem: TEdit
    Left = 80
    Top = 18
    Width = 313
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 156
    Width = 486
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      DoubleBuffered = True
      Kind = bkClose
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
