unit uutama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, xpman, StdCtrls, CheckLst, ExtCtrls, ComCtrls,
  Menus, DateUtils, MPlayer, inifiles, registry, utmw;

type
  Tfutama = class(TForm)
    lv0: TListView;
    p0: TPanel;
    gb0: TGroupBox;
    rb0: TRadioButton;
    rb1: TRadioButton;
    clb0: TCheckListBox;
    l4: TLabel;
    p1: TPanel;
    l3: TLabel;
    dtp0: TDateTimePicker;
    chb0: TCheckBox;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    l5: TLabel;
    e0: TEdit;
    b3: TButton;
    l6: TLabel;
    m0: TMemo;
    b5: TButton;
    b4: TButton;
    b0: TButton;
    b1: TButton;
    b2: TButton;
    l2: TLabel;
    l0: TLabel;
    l1: TLabel;
    l7: TLabel;
    l8: TLabel;
    pm0: TPopupMenu;
    pm0mm0: TMenuItem;
    pm0mm1: TMenuItem;
    t0: TTimer;
    b6: TButton;
    pm1: TPopupMenu;
    pm1mm0: TMenuItem;
    pm1mm1: TMenuItem;
    pm1mm2: TMenuItem;
    pm1mm3: TMenuItem;
    b7: TButton;
    mp0: TMediaPlayer;
    procedure rb0Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure b0Click(Sender: TObject);
    procedure chb0Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure t0Timer(Sender: TObject);
    procedure lv0Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure lv0DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure b7Click(Sender: TObject);
    procedure dtp0Change(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure pm0mm0Click(Sender: TObject);
    procedure pm0mm1Click(Sender: TObject);
    procedure pm1mm0Click(Sender: TObject);
    procedure pm1mm1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pm1mm3Click(Sender: TObject);
    procedure l2Click(Sender: TObject);
  private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }

    tmw: TMonitorWaktu;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
    ui0, ui1: integer;
    bubah, btambah, bharian: boolean;
  end;

var
  futama: Tfutama;

implementation

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

procedure pSimpanINI;
var
  tif: tinifile;
  i: integer;
begin
  tif := tinifile.Create(changefileext(application.ExeName, '.ini'));
  tif.WriteBool('Atur', 'MonitorLatar', futama.pm1mm0.Checked);
  tif.WriteBool('Atur', 'WindowsMulai', futama.pm1mm1.Checked);
  tif.EraseSection('Jadwal');
  for i := 0 to futama.lv0.Items.Count - 1 do
  begin
    tif.WriteString('Jadwal', 'T' + inttostr(i), futama.lv0.Items.Item[i].Caption);
    tif.WriteString('Jadwal', 'W' + inttostr(i), futama.lv0.Items.Item[i].SubItems.Strings[0]);
    tif.WriteString('Jadwal', 'N' + inttostr(i), futama.lv0.Items.Item[i].SubItems.Strings[1]);
    tif.WriteString('Jadwal', 'K' + inttostr(i), futama.lv0.Items.Item[i].SubItems.Strings[2]);
  end;
end;

procedure pBacaINI;
var
  tif: tinifile;
  i, j: integer;
  tsl: tstringlist;
  tli: tlistitem;
begin
  tif := tinifile.Create(changefileext(application.ExeName, '.ini'));
  futama.pm1mm0.Checked := tif.ReadBool('Atur', 'MonitorLatar', false);
  futama.pm1mm1.Checked := tif.ReadBool('Atur', 'WindowsMulai', true);
  tsl := tstringlist.Create;
  tif.ReadSection('jadwal', tsl);
  j := tsl.Count div 4;
  for i := 0 to j - 1 do
  begin
    tli := futama.lv0.Items.Add;
    tli.Caption := tif.ReadString('Jadwal', 'T' + inttostr(i), '');
    tli.SubItems.Add(tif.ReadString('Jadwal', 'W' + inttostr(i), ''));
    tli.SubItems.Add(tif.ReadString('Jadwal', 'N' + inttostr(i), ''));
    tli.SubItems.Add(tif.ReadString('Jadwal', 'K' + inttostr(i), ''));
  end;
