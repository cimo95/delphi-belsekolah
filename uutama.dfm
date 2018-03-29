object futama: Tfutama
  Left = 671
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Bel 1.0 BD7'
  ClientHeight = 453
  ClientWidth = 472
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'segoe ui'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object l2: TLabel
    Left = 9
    Top = 431
    Width = 228
    Height = 13
    Cursor = crNoDrop
    Caption = 'Hak Cipta '#169' 2018 Cimosoft Codelicious, Org'
    OnClick = l2Click
  end
  object l0: TLabel
    Left = 8
    Top = 6
    Width = 60
    Height = 17
    Caption = '-, 0 - 0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'segoe ui'
    Font.Style = []
    ParentFont = False
  end
  object l1: TLabel
    Left = 8
    Top = 22
    Width = 129
    Height = 25
    Caption = '00:00:00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l7: TLabel
    Left = 329
    Top = 10
    Width = 134
    Height = 34
    Caption = 'Bel BD7'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = 'Rockwell Extra Bold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l8: TLabel
    Left = 328
    Top = 8
    Width = 134
    Height = 34
    Caption = 'Bel BD7'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = 'Rockwell Extra Bold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lv0: TListView
    Left = 8
    Top = 56
    Width = 457
    Height = 361
    BorderStyle = bsNone
    Color = clWhite
    Columns = <
      item
        Caption = 'Tanggal'
        Width = 110
      end
      item
        Caption = 'Waktu'
        Width = 110
      end
      item
        Caption = 'Nada'
        Width = 110
      end
      item
        Caption = 'Keterangan'
        Width = 110
      end>
    Ctl3D = False
    GridLines = True
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lv0Click
    OnDblClick = lv0DblClick
  end
  object p0: TPanel
    Left = 85
    Top = 104
    Width = 280
    Height = 241
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    Visible = False
    object gb0: TGroupBox
      Left = 0
      Top = 0
      Width = 280
      Height = 241
      Align = alClient
      Caption = 'Penjadwalan'
      TabOrder = 0
      object l4: TLabel
        Left = 22
        Top = 97
        Width = 43
        Height = 13
        Caption = 'Waktu : '
      end
      object l5: TLabel
        Left = 22
        Top = 120
        Width = 36
        Height = 13
        Caption = 'Nada : '
      end
      object l6: TLabel
        Left = 22
        Top = 144
        Width = 28
        Height = 13
        Caption = 'Ket. : '
      end
      object rb0: TRadioButton
        Left = 8
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Harian'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rb0Click
      end
      object rb1: TRadioButton
        Left = 72
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Tanggal'
        TabOrder = 1
        OnClick = rb1Click
      end
      object clb0: TCheckListBox
        Left = 11
        Top = 40
        Width = 262
        Height = 49
        Columns = 2
        ItemHeight = 13
        Items.Strings = (
          'Senin'
          'Selasa'
          'Rabu'
          'Kamis'
          'Jum'#39'at'
          'Sabtu')
        TabOrder = 2
      end
      object p1: TPanel
        Left = 11
        Top = 40
        Width = 262
        Height = 49
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object l3: TLabel
          Left = 22
          Top = 5
          Width = 50
          Height = 13
          Caption = 'Dari tgl. : '
        end
        object dtp0: TDateTimePicker
          Left = 90
          Top = 2
          Width = 165
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          Date = 43187.162015729170000000
          Format = 'dddd, ddMMMMyyyy'
          Time = 43187.162015729170000000
          TabOrder = 0
          OnChange = dtp0Change
        end
        object chb0: TCheckBox
          Left = 7
          Top = 28
          Width = 97
          Height = 17
          Caption = 'Ke tgl. :'
          TabOrder = 1
          OnClick = chb0Click
        end
        object dtp1: TDateTimePicker
          Left = 90
          Top = 27
          Width = 165
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          Date = 43187.162015729170000000
          Format = 'dddd, ddMMMMyyyy'
          Time = 43187.162015729170000000
          Enabled = False
          TabOrder = 2
          OnChange = dtp1Change
        end
      end
      object dtp2: TDateTimePicker
        Left = 64
        Top = 93
        Width = 73
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Date = 43187.164186331020000000
        Format = 'HH:mm'
        Time = 43187.164186331020000000
        Kind = dtkTime
        TabOrder = 4
      end
      object e0: TEdit
        Left = 64
        Top = 118
        Width = 169
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object b3: TButton
        Left = 237
        Top = 118
        Width = 27
        Height = 21
        Caption = '...'
        TabOrder = 6
        OnClick = b3Click
      end
      object m0: TMemo
        Left = 64
        Top = 144
        Width = 201
        Height = 57
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object b5: TButton
        Left = 192
        Top = 208
        Width = 75
        Height = 25
        Caption = 'RESET'
        TabOrder = 8
        OnClick = b5Click
      end
      object b4: TButton
        Left = 112
        Top = 209
        Width = 75
        Height = 25
        Caption = 'SIMPAN'
        TabOrder = 9
        OnClick = b4Click
      end
    end
    object b7: TButton
      Left = 255
      Top = 0
      Width = 25
      Height = 25
      Caption = 'X'
      TabOrder = 1
      OnClick = b7Click
    end
  end
  object b0: TButton
    Left = 248
    Top = 424
    Width = 50
    Height = 25
    Caption = 'TAMBAH'
    TabOrder = 2
    OnClick = b0Click
  end
  object b1: TButton
    Left = 304
    Top = 424
    Width = 50
    Height = 25
    Caption = 'UBAH'
    TabOrder = 3
    OnClick = b1Click
  end
  object b2: TButton
    Left = 360
    Top = 424
    Width = 50
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = b2Click
  end
  object b6: TButton
    Left = 416
    Top = 423
    Width = 50
    Height = 25
    Caption = 'MENU'
    TabOrder = 5
    OnClick = b6Click
  end
  object mp0: TMediaPlayer
    Left = 96
    Top = 360
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 6
  end
  object pm0: TPopupMenu
    Left = 382
    Top = 137
    object pm0mm0: TMenuItem
      Caption = 'Cari'
      OnClick = pm0mm0Click
    end
    object pm0mm1: TMenuItem
      Caption = 'Putar / Berhenti'
      OnClick = pm0mm1Click
    end
  end
  object t0: TTimer
    OnTimer = t0Timer
    Left = 24
    Top = 120
  end
  object pm1: TPopupMenu
    Left = 390
    Top = 169
    object pm1mm0: TMenuItem
      Caption = 'Aktifkan Monitor Jadwal'
      OnClick = pm1mm0Click
    end
    object pm1mm1: TMenuItem
      Caption = 'Jalankan ketika windows mulai'
      Checked = True
      OnClick = pm1mm1Click
    end
    object pm1mm2: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object pm1mm3: TMenuItem
      Caption = 'Tentang'
      OnClick = pm1mm3Click
    end
  end
end
