object VwMain: TVwMain
  Left = 0
  Top = 0
  Caption = 'Clone Item de Estoque'
  ClientHeight = 285
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 238
    Width = 772
    Height = 47
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 184
    ExplicitWidth = 505
    DesignSize = (
      772
      47)
    object btnSair: TBitBtn
      Left = 686
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      ModalResult = 11
      TabOrder = 0
      OnClick = btnSairClick
      ExplicitLeft = 360
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 238
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 47
    ExplicitWidth = 514
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Item Estoque I'
    end
    object Label2: TLabel
      Left = 400
      Top = 16
      Width = 75
      Height = 13
      Caption = 'Item Estoque II'
    end
    object btnCreateObjects: TBitBtn
      Left = 24
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 0
      OnClick = btnCreateObjectsClick
    end
    object btnCloneObjects: TBitBtn
      Left = 351
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Clonar'
      TabOrder = 1
      OnClick = btnCloneObjectsClick
    end
    object btnReset: TBitBtn
      Left = 678
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Reiniciar'
      TabOrder = 2
      OnClick = btnResetClick
    end
    object memItemI: TMemo
      Left = 24
      Top = 35
      Width = 353
      Height = 134
      TabOrder = 3
    end
    object memItemII: TMemo
      Left = 400
      Top = 35
      Width = 353
      Height = 134
      TabOrder = 4
    end
  end
end
