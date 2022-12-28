object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 400
  ClientWidth = 720
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = EventFormCreate
  OnShow = FormShow
  DesignSize = (
    720
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 720
    Height = 400
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = clSilver
    ExplicitLeft = -1
  end
  object BtnClose: TButton
    Left = 594
    Top = 367
    Width = 118
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fira Code'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = EventMinimize
    OnKeyPress = EventDefaultKeyPress
    ExplicitLeft = 364
    ExplicitTop = 140
  end
  object MemoContent: TMemo
    Left = 8
    Top = 43
    Width = 498
    Height = 318
    ScrollBars = ssBoth
    TabOrder = 2
    OnKeyPress = EventDefaultKeyPress
  end
  object BtnSave: TButton
    Left = 441
    Top = 367
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fira Code'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = False
    OnClick = EventSaveClick
    OnKeyPress = EventDefaultKeyPress
  end
  object BtnDelete: TButton
    Left = 299
    Top = 367
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Delete'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fira Code'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TabStop = False
    OnClick = EventDeleteClick
    OnKeyPress = EventDefaultKeyPress
  end
  object EdtApp: TEdit
    Left = 8
    Top = 16
    Width = 498
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdtAppChange
    OnKeyDown = EventAppKeyDown
    OnKeyPress = EventDefaultKeyPress
  end
  object BtnClear: TButton
    Left = 370
    Top = 367
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fira Code'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TabStop = False
    OnClick = EventClearClick
    OnKeyPress = EventDefaultKeyPress
  end
  object ListBox: TListBox
    Left = 512
    Top = 16
    Width = 200
    Height = 345
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Fira Code'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 1
    OnDblClick = EventListBoxDblClick
    OnKeyDown = EventListBoxKeyDown
    OnKeyPress = EventDefaultKeyPress
  end
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 64
    object ShowForm: TMenuItem
      Caption = 'Show'
      OnClick = EventShow
    end
    object Close1: TMenuItem
      Caption = 'Exit'
      OnClick = EventExitClick
    end
  end
  object TrayIcon1: TTrayIcon
    Icon.Data = {
      0000010001002020000001002000A81000001600000028000000200000004000
      0000010020000000000000100000333A0000333A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000100FD030400FA040800F7040B00F3040E00F0041200ED041500E9041800
      E6041C00E2041F00DF042200DB042500D8042900D4042C00D1033000CC003100
      CC002E00CF003000CC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF010000
      FF020000FF000000FF000200FD00000000000000000000000000000000000000
      00000000000000000000000000003600C6003200CB003200CB003200CB023300
      CA013300CA003300CA0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000400FB010000
      FF020100FE4F0400FB8B0800F78C0B00F48C0E00F08C1100ED8C1500EA8C1800
      E68C1B00E38C1F00DF8C2200DC8C2500D88C2800D58B2C00D24F3400C8023600
      C7012D00D0003300CB003700C500000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000200FD010000FF000000
      FFA50200FDFF0600F9FD0900F6FF0C00F2FF0F00EFFF1300EBFF1600E8FF1900
      E5FF1D00E1FF2000DEFF2300DAFF2600D7FF2A00D4FD2D00D0FF3000CDA50000
      FF003000CD012D00D0003A00C2003C00C2000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF040000FF000000FF680100
      FEFF0400FAFA0800F7FA0B00F4FB0E00F0FB1200EDFB1500E9FB1800E6FB1B00
      E2FB1F00DFFB2200DCFB2500D8FB2900D5FB2C00D1FA2F00CEFA3300CAFF3500
      C8683400C9003500C8044100BB003F00BE000000000000000000000000000000
      0000000000000000FF000000FF000000FF010000FF000000FF150000FFE40300
      FCFF0600F8FD0A00F5FF0E02F2FF1202EEFF1502EBFF1802E8FF1C02E4FF1F02
      E1FF2202DDFF2502DAFF2902D7FF2C02D3FF2E00CFFF3100CCFD3400C8FF3800
      C5E43C00C1153900C3003800C5014200BA004400B90000000000000000000000
      0000000000000000FF000000FF000000FF040000FF000000FF8D0100FEFF0500
      FAFB0900F7FF0E02F3FF0700EFFF0700EBFF0C00E8FF1000E4FF1100E0FF1500
      DCFF1A00D9FF1D00D6FF1F00D2FF2500CFFF3102CEFF3300CAFF3600C7FB3A00
      C3FF3C00C08E3A00C2003C00C004630097004600B60000000000000000000000
      00000000FF000000FF000000FF020000FF000000FF2F0000FFF80300FBFF0700
      F8FE0901F4FF0400F0FF3123F0FF4535EFFF412EEBFF402AE8FF4E36E7FF4F36
      E6FF482AE0FF4E2EDDFF5A39DDFF4C25D6FF2800C9FF3401C8FF3800C5FE3B00
      C1FF3F00BEF94200BB2F4000BC004000BC024900B2004B00B100000000000000
      00000000FF000000FF000100FE020000FF000000FFB10200FDFF0600F9FC0A01
      F6FF0500F2FF9A95F9FFD7D4FBFFBBB5F8FFD3CEFAFFEDECFEFFC4BCF7FFCCBC
      EEFFF1EBF9FFD6CFF7FFB7A7EEFFD7CEF5FFAA96E9FF3000C4FF3B01C3FF3D00
      BFFC4100BBFF4400B9B23D00BF004300B9023C00C1004D00AE00000000000000
      FF000000FF000000FF030000FF000000FF4E0100FEFF0400FBFD0A03F8FF0000
      F3FF544BF5FFCAC5FAFF1100EAFF0100E4FF5244E9FFB7B6FCFF0A00DEFF2D00
      B9FFCDB7E6FF563CDDFF603FDAFF4E22D1FFCBBEF1FF744CD5FF3000BDFF4103
      BEFF4200BAFD4600B6FF4800B34F4700B5004800B4035500A7005200AA000000
      FF000000FF010000FF000000FF070000FFD00200FCFF0600F9FD0D04F6FF0000
      F1FF776EF6FF9795F6FF0100E6FF1300E3FF5943E8FFBBB8FCFF1700E0FF3800
      BDFFCFB9E8FF5937DCFFD5CBF5FF7351D8FF9682E2FF9472DDFF2E00BAFF4404
      BCFF4400B8FD4800B4FF4B00B1D15300A8075100AB004A00B2015500A6000000
      FF000000FF030000FF000000FF720100FEFF0500FAFB0700F7FF1005F4FF0000
      EEFF746DF5FFA198F6FF0700E4FF1200E1FF5C44E6FFB4B4FBFF0500DDFF2900
      B8FFC9B6E5FF5D39DBFFD2C7F4FF7752D8FF9F85E3FF9170DBFF2E00B7FF4705
      BBFF4600B6FF4900B2FB4D00AFFF5000AC744E00AD004F00AD03760083000000
      FF020000FF000000FF1B0000FFEA0300FCFF0600F8FE0B00F5FF0902F1FF0300
      ECFF7F75F4FF9D94F4FF0A00E2FF1800DFFF4A2FE2FFD6D4FDFF5943E9FF7144
      CFFFE3D5F1FF4C22D3FFD4CAF4FF7751D6FF9C81E1FF9A78DBFF3600B7FF4202
      B6FF4900B4FF4B00B0FE4F00ADFF5200A9EB5500A61C5500A6005400A8020000
      FF040000FF000000FF910200FDFF0500FAFB0A02F6FF0400F3FF372BF1FFD7D4
      FAFFFFFFFFFF958CF1FF0000DFFF2708DFFF1D00DAFF806BE7FFC9BDF3FFC8BD
      F4FF866BE2FF2A00C7FF5B2ED1FF2E00BFFFA289E0FFFFFFFFFFDFD5F2FF662C
      C1FF4400B0FF4F02AFFF5000ABFB5400A7FF5700A5925600A5005500A6040000
      FF000000FF020100FED80300FBFF0700F8FD0E04F5FF0000F0FF8077F3FFE0E1
      FFFF7773FCFFFBFBFEFF7A69EAFF0D00D9FF2604D9FF1D01D4FF1D00D0FF2100
      CCFF2701C9FF3704C9FF2000BDFF8767D9FFFCFBFEFFA273CEFFECE0F3FF9D77
      D6FF3E00AAFF5204AEFF5200A9FD5600A5FF5900A2D86F008C01660095000000
      FF000000FF000200FCD50500F9FF0900F6FD0D01F2FF0B00EFFF2312ECFFDBD8
      F9FFBAB9FEFF6058F7FFF6F7FFFFAB9CEEFF1A00D4FF2804D3FF3206D1FF3506
      CEFF3204C9FF2C00C2FFB39DE7FFFAF7FCFF8B57C9FFD1B9E7FFE2D8F3FF5713
      B6FF4B00ADFF5201ABFF5400A7FD5800A3FF5B00A0D40F00F000750085000600
      F9040500FA000500FA860700F8FF0B00F4FB0E00F0FF1301EDFF0D00E9FF1909
      E5FFCCC4F6FFDCDBFEFF5749F1FFDAD7FCFFD7CDF5FF310FD2FF2600CCFF2A00
      C9FF3B0FC8FFD8CDF3FFE2D7F3FF7C49C9FFE9DEF4FFD2C2EDFF4A0AB3FF4700
      ADFF5101ACFF5300A8FF5600A5FB5A00A1FF5C009F845C009F005B00A0040800
      F7010500FA000500FA130900F5E20D00F2FF1000EEFE1300EBFF1C05E8FF0700
      E2FF635BEBFFFEFCFEFFE7E6FDFF6352EDFFB3AAF5FFF7F4FBFF4F28D2FF5127
      CFFFF6F4FCFFBFAAE9FF7F52D0FFFBFAFDFFB093E0FF3B00AFFF4902B0FF5002
      AEFF5100AAFF5500A7FE5800A3FF5B00A0E15E009D125F009C005D009E010000
      FF000C00F2030D00F2000C00F3650E00F0FF1200ECFC1500E9FF1B04E6FF0A00
      E0FF8472EEFF9389F1FF7556DDFFFFFFFFFF7F6DEDFF8D7AECFFFDFCFDFFFCFC
      FEFF977BE1FF916FDCFFFFFFFFFF8B63D3FF3500AFFF4B04B3FF4E01AFFF5000
      ABFF5400A8FF5700A5FC5A00A1FF5D009E645D009E005C009F035C009F000600
      F8001300EB001400EA010000FF011100EEC61400EBFF1700E7FD1D04E4FF0B00
      DDFF826FECFF968AF1FF3F19CBFFE4DDF6FFF0EDFAFFAA9CF1FF6F52E2FF7452
      DCFFAE99E9FFFBF9FCFF6939C7FF3500B1FF4C05B5FF4C01B0FF4F00ADFF5200
      A9FF5500A6FD5900A2FF5C009FC57E007C015100AB015D009E005C009F000900
      F5000E00F1001400EA031400EA001300EB431500E9FF1900E5FE1F04E2FF0E00
      DBFF826EEBFF9B8FF2FF5A2FD3FFC5BBF0FF340CCEFFE6DFF6FFCEC5F5FFCFC5
      F5FFE6DDF4FF4D19C0FF3800B5FF4B04B7FF4A00B2FF4D00AEFF5100ABFF5400
      A7FF5700A4FE5B00A0FF5D009E425D009E005C009F035A00A1005D009E000000
      00000E00F0002B00D2001800E6031B00E3001800E6A51B00E3FF2002E0FC1B00
      DBFF4425DEFFD3CBF7FFE3DCF8FF8C70E4FF1F00C7FF350AC7FFAC94E4FFAE94
      E3FF3C07BCFF3C00B8FF4903B8FF4800B3FF4C00B0FF4F00ACFF5300A9FF5600
      A6FC5900A2FF5C009FA45B00A0005A00A1035F009C005C009F00000000000000
      00001000EE001200EC001C00E2021B00E3001A00E4251D00E1F22000DEFF2500
      DAFE2000D6FF330FD5FF431BD5FF2900CBFF3602CAFF3602C6FF2A00BEFF2E00
      BAFF4002BBFF4602B9FF4700B4FF4B00B1FF4E00AEFF5100AAFF5400A7FE5800
      A3FF5B00A0F25E009D255E009D005D009E025C009F005D009E00000000000000
      0000000000001500E9000C00F3001F00DE042100DD001F00DF802200DCFF2500
      D8FB2A01D5FF2901D1FF2900CDFF3402CBFF3500C7FF3901C4FF3F04C1FF4204
      BEFF4301BAFF4600B6FF4900B3FF4D00AFFF5000ACFF5300A8FF5600A5FB5A00
      A1FF5C009F805C009F005C00A0045B00A0005D009E0000000000000000000000
      0000000000001700E6001A00E4002400D9012100DC001F00DF0E2400DADC2700
      D6FF2A00D3FD2E01D0FF3201CCFF3400C9FF3700C5FF3B00C2FF3E00BEFF4100
      BBFF4500B7FF4800B4FF4B00B1FF4E00ADFF5200AAFF5500A6FD5800A3FF5C00
      A0DB5F009C0E620099005D009E015C009F005D009D0000000000000000000000
      000000000000000000001C00E1001B00E3002700D7032700D6002600D75B2900
      D4FF2C00D1FB2F00CEFB3300CAFB3600C7FB3900C3FB3D00C0FB4000BCFB4300
      B9FB4600B6FB4A00B2FB4D00AFFB5000ABFB5400A8FB5700A4FB5B00A1FF5D00
      9E5B5D009E005C009F035D009E005D009E000000000000000000000000000000
      00000000000000000000000000002100DC003300CA002B00D2023400C8002B00
      D2912E00CFFF3200CBFE3500C8FF3800C4FF3B00C1FF3F00BEFF4200BAFF4500
      B7FF4900B3FF4C00B0FF4F00ACFF5200A9FF5600A6FE5900A2FF5C009F925700
      A5005900A3025E009D005C009F00000000000000000000000000000000000000
      00000000000000000000000000002400DA002600D8003600C7002800D5023700
      C5003000CD3A3300CA733600C7753900C3753D00C0754000BC754300B9754700
      B5754A00B2754D00AF755000AB755400A8755700A4735A00A13A4E00AC005A00
      A1025D009E005B00A0005D009E00000000000000000000000000000000000000
      0000000000000000000000000000000000002800D5002900D5002900D5002900
      D4022900D4002A00D4002700D600000000000000000000000000000000000000
      00000000000000000000000000005700A4005F009C005E009D005B00A0025D00
      9E005D009E005C009F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002B00D2002D00D0002500D8002800
      D6002F00CE033200CA043600C7043900C3043C00C0044000BD044300B9044600
      B6044A00B2044D00AF045000AB045300A8045700A4045A00A1035F009C006100
      9A005B00A0005D009E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFD0000BFFA5FFA5FF800001FF100008FEA000057E4000027D400002BC800
      0013880000115000000A20000004A00000054000000240000002800000018000
      00034000000240000002A0000005000000009000000988000011C8000013D400
      002BE4000027EA000057F100008FF880011FFA5FFA5FFD0000BFFFFFFFFF}
    PopupMenu = PopupMenu1
    Visible = True
    OnDblClick = EventShow
    Left = 32
    Top = 16
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = EventMinimize
    Left = 104
    Top = 64
  end
  object Connection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 104
    Top = 16
  end
end
