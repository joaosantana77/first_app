inherited F_CadMed: TF_CadMed
  Left = 243
  Top = 120
  Caption = 'Cadastro de M'#233'dicos'
  ClientHeight = 469
  ClientWidth = 700
  OnCreate = FormCreate
  ExplicitLeft = 243
  ExplicitTop = 120
  ExplicitWidth = 716
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 31
    Top = 18
    Width = 38
    Height = 15
    Caption = 'Codigo'
    FocusControl = DBEdit1
  end
  inherited StatusBar1: TStatusBar
    Top = 450
    Width = 700
    ExplicitTop = 450
    ExplicitWidth = 700
  end
  inherited GroupBox1: TGroupBox
    Top = 395
    Width = 700
    ExplicitTop = 395
    ExplicitWidth = 700
  end
  inherited DBGrid1: TDBGrid
    Top = 235
    Width = 700
    Columns = <
      item
        Expanded = False
        FieldName = 'IDUSUARIO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONE'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SENHA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CRM'
        Visible = True
      end>
  end
  inherited DBNavigator1: TDBNavigator
    Hints.Strings = ()
  end
  object DBEdit1: TDBEdit [5]
    Left = 75
    Top = 15
    Width = 62
    Height = 23
    DataField = 'IDUSUARIO'
    DataSource = DataSource1
    TabOrder = 4
  end
  object TGroupBox [6]
    Left = 20
    Top = 56
    Width = 658
    Height = 153
    TabOrder = 5
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 31
      Height = 15
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 14
      Top = 53
      Width = 32
      Height = 15
      Caption = 'Cargo'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 418
      Top = 53
      Width = 25
      Height = 15
      Caption = 'CRM'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 14
      Top = 82
      Width = 32
      Height = 15
      Caption = 'Fones'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 20
      Top = 115
      Width = 29
      Height = 15
      Caption = 'Login'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 410
      Top = 116
      Width = 33
      Height = 15
      Caption = 'Senha'
      FocusControl = DBEdit7
    end
    object DBEdit2: TDBEdit
      Left = 52
      Top = 21
      Width = 543
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 52
      Top = 52
      Width = 304
      Height = 23
      DataField = 'CARGO'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 449
      Top = 50
      Width = 146
      Height = 23
      DataField = 'CRM'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 52
      Top = 81
      Width = 304
      Height = 23
      DataField = 'FONE'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 55
      Top = 112
      Width = 301
      Height = 23
      CharCase = ecUpperCase
      DataField = 'LOGIN'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 449
      Top = 112
      Width = 142
      Height = 23
      DataField = 'SENHA'
      DataSource = DataSource1
      PasswordChar = '*'
      TabOrder = 5
    end
  end
  inherited DataSource1: TDataSource
    DataSet = DM.cdsCadUsu
    Left = 336
    Top = 8
  end
end