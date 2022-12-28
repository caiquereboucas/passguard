program PassGuard;

uses
  Vcl.Forms,
  MainForm in 'src\MainForm.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Minimize;
  Application.Run;
end.
