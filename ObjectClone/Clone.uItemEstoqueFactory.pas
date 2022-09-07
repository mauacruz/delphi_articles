unit Clone.uItemEstoqueFactory;

interface

uses
  Clone.uItemEstoque;
type
  FacItemEstoque = class
    public
      class function BuildItemEstoque: TItemEstoque;
  end;
implementation

uses
  SysUtils;

{ FacItemEstoque }

class function FacItemEstoque.BuildItemEstoque: TItemEstoque;
begin
  Result := TItemEstoque.Create;
  with Result do
  begin
    Codigo := 'ABC';
    Descricao := 'Item de Estoque ABC';
    DataCriacao := Now;
    Ativo := True;
  end;

end;

end.
