unit Clone.uItemEstoque;

interface
type
  TItemEstoque = class
    private
      FID: string;
      FCodigo: string;
      FDescricao: string;
      FDataCriacao: TDateTime;
      FAtivo: Boolean;

    public
      constructor Create;
      property ID: string read FID;
      property Codigo: string read FCodigo write FCodigo;
      property Descricao: string read FDescricao write FDescricao;
      property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
      property Ativo: Boolean read FAtivo write FAtivo;

      function ToString: string;
      function Clone: TItemEstoque;
  end;

implementation
uses
  Rtti, SysUtils, ComObj, TypInfo;

{ TItemEstoque }

constructor TItemEstoque.Create;
begin
  Self.FID := CreateClassID;
end;


function TItemEstoque.Clone: TItemEstoque;
var
  lContext: TRttiContext;
  lSourceType, lDestinyType: TRttiType;
  lSourceProperty, lDestinyProperty: TRttiProperty;
  lValue: TValue;
begin
  Result := TItemEstoque.Create;
  //Obtém o tipo do objeto origem
  lSourceType := lContext.GetType(Self.ClassInfo);
  //Obtém o tipo do objeto destino - neste caso são do mesmo tipo, mas criei para fins didáticos
  lDestinyType := lContext.GetType(Result.ClassInfo);

  //Percorre todas as propriedades do objeto origem
  for lSourceProperty in lSourceType.GetProperties do
  begin
    //Ignora a propriedade ID, pois cada objeto terá a sua
    if SameText(lSourceProperty.Name, 'ID') then
      Continue;

    //Obtém a propriedade de mesmo nome no objeto destino para atribuir o valor (testa se existe)
    lDestinyProperty := lDestinyType.GetProperty(lSourceProperty.Name);
    if Assigned(lDestinyProperty) then
    begin
      //Pega o valor da propriedade do objeto origem para atribuir ao objeto destino
      lValue := lSourceProperty.GetValue(Self);
      lDestinyProperty.SetValue(Result, lValue);
    end;
  end;
end;


function TItemEstoque.ToString: string;
var
  lSBuilder: TStringBuilder;
  lContext: TRttiContext;
  lSourceType: TRttiType;
  lSourceProperty: TRttiProperty;
  lValue: TValue;
  lFormattedValue: string;
begin
  lSBuilder := TStringBuilder.Create;
  try
    lSourceType := lContext.GetType(Self.ClassType);
    for lSourceProperty in lSourceType.GetProperties do
    begin
      lValue := lSourceProperty.GetValue(Self);
      //Para formatação, devemos tratar cada tipo do componente TValue
      case lValue.Kind of
        tkFloat:
        begin
          //Trantamento para conversão de campo Float para TDateTime
          if CompareText('TDateTime', lSourceProperty.PropertyType.Name) = 0 then
            lFormattedValue := QuotedStr(FormatDateTime('dd/mm/yyyy hh:MM:ss', lValue.AsExtended))
          else
            lFormattedValue := StringReplace(FormatFloat('##0.000', lValue.AsExtended), ',', '.', [rfReplaceAll]);
        end;

        else lFormattedValue := lValue.ToString;
      end;


      lSBuilder.AppendLine(lSourceProperty.Name + ': ' + lFormattedValue);
    end;
    Result := lSBuilder.ToString;
  finally
    lSBuilder.Free;
  end;
end;

end.