end;

procedure Tfutama.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = ui1 then
    if application.MainForm.Visible then
    begin
      if pm1mm0.Checked then
        application.MainForm.Hide
      else
        exit;
    end
    else
    begin
      application.MainForm.Show;
      application.MainForm.SetFocus;
    end;
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.QuoteChar := '`';
  Strings.DelimitedText := Input; //'"' + StringReplace(Input, Delimiter, '"' + Delimiter + '"', [rfReplaceAll]) + '"' ;
end;

procedure Tfutama.rb0Click(Sender: TObject);
begin
  clb0.show;
  p1.Hide;
end;

procedure Tfutama.rb1Click(Sender: TObject);
begin
  p1.show;
  clb0.Hide;
end;

procedure Tfutama.b0Click(Sender: TObject);
var
  i: integer;
begin
  if bubah then
    exit;
  btambah := not btambah;
  p0.Visible := btambah;
  lv0.enabled := not btambah;
  b1.Enabled := not btambah;
  b2.Enabled := not btambah;
  if btambah then
  begin
    for i := 0 to clb0.Items.Count - 1 do
      clb0.Checked[i] := false;
  end;
end;

procedure Tfutama.chb0Click(Sender: TObject);
begin
  dtp1.Enabled := chb0.Checked;
end;

procedure Tfutama.b3Click(Sender: TObject);
begin
  pm0mm1.Enabled := fileexists(e0.Text);
  pm0.Popup(left + p0.Left + gb0.Left + b3.Left + 12, top + p0.Top + gb0.Top + b3.Top + b3.Height + 28);
end;

procedure Tfutama.t0Timer(Sender: TObject);
begin
  l0.Caption := formatdatetime('dddd, dd MMMM yyyy', now);
  l1.Caption := formatdatetime('hh:mm:ss', now);
end;

procedure Tfutama.lv0Click(Sender: TObject);
begin
  b1.Enabled := lv0.SelCount = 1;
  b2.Enabled := lv0.SelCount > 0;
end;

procedure Tfutama.b1Click(Sender: TObject);
var
  b: boolean;
  i, j: integer;
  tsl: tstringlist;
begin
  if btambah then
    exit;
  if lv0.SelCount <> 1 then
    exit;
  try
    strtodate(lv0.Items.Item[lv0.itemindex].Caption);
    b := true;
  except
    b := false;
  end;
  if b then
  begin
    rb1.Checked := true;
    rb1Click(futama);
    dtp1.Enabled := not bubah;
    chb0.Enabled := not bubah;
    dtp0.Date := strtodate(lv0.Items.Item[lv0.itemindex].Caption);
    dtp2.Time := strtotime(lv0.Items.Item[lv0.itemindex].subitems.Strings[0]);
    e0.Text := lv0.Items.Item[lv0.itemindex].subitems.Strings[1];
    m0.Text := lv0.Items.Item[lv0.itemindex].subitems.Strings[2];
  end
  else
  begin
    rb0.Checked := true;
    rb0Click(futama);
    tsl := tstringlist.Create;
    split(',', lv0.Items.Item[lv0.itemindex].Caption, tsl);
    for i := 0 to tsl.Count - 1 do
      for j := 0 to clb0.Items.Count - 1 do
        if ansilowercase(tsl.Strings[i]) = ansilowercase(copy(clb0.Items.Strings[j], 0, 3)) then
          clb0.Checked[j] := true;
    dtp2.Time := strtotime(lv0.Items.Item[lv0.itemindex].subitems.Strings[0]);
    e0.Text := lv0.Items.Item[lv0.itemindex].subitems.Strings[1];
    m0.Text := lv0.Items.Item[lv0.itemindex].subitems.Strings[2];
  end;
  bubah := not bubah;
  p0.Visible := bubah;
  lv0.Enabled := not p0.Visible;
  rb0.Enabled := not bubah;
  rb1.Enabled := not bubah;
  dtp1.Enabled := not bubah;
  chb0.Enabled := not bubah;
  b0.Enabled := not bubah;
  b2.Enabled := not bubah;
