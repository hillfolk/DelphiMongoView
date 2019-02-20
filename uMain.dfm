object fxMongoDBView: TfxMongoDBView
  Left = 0
  Top = 0
  Caption = 'fxMongoDBView'
  ClientHeight = 599
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 106
      Top = 35
      Width = 29
      Height = 13
      Caption = 'Count'
    end
    object edtAddr: TRzEdit
      Left = 17
      Top = 5
      Width = 161
      Height = 20
      Text = 'localhost'
      TabOrder = 0
    end
    object ToggleSwitch1: TToggleSwitch
      Left = 304
      Top = 5
      Width = 72
      Height = 20
      TabOrder = 1
      OnClick = ToggleSwitch1Click
    end
    object nedtPort: TRzNumericEdit
      Left = 184
      Top = 5
      Width = 89
      Height = 20
      TabOrder = 2
      DisplayFormat = ',0;(,0)'
    end
    object cbDatabase: TRzComboBox
      Left = 408
      Top = 5
      Width = 137
      Height = 21
      TabOrder = 3
      Text = 'demo'
      OnChange = cbDatabaseChange
      Items.Strings = (
        'demo'
        'QG3')
    end
    object edtCollections: TRzEdit
      Left = 568
      Top = 5
      Width = 129
      Height = 20
      Text = 'restaurants'
      TabOrder = 4
    end
    object btnSearch: TRzButton
      Left = 703
      Top = 5
      Width = 72
      Height = 20
      Caption = #51312#54924
      TabOrder = 5
      OnClick = btnSearchClick
    end
    object cbLoop: TCheckBox
      Left = 17
      Top = 33
      Width = 48
      Height = 17
      Caption = 'Loop'
      TabOrder = 6
      OnClick = cbLoopClick
    end
    object neCount: TRzNumericEdit
      Left = 141
      Top = 31
      Width = 65
      Height = 21
      TabOrder = 7
      DisplayFormat = ',0;(,0)'
    end
  end
  object mLog: TRzMemo
    Left = 0
    Top = 65
    Width = 804
    Height = 534
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object tmrLoop: TTimer
    Enabled = False
    OnTimer = tmrLoopTimer
    Left = 88
    Top = 80
  end
end
