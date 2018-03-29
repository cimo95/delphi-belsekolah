unit utmw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, StdCtrls, ComCtrls, mplayer;

type
  TMonitorWaktu = class(TThread)
  private
    { Private declarations }
    sTerakhir: string;
    iIdx: integer;
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
    mp0.FileName := lv0.Items.Item[iIdx].SubItems.Strings[1];
    mp0.Open;
    mp0.Play;
    lv0.Items.beginUpdate;
    lv0.Items.Item[iIdx].SubItems.Strings[3] := 'x';
    lv0.Items.EndUpdate;
  end;
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
        s := formatdatetime('dd/mm/yyyy HH:MM:00', now);
        bl0 := true;
        if lv0.Items.Count <> 0 then
        begin
          for i := 0 to lv0.Items.Count - 1 do
          begin
            t := lv0.Items.Item[i].Caption + ' ' + lv0.Items.Item[i].SubItems.Strings[0];
            b := (s = t) and (lv0.Items.Item[i].SubItems.Strings[3] <> 'x');
            if b then
            begin
              iIdx := i;
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

