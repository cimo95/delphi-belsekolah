unit utmw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, StdCtrls, ComCtrls;

type
  TMonitorWaktu = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
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

procedure TMonitorWaktu.Execute;
var
  i: integer;
  s, t, u: string;
  b: boolean;
begin
  while not terminated do
  begin
    with futama do
    begin
      u := caption;
      s := formatdatetime('dd/mm/yyyy hh:MM', now);
      if lv0.Items.Count <> 0 then
      begin
        for i := 0 to lv0.Items.Count - 1 do
        begin
          t := lv0.Items.Item[i].Caption + ' ' + lv0.Items.Item[i].SubItems.Strings[0];
          b := s = t;
          if b then
          begin
            mp0.Open;
            mp0.FileName := lv0.Items.Item[i].SubItems.Strings[1];
            mp0.Play;
            sleep(59000);
          end;
        end;
      end;
      sleep(1000);
    end;
  end;
end;

end.
 
