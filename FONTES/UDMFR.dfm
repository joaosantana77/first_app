object DMFR: TDMFR
  OldCreateOrder = False
  Height = 242
  Width = 380
  object frxReport1: TfrxReport
    Version = '4.12.13'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41518.878693506900000000
    ReportOptions.LastChange = 41520.444579328700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 56
    Datasets = <
      item
        DataSet = frxCadPes
        DataSetName = 'frxCadPes'
      end
      item
        DataSet = frxAtendimento
        DataSetName = 'frxAtendimento'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 294.614363500000000000
          Top = 79.370130000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Memo.UTF8W = (
            'Ficha Clinica')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 18.897650000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 52.913420000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 102.047310000000000000
          Width = 737.008350000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 638.740570000000000000
        Top = 147.401670000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object frxCadPesNOME: TfrxMemoView
          Left = 64.252010000000000000
          Top = 3.779529999999994000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NOME'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxCadPes."NOME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 457.323130000000000000
          Top = 3.779529999999994000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'RG:')
        end
        object frxCadPesRG: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'RG'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."RG"]')
        end
        object Memo4: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779529999999994000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Idade:')
        end
        object frxCadPesNASCIMENTO: TfrxMemoView
          Left = 650.079160000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NASCIMENTO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."NASCIMENTO"]')
        end
        object Memo5: TfrxMemoView
          Left = 6.559060000000000000
          Top = 30.236240000000010000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Endere'#231'o:')
        end
        object frxCadPesENDERECO: TfrxMemoView
          Left = 83.149660000000000000
          Top = 30.236240000000010000
          Width = 589.606680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ENDERECO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."ENDERECO"]')
        end
        object frxCadPesBAIRRO: TfrxMemoView
          Left = 83.149660000000000000
          Top = 52.913420000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'BAIRRO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."BAIRRO"]')
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 53.692950000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Bairro:')
        end
        object Memo7: TfrxMemoView
          Left = 351.496290000000000000
          Top = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Cidade:')
        end
        object frxCadPesCIDADE: TfrxMemoView
          Left = 404.409710000000000000
          Top = 52.913420000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CIDADE'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."CIDADE"]')
        end
        object Memo8: TfrxMemoView
          Left = 672.756340000000000000
          Top = 52.913420000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'UF:')
        end
        object frxCadPesUF: TfrxMemoView
          Left = 710.551640000000000000
          Top = 52.913420000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'UF'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."UF"]')
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 79.370129999999990000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Fone:')
        end
        object frxCadPesFONE: TfrxMemoView
          Left = 83.149660000000000000
          Top = 79.370129999999990000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'FONE'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."FONE"]')
        end
        object Memo10: TfrxMemoView
          Left = 351.496290000000000000
          Top = 79.370129999999990000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Naturalidade:')
        end
        object frxCadPesNATURALIDADE: TfrxMemoView
          Left = 445.984540000000000000
          Top = 79.370129999999990000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NATURALIDADE'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."NATURALIDADE"]')
        end
        object Memo11: TfrxMemoView
          Left = 7.559060000000000000
          Top = 105.826840000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Nascim.:')
        end
        object frxCadPesNASCIMENTO1: TfrxMemoView
          Left = 83.149660000000000000
          Top = 105.826840000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[frxCadPes."NASCIMENTO"]')
        end
        object Memo12: TfrxMemoView
          Left = 291.023810000000000000
          Top = 105.826840000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Sexo:')
        end
        object frxCadPesSEXO: TfrxMemoView
          Left = 366.614410000000000000
          Top = 105.826840000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'SEXO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."SEXO"]')
        end
        object Memo13: TfrxMemoView
          Left = 521.575140000000000000
          Top = 105.826840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Estado Civil:')
        end
        object frxCadPesESTADOCIVIL: TfrxMemoView
          Left = 608.504330000000000000
          Top = 105.826840000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ESTADOCIVIL'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."ESTADOCIVIL"]')
        end
        object frxAtendimentoHISTORIA: TfrxMemoView
          Left = 7.559060000000000000
          Top = 264.567100000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          ShowHint = False
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.RightLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          Memo.UTF8W = (
            '[frxAtendimento."HISTORIA"]')
        end
        object frxAtendimentoANTECEDENTES: TfrxMemoView
          Left = 7.559060000000000000
          Top = 347.716760000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DataField = 'ANTECEDENTES'
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxAtendimento."ANTECEDENTES"]')
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Top = 241.889920000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Hist'#243'ria da doen'#231'a atual')
        end
        object Memo15: TfrxMemoView
          Left = 10.338590000000000000
          Top = 128.504020000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Filia'#231#227'o:')
        end
        object frxCadPesFILIACAO: TfrxMemoView
          Left = 82.724490000000000000
          Top = 128.504020000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'FILIACAO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."FILIACAO"]')
        end
        object Memo16: TfrxMemoView
          Left = 10.338590000000000000
          Top = 151.181200000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Profiss'#227'o:')
        end
        object frxCadPesPROFISSAO: TfrxMemoView
          Left = 83.149660000000000000
          Top = 151.181200000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PROFISSAO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."PROFISSAO"]')
        end
        object Memo17: TfrxMemoView
          Left = 351.496290000000000000
          Top = 151.181200000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Conv'#234'nio:')
        end
        object frxCadPesCONVENIO: TfrxMemoView
          Left = 445.984540000000000000
          Top = 151.181200000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CONVENIO'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."CONVENIO"]')
        end
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 173.858380000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'CPF:')
        end
        object Memo19: TfrxMemoView
          Left = 351.496290000000000000
          Top = 173.858380000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Emiss'#227'o RG:')
        end
        object frxCadPesCPF: TfrxMemoView
          Left = 83.149660000000000000
          Top = 173.858380000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CPF'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."CPF"]')
        end
        object frxCadPesEMISSAORG: TfrxMemoView
          Left = 445.984540000000000000
          Top = 173.858380000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EMISSAORG'
          DataSet = frxCadPes
          DataSetName = 'frxCadPes'
          Memo.UTF8W = (
            '[frxCadPes."EMISSAORG"]')
        end
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Top = 211.653680000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Data Atend.:')
        end
        object frxAtendimentoDATA: TfrxMemoView
          Left = 102.047310000000000000
          Top = 211.653680000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[frxAtendimento."DATA"]')
        end
        object Memo21: TfrxMemoView
          Left = 192.756030000000000000
          Top = 211.653680000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Diagn'#243'stico:')
        end
        object frxAtendimentoDIAGNOSTICO1: TfrxMemoView
          Left = 275.905690000000000000
          Top = 211.653680000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DIAGNOSTICO'
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          Memo.UTF8W = (
            '[frxAtendimento."DIAGNOSTICO"]')
        end
        object Line1: TfrxLineView
          Left = 7.559060000000000000
          Top = 230.551330000000000000
          Width = 725.669760000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo22: TfrxMemoView
          Left = 7.559060000000000000
          Top = 325.039580000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Antecedentes')
        end
        object Memo23: TfrxMemoView
          Left = 7.559060000000000000
          Top = 396.850650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Exame F'#237'sico - PA:')
        end
        object frxAtendimentoPA: TfrxMemoView
          Left = 139.842610000000000000
          Top = 396.850650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxAtendimento."PA"]')
        end
        object Memo24: TfrxMemoView
          Left = 279.685220000000000000
          Top = 396.850650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'FC:')
        end
        object frxAtendimentoFC: TfrxMemoView
          Left = 317.480520000000000000
          Top = 396.850650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxAtendimento."FC"]')
        end
        object Memo25: TfrxMemoView
          Left = 423.307360000000000000
          Top = 396.850650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'PESO:')
        end
        object frxAtendimentoPESO: TfrxMemoView
          Left = 487.559370000000000000
          Top = 396.850650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxAtendimento."PESO"]')
        end
        object Memo26: TfrxMemoView
          Left = 597.165740000000000000
          Top = 396.850650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'ALTURA:')
        end
        object frxAtendimentoALTURA: TfrxMemoView
          Left = 676.535870000000000000
          Top = 396.850650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxAtendimento."ALTURA"]')
        end
        object Memo27: TfrxMemoView
          Left = 7.559060000000000000
          Top = 427.086890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Conduta')
        end
        object frxAtendimentoCONDUTA: TfrxMemoView
          Left = 7.559060000000000000
          Top = 445.984540000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DataField = 'CONDUTA'
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxAtendimento."CONDUTA"]')
        end
        object Memo28: TfrxMemoView
          Left = 7.559060000000000000
          Top = 498.897960000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Evolu'#231#227'o')
        end
        object frxAtendimentoEVOLUCAO: TfrxMemoView
          Left = 7.559060000000000000
          Top = 517.795610000000000000
          Width = 718.110700000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DataField = 'EVOLUCAO'
          DataSet = frxAtendimento
          DataSetName = 'frxAtendimento'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxAtendimento."EVOLUCAO"]')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 612.283860000000000000
          Top = 604.724800000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[DATE]')
        end
      end
    end
  end
  object frxAtendimento: TfrxDBDataset
    UserName = 'frxAtendimento'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IDACOMP=IDACOMP'
      'IDPESSOA=IDPESSOA'
      'IDATENDENTE=IDATENDENTE'
      'DATA=DATA'
      'DIAGNOSTICO=DIAGNOSTICO'
      'HISTORIA=HISTORIA'
      'ANTECEDENTES=ANTECEDENTES'
      'PA=PA'
      'FC=FC'
      'PESO=PESO'
      'ALTURA=ALTURA'
      'CONDUTA=CONDUTA'
      'EVOLUCAO=EVOLUCAO')
    DataSet = F_Atend.cdsAcomp
    BCDToCurrency = False
    Left = 144
    Top = 32
  end
  object frxCadPes: TfrxDBDataset
    UserName = 'frxCadPes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IDPESSOA=IDPESSOA'
      'NOME=NOME'
      'ENDERECO=ENDERECO'
      'BAIRRO=BAIRRO'
      'CIDADE=CIDADE'
      'FONE=FONE'
      'UF=UF'
      'CPF=CPF'
      'RG=RG'
      'EMISSAORG=EMISSAORG'
      'NASCIMENTO=NASCIMENTO'
      'NATURALIDADE=NATURALIDADE'
      'PROFISSAO=PROFISSAO'
      'FILIACAO=FILIACAO'
      'SEXO=SEXO'
      'CONVENIO=CONVENIO'
      'ALTURA=ALTURA'
      'ESTADOCIVIL=ESTADOCIVIL')
    DataSet = DM.cdsCadPes
    BCDToCurrency = False
    Left = 144
    Top = 88
  end
end
