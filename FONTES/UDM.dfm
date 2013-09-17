object DM: TDM
  OldCreateOrder = False
  Height = 342
  Width = 474
  object sqlCadPes: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select idpessoa, nome, endereco, bairro, cidade,'#13#10' fone, uf, cpf' +
      ',rg, emissaorg, nascimento, naturalidade,'#13#10'profissao, filiacao, ' +
      'sexo, convenio, altura, estadocivil'#13#10' from PESSOAS order by nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = MEUSPACIENTES
    Left = 32
    Top = 96
  end
  object dspCadPes: TDataSetProvider
    DataSet = sqlCadPes
    Left = 96
    Top = 96
  end
  object cdsCadPes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadPes'
    BeforePost = cdsCadPesBeforePost
    BeforeDelete = cdsCadPesBeforeDelete
    Left = 152
    Top = 96
    object cdsCadPesIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsCadPesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsCadPesENDERECO: TStringField
      DisplayLabel = 'End.'
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsCadPesBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsCadPesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsCadPesFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 30
    end
    object cdsCadPesUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsCadPesCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsCadPesRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object cdsCadPesEMISSAORG: TDateField
      DisplayLabel = 'Org'#227'o Emissor'
      FieldName = 'EMISSAORG'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCadPesNASCIMENTO: TDateField
      DisplayLabel = 'Data Nasc.'
      FieldName = 'NASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCadPesNATURALIDADE: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALIDADE'
      Size = 30
    end
    object cdsCadPesPROFISSAO: TStringField
      DisplayLabel = 'Profiss'#227'o'
      FieldName = 'PROFISSAO'
      Size = 50
    end
    object cdsCadPesFILIACAO: TStringField
      DisplayLabel = 'Filia'#231#227'o'
      FieldName = 'FILIACAO'
      Size = 120
    end
    object cdsCadPesSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsCadPesCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 30
    end
    object cdsCadPesALTURA: TStringField
      FieldName = 'ALTURA'
      FixedChar = True
      Size = 4
    end
    object cdsCadPesESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 15
    end
  end
  object spCadPes_IU: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 60
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 60
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 50
        Name = 'BAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 50
        Name = 'CIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Precision = 2
        Name = 'UF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 30
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 30
        Name = 'NATURALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Precision = 4
        Name = 'NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Precision = 1
        Name = 'SEXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 15
        Name = 'ESTADOCIVIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 120
        Name = 'FILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 50
        Name = 'PROFISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 30
        Name = 'CONVENIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 14
        Name = 'CPF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 15
        Name = 'RG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Precision = 4
        Name = 'EMISSAORG'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Precision = 4
        Name = 'ALTURA'
        ParamType = ptInput
      end>
    SQLConnection = MEUSPACIENTES
    StoredProcName = 'PESSOAS_IU'
    Left = 208
    Top = 96
  end
  object spCadPes_D: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    SQLConnection = MEUSPACIENTES
    StoredProcName = 'PESSOAS_D'
    Left = 272
    Top = 96
  end
  object sqlCadUsu: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select IDUSUARIO, NOME, LOGIN, SENHA,'#13#10' CARGO, CRM, FONE,  ADMIN' +
      'ISTRADOR'#13#10' from USUARIOS ORDER BY NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = MEUSPACIENTES
    Left = 32
    Top = 160
  end
  object dspCadUsu: TDataSetProvider
    DataSet = sqlCadUsu
    Left = 96
    Top = 160
  end
  object cdsCadUsu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadUsu'
    BeforePost = cdsCadUsuBeforePost
    BeforeDelete = cdsCadUsuBeforeDelete
    Left = 152
    Top = 160
    object cdsCadUsuIDUSUARIO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'IDUSUARIO'
    end
    object cdsCadUsuNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object cdsCadUsuLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Size = 15
    end
    object cdsCadUsuSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 15
    end
    object cdsCadUsuCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
    end
    object cdsCadUsuCRM: TStringField
      FieldName = 'CRM'
      Size = 30
    end
    object cdsCadUsuFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 30
    end
  end
  object spCadUsu_IU: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 50
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 20
        Name = 'CARGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 30
        Name = 'CRM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 15
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 15
        Name = 'SENHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 30
        Name = 'FONE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Precision = 1
        Name = 'ADMINISTRADOR'
        ParamType = ptInput
      end>
    SQLConnection = MEUSPACIENTES
    StoredProcName = 'USUARIOS_IU'
    Left = 208
    Top = 160
  end
  object spCadUsu_D: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end>
    SQLConnection = MEUSPACIENTES
    StoredProcName = 'USUARIOS_D'
    Left = 280
    Top = 160
  end
  object sqlPesAtd: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select idpessoa, nome, endereco, bairro, cidade,'#13#10' fone, uf, cpf' +
      ',rg, emissaorg, nascimento, naturalidade,'#13#10'profissao, filiacao, ' +
      'sexo, convenio, altura, estadocivil'#13#10' from PESSOAS where idpesso' +
      'a = :IDPESSOA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    SQLConnection = MEUSPACIENTES
    Left = 32
    Top = 216
  end
  object dspPesAtd: TDataSetProvider
    DataSet = sqlPesAtd
    Left = 96
    Top = 216
  end
  object cdsPesAtd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesAtd'
    Left = 152
    Top = 216
    object cdsPesAtdIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object cdsPesAtdNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPesAtdENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsPesAtdBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsPesAtdCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsPesAtdFONE: TStringField
      FieldName = 'FONE'
      Size = 30
    end
    object cdsPesAtdUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPesAtdCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsPesAtdRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object cdsPesAtdEMISSAORG: TDateField
      FieldName = 'EMISSAORG'
    end
    object cdsPesAtdNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
    end
    object cdsPesAtdNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 30
    end
    object cdsPesAtdPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Size = 50
    end
    object cdsPesAtdFILIACAO: TStringField
      FieldName = 'FILIACAO'
      Size = 120
    end
    object cdsPesAtdSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsPesAtdCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Size = 30
    end
    object cdsPesAtdALTURA: TStringField
      FieldName = 'ALTURA'
      FixedChar = True
      Size = 4
    end
    object cdsPesAtdESTADOCIVIL: TStringField
      FieldName = 'ESTADOCIVIL'
      Size = 15
    end
  end
  object MEUSPACIENTES: TSQLConnection
    ConnectionName = 'MEUSPACIENTES'
    DriverName = 'FIREBIRD'
    LoginPrompt = False
    Params.Strings = (
      'drivername=FIREBIRD'
      'blobsize=-1'
      'commitretain=False'
      'Database=LOCALHOST:C:\MEUSPACIENTES\MEUSPACIENTES.FDB'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    BeforeConnect = MEUSPACIENTESBeforeConnect
    Left = 34
    Top = 26
  end
end