end;

procedure Tfutama.b2Click(Sender: TObject);
begin
  if lv0.SelCount = 0 then
    exit;
  if messagebox(handle, pchar('Apakah anda yakin ingin menghapus ' + inttostr(lv0.SelCount) + ' item jadwal ?'), 'Hapus Jadwal', 48 + 4) = mrno then
    exit
  else
    lv0.DeleteSelected;
  pSimpanINI;
end;

procedure Tfutama.b4Click(Sender: TObject);
var
  tli: tlistitem;
  i: integer;
  s: string;
  td: tdate;
begin
  if not bubah then
  begin
    if rb0.Checked then
    begin
      for i := 0 to clb0.Items.Count - 1 do
        if clb0.Checked[i] then
          s := s + ansiuppercase(copy(clb0.Items.Strings[i], 0, 3) + ',');
      tli := lv0.Items.Add;
      tli.Caption := s;
      tli.SubItems.Add(formatdatetime('hh:MM', dtp2.Time));
      tli.SubItems.Add(e0.Text);
      tli.SubItems.Add(m0.Text);
    end
    else
    begin
      tli := lv0.Items.Add;
      tli.Caption := datetostr(dtp0.Date);
      tli.SubItems.Add(formatdatetime('hh:MM', dtp2.Time));
      tli.SubItems.Add(e0.Text);
      tli.SubItems.Add(m0.Text);
      if chb0.Checked then
      begin
        td := dtp0.Date;
        repeat
          td := incDay(td, 1);
          tli := lv0.Items.Add;
          tli.Caption := datetostr(td);
          tli.SubItems.Add(formatdatetime('hh:MM', dtp2.Time));
          tli.SubItems.Add(e0.Text);
          tli.SubItems.Add(m0.Text);
          application.ProcessMessages;
        until td = dtp1.Date;
      end;
    end;
    b5.Click;
    b0.Click;
  end
  else
  begin
    try
      strtodate(lv0.Items.Item[lv0.itemindex].Caption);
      bharian := false;
    except
      bharian := true;
    end;
    if bharian then
    begin
      for i := 0 to clb0.Items.Count - 1 do
        if clb0.Checked[i] then
          s := s + ansiuppercase(copy(clb0.Items.Strings[i], 0, 3) + ',');
    end
    else
      s := datetostr(dtp0.Date);
    lv0.Items.BeginUpdate;
    tli := lv0.Items.Item[lv0.itemindex];
    tli.Caption := s;
    tli.SubItems.Strings[0] := formatdatetime('hh:MM', dtp2.Time);
    tli.SubItems.Strings[1] := e0.Text;
    tli.SubItems.Strings[2] := m0.Text;
    lv0.Items.EndUpdate;
    b5.Click;
    b1.Click;
  end;
  pSimpanINI;
end;

procedure Tfutama.b5Click(Sender: TObject);
begin
  e0.Clear;
  m0.Clear;
end;

procedure Tfutama.b6Click(Sender: TObject);
begin
  pm1.Popup(left + b6.Left + 12, top + b6.Top + b6.Height + 28);
end;

procedure Tfutama.lv0DblClick(Sender: TObject);
begin
  b1.Click;
end;

procedure Tfutama.FormCreate(Sender: TObject);
begin
  pBacaINI;
  if pm1mm0.Checked then
    if ansilowercase(paramstr(1)) = '/diam' then
      application.MainForm.Hide;
  ui1 := GlobalAddAtom('ui1');
  RegisterHotKey(handle, ui1, MOD_CONTROL + MOD_SHIFT, VK_TAB);
  tmw := TMonitorWaktu.Create(false);
  l0.Caption := formatdatetime('dddd, dd MMMM yyyy', now);
  l1.Caption := formatdatetime('hh:mm:ss', now);
  tmw.Resume;
  tmw.FreeOnTerminate := true;
