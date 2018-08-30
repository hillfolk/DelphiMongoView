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
    Height = 41
    Align = alTop
    TabOrder = 0
    object edtAddr: TRzEdit
      Left = 8
      Top = 8
      Width = 162
      Height = 21
      Text = 'localhost'
      TabOrder = 0
    end
    object ToggleSwitch1: TToggleSwitch
      Left = 304
      Top = 8
      Width = 72
      Height = 20
      TabOrder = 1
      OnClick = ToggleSwitch1Click
    end
    object nedtPort: TRzNumericEdit
      Left = 192
      Top = 8
      Width = 89
      Height = 21
      TabOrder = 2
      DisplayFormat = ',0;(,0)'
    end
    object cbDocument: TRzComboBox
      Left = 408
      Top = 8
      Width = 137
      Height = 21
      TabOrder = 3
    end
    object RzEdit1: TRzEdit
      Left = 568
      Top = 8
      Width = 129
      Height = 21
      Text = ''
      TabOrder = 4
    end
    object btnSearch: TRzButton
      Left = 703
      Top = 5
      Width = 89
      Caption = #51312#54924
      TabOrder = 5
      OnClick = btnSearchClick
    end
  end
  object mLog: TRzMemo
    Left = 0
    Top = 41
    Width = 804
    Height = 558
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 24
    ExplicitTop = 56
    ExplicitWidth = 737
    ExplicitHeight = 513
  end
end
