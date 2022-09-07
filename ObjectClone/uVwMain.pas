unit uVwMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Clone.uItemEstoque;

type
  TVwMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCreateObjects: TBitBtn;
    btnCloneObjects: TBitBtn;
    btnReset: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    memItemI: TMemo;
    memItemII: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnCreateObjectsClick(Sender: TObject);
    procedure btnCloneObjectsClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    FItemEstoqueI: TItemEstoque;
    FItemEstoqueII: TItemEstoque;

    procedure ExibirItensEstoque;
  public
    { Public declarations }
  end;

var
  VwMain: TVwMain;

implementation

uses
  Clone.uItemEstoqueFactory;

{$R *.dfm}

procedure TVwMain.btnCloneObjectsClick(Sender: TObject);
begin
  FItemEstoqueII := FItemEstoqueI.Clone;
  ExibirItensEstoque;
end;

procedure TVwMain.btnCreateObjectsClick(Sender: TObject);
begin
  FItemEstoqueI := FacItemEstoque.BuildItemEstoque;
  ExibirItensEstoque;
end;

procedure TVwMain.btnResetClick(Sender: TObject);
begin
  FreeAndNil(FItemEstoqueI);
  FreeAndNil(FItemEstoqueII);
  ExibirItensEstoque;
end;

procedure TVwMain.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TVwMain.ExibirItensEstoque;
begin
  memItemI.Clear;
  memItemII.Clear;

  if Assigned(FItemEstoqueI) then
    memItemI.Lines.Add(FItemEstoqueI.ToString)
  else
    memItemI.Lines.Add('Item de Estoque I não criado!');

  if Assigned(FItemEstoqueII) then
    memItemII.Lines.Add(FItemEstoqueII.ToString)
  else
    memItemII.Lines.Add('Item de Estoque II não criado!');
end;

procedure TVwMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  btnResetClick(Self);
end;

procedure TVwMain.FormCreate(Sender: TObject);
begin
  FItemEstoqueI := nil;
  FItemEstoqueII := nil;
end;

end.
