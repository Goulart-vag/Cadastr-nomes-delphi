program TESTE;

uses
  Forms,
  U_PRINICIPAL in 'U_PRINICIPAL.pas' {FRM_PRINCIPAL};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFRM_PRINCIPAL, FRM_PRINCIPAL);
  Application.Run;
end.
