program bel;

uses
  Forms,
  uutama in 'uutama.pas' {futama},
  utmw in 'utmw.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bel 1.0 BD7';
  Application.CreateForm(Tfutama, futama);
  Application.Run;
end.

