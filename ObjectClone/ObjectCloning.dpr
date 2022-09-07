program ObjectCloning;

uses
  Forms,
  uVwMain in 'uVwMain.pas' {VwMain},
  Clone.uItemEstoque in 'Clone.uItemEstoque.pas',
  Clone.uItemEstoqueFactory in 'Clone.uItemEstoqueFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVwMain, VwMain);
  Application.Run;
end.
