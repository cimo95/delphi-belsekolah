unit utmw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, StdCtrls, ComCtrls, mplayer;

type
  TMonitorWaktu = class(TThread)
  private
    { Private declarations }
    utmwi0: integer;
    bl1:boolean;
  protected
    procedure Execute; override;
    procedure Munio;
  end;

implementation

uses
  uutama;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMonitorWaktu.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TMonitorWaktu }

procedure TMonitorWaktu.Munio;
begin
  with futama do
  begin
    mp0.FileName := lv0.Items.Item[utmwi0].SubItems.Strings[1];
    mp0.Open;
    mp0.Play;
    lv0.Items.beginUpdate;
    if bl1 then
      lv0.Items.Item[utmwi0].SubItems.Strings[3] := 'x'
    else
      lv0.Items.Item[utmwi0].SubItems.Strings[3] := formatdatetime('DD/MM/YYYY', now);
    lv0.Items.EndUpdate;
  end;
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.QuoteChar := '"';
  Strings.DelimitedText := Input;
end;

function fCekHari(shari: string): string;
const
  aos: array[0..6] of string = ('MIN', 'SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB');
var
  i, j: integer;
  tsl: tstringlist;
  s, t: string;
begin
  tsl := tstringlist.Create;
  split(',', shari, tsl);
  s := aos[dayofweek(now) - 1];
  i := 0;
  t := '10/06/1995';
  repeat
    if s = tsl[i] then
      t := formatdatetime('DD/MM/YYYY', now);
    inc(i);
  until (i = tsl.Count) or (t <> '10/06/1995');
  result := t;
end;

procedure TMonitorWaktu.Execute;
var
  i: integer;
  s, t, u: string;
  b, bl0: boolean;
begin
  try
    while not terminated do
    begin
      with futama do
      begin
        u := caption;
        s := formatdatetime('dd/mm/yyyy HH:MM', now);
        bl0 := true;
        if lv0.Items.Count <> 0 then
        begin
          for i := 0 to lv0.Items.Count - 1 do
          begin
            bl1 := pos(',', lv0.Items.Item[i].Caption) = 0;
            if bl1 then
              t := lv0.Items.Item[i].Caption + ' ' + lv0.Items.Item[i].SubItems.Strings[0]
            else
            begin
              t := fCekHari(lv0.Items.Item[i].Caption) + ' ' + lv0.Items.Item[i].SubItems.Strings[0];
            end;
            b := (s = t) and ((lv0.Items.Item[i].SubItems.Strings[3] <> 'x') and (lv0.Items.Item[i].SubItems.Strings[3] <> formatdatetime('DD/MM/YYYY', now)));
            if b then
            begin
              utmwi0 := i;
              synchronize(munio);
            end;
          end;
        end;
        sleep(1000);
      end;
    end;
  except
  end;
end;

end.

