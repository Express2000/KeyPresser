object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1078#1080#1084#1072#1090#1077#1083#1100
  ClientHeight = 108
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 55
    Height = 18
    AutoSize = False
    Caption = #1053#1072#1078#1080#1084#1072#1090#1100
    Visible = False
  end
  object Label2: TLabel
    Left = 269
    Top = 21
    Width = 17
    Height = 22
    AutoSize = False
    Caption = 'c.'
    Visible = False
  end
  object Label3: TLabel
    Left = 185
    Top = 21
    Width = 53
    Height = 18
    AutoSize = False
    Caption = #1082#1072#1078#1076#1099#1077
    Visible = False
  end
  object Button1: TButton
    Left = 69
    Top = 64
    Width = 110
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    Enabled = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 228
    Top = 18
    Width = 35
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    Text = '10'
    Visible = False
    OnChange = Edit1Change
    OnExit = Edit1Change
  end
  object Button2: TButton
    Left = 69
    Top = 16
    Width = 110
    Height = 25
    Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 232
    Top = 48
  end
end