end;

procedure Tfutama.b7Click(Sender: TObject);
begin
  if btambah then
    b0.Click;
  if bubah then
    b1.Click;
end;

procedure Tfutama.dtp0Change(Sender: TObject);
begin
  dtp1.MinDate := incDay(dtp0.Date, 1);
end;

procedure Tfutama.dtp1Change(Sender: TObject);
begin
  if dtp1.Date < dtp0.Date then
    dtp1.Date := incDay(dtp0.Date, 1);
end;

procedure Tfutama.pm0mm0Click(Sender: TObject);
var
  tod: topendialog;
begin
  tod := topendialog.Create(nil);
  tod.Filter := 'File Audio (*.wav;*.mp3)|*.wav;*.mp3';
  if tod.Execute then
    e0.Text := tod.FileName;
  tod.Free;
end;

procedure Tfutama.pm0mm1Click(Sender: TObject);
begin
  if mp0.Mode = mpPlaying then
  begin
    mp0.Stop;
    mp0.Close;
  end
  else
  begin
    if not fileexists(e0.Text) then
      exit;
    mp0.FileName := e0.Text;
    mp0.Open;
    mp0.Play;
  end;
end;

procedure Tfutama.pm1mm0Click(Sender: TObject);
begin
  if pm1mm0.Checked then
  begin
    if messagebox(handle, 'Apakah anda yakin ingin mematikan monitor jadwal?'#13'Ini akan menutup keseluruhan aplikasi ketika anda menutup jendela ini, dan pengingat akan berhenti.', 'Matikan Monitor Jadwal', 48 + 4) = mrno then
      exit
  end
  else
    messagebox(handle, 'Aktifkan Monitor Jadwal akan membuat program berjalan di latar ketika anda menutup jendela ini.'#13'Gunakan CTRL+SHIFT+TAB untuk memunculkan jendela ini kembali.', 'Aktifkan Monitor Jadwal', 64);
  pm1mm0.Checked := not pm1mm0.Checked;
  pSimpanINI;
end;

procedure Tfutama.pm1mm1Click(Sender: TObject);
var
  tr: tregistry;
begin
  pm1mm1.Checked := not pm1mm1.Checked;
  tr := tregistry.Create;
  try
    tr.RootKey := HKEY_CURRENT_USER;
    tr.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
    if pm1mm1.Checked then
      tr.writestring(changefileext(extractfilename(application.ExeName), ''), application.ExeName + ' /diam')
    else
      tr.DeleteValue(changefileext(extractfilename(application.ExeName), ''));
  finally
    tr.Free;
  end;
  pSimpanINI;
end;

procedure Tfutama.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  pSimpanINI;
  CanClose := not pm1mm0.Checked;
  application.MainForm.Hide;
end;

procedure Tfutama.pm1mm3Click(Sender: TObject);
begin
  messagebox(handle, 'Bel 1.0 BD7 (Proyek Bel versi Borland Delphi 7)'#13#13'Aplikasi ini ...'#13'...bebas dikembangkan dengan syarat minimal IDE adalah Delphi7 atau Lazarus'#13'...dibuat untuk membantu kepentingan bel aktifitas sekolah', 'Tentang', 64);
end;

procedure Tfutama.l2Click(Sender: TObject);
begin
  showmessage('Programmed By Arachmadi Putra Pambudi');
end;

var
  hnd: THandle;

initialization
  hnd := CreateMutex(nil, True, 'cimobelbd7');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    messagebox(hnd, 'Aplikasi BelBD7 sudah berjalan, coba tekan CTRL+SHIFT+TAB untuk memunculkan kembali', 'BelBD7 Gagal Dimulai', 16);
    halt;
  end;

finalization
  if hnd <> 0 then
    CloseHandle(hnd);

end.

