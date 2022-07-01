unit appLeitorFreteMinimo.view.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Datasnap.DBClient,System.JSON,
  DataSet.Serialize;

type
  TFormMain = class(TForm)
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Label1: TLabel;
    lblTitulo: TLabel;
    dsTemp: TDataSource;
    Memo1: TMemo;
    Memo2: TMemo;
    pnlRodape: TPanel;
    pnlCabecalho: TPanel;
    pnlConteudo: TPanel;
    cdsTemp: TClientDataSet;
    cdsTempid: TStringField;
    cdsTempTipodeCarga: TStringField;
    cdsTempCoeficientedeCusto: TStringField;
    cdsTempUnidade: TStringField;
    cdsTempeixos_2: TStringField;
    cdsTempeixos_3: TStringField;
    cdsTempeixos_4: TStringField;
    cdsTempeixos_5: TStringField;
    cdsTempeixos_6: TStringField;
    cdsTempeixos_7: TStringField;
    cdsTempeixos_9: TStringField;
    pnlLerHTML: TPanel;
    EditURL: TEdit;
    Label2: TLabel;
    dbgLista: TDBGrid;
    Panel2: TPanel;
    pnlTabs: TPanel;
    pnlLotacao: TPanel;
    pnlSomenteAutomotor: TPanel;
    pnlLotacaoAutoDesempenho: TPanel;
    pnlSomenteAutomotorAutoDesempenho: TPanel;
    Panel9: TPanel;
    Memo3: TMemo;

    { Procedures }
    procedure GeraHTML();
    procedure LerArquivo;
    procedure InserirConteudo(IndiceColuna: Integer; Conteudo: String);
    procedure ImportarDadosHTML;
    procedure LimparBotoes();

    { Functions }
    function GetNomeArquivoSelecionado(DirIntial: String;
      const Filter: String): String;
    function CarregarArquivo: Boolean;
    function carregarJson(dataset: TdataSet): TJSONObject;
    function VerificarRegistroInserido(IndiceColuna: Integer;
      Conteudo: String): Boolean;
    function GravarRegistro: Boolean;
    procedure pnlLerHTMLClick(Sender: TObject);
    procedure pnlLotacaoClick(Sender: TObject);
    procedure pnlSomenteAutomotorClick(Sender: TObject);
    procedure pnlLotacaoAutoDesempenhoClick(Sender: TObject);
    procedure pnlSomenteAutomotorAutoDesempenhoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure pnlLerHTMLMouseEnter(Sender: TObject);
    procedure pnlLerHTMLMouseLeave(Sender: TObject);
    procedure Panel2MouseEnter(Sender: TObject);
    procedure Panel2MouseLeave(Sender: TObject);
    procedure Panel9MouseEnter(Sender: TObject);
    procedure Panel9MouseLeave(Sender: TObject);
    procedure Panel2Click(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  IdHTTP1: TIdHTTP;
  ArquivoHTML: TextFile;

implementation

{$R *.dfm}

{ Função principal }
procedure TFormMain.LerArquivo;
var
  ColunaCorrente, ContaRegistro, oInicio, oFinal: Integer;
  Linha, LinhaUpper, Conteudo: String;
  LinhaDuplicada: Boolean;
begin
  // Faz a leitura e armazenamento das informações.

  ColunaCorrente := 0;
  ContaRegistro := 0;
  Reset(ArquivoHTML);

  while not Eof(ArquivoHTML) do
  begin
    Readln(ArquivoHTML, Linha);
    LinhaUpper := UpperCase(Linha);

    // Verifica a Tag TD (início e oFinal da célula) para extrair o conteúdo.
    if Pos('<TD', LinhaUpper) > 0 then
    begin
      // Até o total de registros que devem ser inseridos. No caso são 11.
      if ColunaCorrente <= (11 - 1) then
      begin
        oInicio := Pos(' >', LinhaUpper) + 2;
        oFinal := Pos('</P>', LinhaUpper);

        Conteudo := Copy(Linha, oInicio, oFinal - oInicio);

        // A cada nova linha verifica se o Cod. Barra já existe.
        if (ColunaCorrente = 0) then
          LinhaDuplicada := VerificarRegistroInserido(ColunaCorrente, Conteudo);

        InserirConteudo(ColunaCorrente, Conteudo);

        // Incrementa o índice da coluna
        Inc(ColunaCorrente);
      end;
    end;

    // Verifica a Tag TR (oFinal da linha) para gravar o registro.
    if Pos('</TR>', LinhaUpper) > 0 then
    begin
      if GravarRegistro then
        Inc(ContaRegistro);
      ColunaCorrente := 0;
    end;

    // Verifica a Tag TABLE (oFinal da tabela) para finalizar a leitura.
    if Pos('</TABLE>', LinhaUpper) > 0 then
      Break;
  end;
end;

procedure TFormMain.pnlLerHTMLClick(Sender: TObject);
begin
  GeraHTML;
  pnlLerHTML.Enabled := False;
  pnlLotacao.OnClick(Sender);
end;

procedure TFormMain.pnlLerHTMLMouseEnter(Sender: TObject);
begin
  pnlLerHTML.Color := clGreen;
end;

procedure TFormMain.pnlLerHTMLMouseLeave(Sender: TObject);
begin
  pnlLerHTML.Color := $0000D200;
end;

procedure TFormMain.pnlLotacaoAutoDesempenhoClick(Sender: TObject);
begin
  cdsTemp.EmptyDataSet;
  AssignFile(ArquivoHTML, 'C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela3.html');
  LerArquivo;
  LimparBotoes();
  pnlLotacaoAutoDesempenho.Color := clWhite;
end;

procedure TFormMain.pnlLotacaoClick(Sender: TObject);
begin
  cdsTemp.EmptyDataSet;
  AssignFile(ArquivoHTML, 'C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela1.html');
  LerArquivo;
  LimparBotoes();
  pnlLotacao.Color := clWhite;
end;

procedure TFormMain.pnlSomenteAutomotorAutoDesempenhoClick(Sender: TObject);
begin
  cdsTemp.EmptyDataSet;
  AssignFile(ArquivoHTML, 'C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela4.html');
  LerArquivo;
  LimparBotoes();
  pnlSomenteAutomotorAutoDesempenho.Color := clWhite;
end;

procedure TFormMain.pnlSomenteAutomotorClick(Sender: TObject);
begin
  cdsTemp.EmptyDataSet;
  AssignFile(ArquivoHTML, 'C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela2.html');
  LerArquivo;
  LimparBotoes();
  pnlSomenteAutomotor.Color := clWhite;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  LerArquivo;
end;

function TFormMain.CarregarArquivo: Boolean;
var
  NomeArquivo, DirInicial, Filtro: String;
begin
  // Retorna False caso haja falha ao carregar arquivo e True caso tenha sucesso.
  Result := True;
  DirInicial := ExtractFilePath(ParamStr(0));
  Filtro := 'Arquivos HTML|*.htm*|Todos os Arquivos|*.*';
  NomeArquivo := GetNomeArquivoSelecionado(DirInicial, Filtro);

  if not FileExists(NomeArquivo) then
  begin
    Result := False;
    ShowMessage('Arquivo inválido ou nenhum arquivo informado.');
    Exit;
  end;

  AssignFile(ArquivoHTML, NomeArquivo);
end;

function TFormMain.carregarJson(dataset: TdataSet): TJSONObject;
    var objetojs : TJSONObject;
    begin
        dataSet := cdsTemp;
        objetojs:= TJSONObject.Create;

    end;

// Funcão secundária
procedure TFormMain.GeraHTML;
var
  op: Boolean;
  i, totalLinhas, contadorTag, contadorTabela: Integer;
  Pagina, Lista: String;
  ArquivoAGravar: TStrings;
begin
  op := False;
  contadorTag := 0;
  contadorTabela := 0;

  // Salva o o código fonte HTML da página
  Pagina := IdHTTP1.Get(EditURL.Text);

  // Filtra o HTML
  Memo1.Lines.Clear;
  Memo1.Lines.Text := Pagina;
  Memo2.Lines.Clear;

  // Itera pelo HTML do arquivo baixado
  for i := 0 to Memo1.Lines.Count - 1 do
  begin
    // Se for início ou final de uma tabela
    if Pos('<table class="dou-table"', Memo1.Lines.Strings[i]) > 0 then
      op := True

    else if Pos('</table>', Memo1.Lines.Strings[i]) > 0 then
    begin
      op := False;
      contadorTabela := contadorTabela + 1;
      ArquivoAGravar := TStringList.Create;
      ArquivoAGravar.Append(Memo2.Lines.Text);

      // Preenche cada uma das tabelas com seus dados
      case contadorTabela of
        1: ArquivoAGravar.SaveToFile('C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela1.html');
        2: ArquivoAGravar.SaveToFile('C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela2.html');
        3: ArquivoAGravar.SaveToFile('C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela3.html');
        4: ArquivoAGravar.SaveToFile('C:\Users\Bsoft\Desktop\Leitor de Frete Mínimo\files\tabela4.html');
      end;

      contadorTag := 0;
      Memo2.Lines.Clear;
      ArquivoAGravar.Free;
    end;

    // Gravar no arquivo final
    if (op = True) then
    begin
      // pula as 3 primeiras tags <tr>
      if (Pos('<tr>', Memo1.Lines.Strings[i]) > 0) then
        contadorTag := contadorTag + 1;

      if contadorTag > 3 then
        Memo2.Lines.Add(Memo1.Lines.Strings[i])
    end;
  end;

  ShowMessage('HTML lido com sucesso');
end;

function TFormMain.GetNomeArquivoSelecionado(DirIntial: String;
  const Filter: String): String;
var
  D: TOpenDialog;
begin
  // Retorna uma String o nome completo do arquivo selecionado.
  D := TOpenDialog.Create(Nil);
  D.InitialDir := DirIntial;
  D.Filter := Filter;
  D.Execute;
  Result := D.FileName;
  D.Free;
end;

function TFormMain.GravarRegistro: Boolean;
begin
  // Grava as informações inseridas.
  Result := cdsTemp.State = dsInsert;
  if cdsTemp.State = dsInsert then
    cdsTemp.Post;
end;

procedure TFormMain.ImportarDadosHTML;
begin
  // Procedimento principal, o qual agrupa todas as operações de
  // leitura e processamento e gravação dos dados da tabela HTML
  // Carrega o Arquivo. Caso haja falha, aborta o processo
  if not CarregarArquivo then
    Exit;

  cdsTemp.DisableControls;
  // faz a leitura e importação dos dados.
  LerArquivo;
  cdsTemp.EnableControls;
  cdsTemp.First;
  // Fecha o arquivo.
  CloseFile(ArquivoHTML);
end;

procedure TFormMain.InserirConteudo(IndiceColuna: Integer; Conteudo: String);
begin
  // Insere os dados na tabela temporária.
  // Lembrando que a ordem dos campos deve ser a mesma das colunas no HTML.
  if cdsTemp.State <> dsInsert then
    cdsTemp.Append;
  cdsTemp.Fields[IndiceColuna].AsString := Conteudo;
end;

function TFormMain.VerificarRegistroInserido(IndiceColuna: Integer;
  Conteudo: String): Boolean;
var
  NomeCampo: String;
begin
  // Retorna True caso o registro já tenha sido inserido.
  NomeCampo := cdsTemp.Fields[IndiceColuna].FieldName;
  Result := cdsTemp.Locate(NomeCampo, Conteudo, [loCaseInsensitive]);
end;

procedure TFormMain.LimparBotoes;
begin
  pnlLotacao.Color := $00FF8000;
  pnlSomenteAutomotor.Color := $00FF8000;
  pnlLotacaoAutoDesempenho.Color := $00FF8000;
  pnlSomenteAutomotorAutoDesempenho.Color := $00FF8000;
end;



procedure TFormMain.Panel2Click(Sender: TObject);
    var objeto : TJSONObject;
        objetarray : TJSONArray;
        campo1,campo2,campo3,campo4,campo5,
        campo6,campo7,campo8,
        campo9,campo10,campo11: string;
    begin
        try
            cdsTemp.first;

            while not cdsTemp.eof
            do begin
                objetarray := TJSONArray.Create;
                objeto := TJSONObject.Create;
                campo1 := cdsTemp.Fields[0].AsString;
                campo2 := cdsTemp.Fields[1].AsString;
                campo3 := cdsTemp.Fields[2].AsString;
                campo4 := cdsTemp.Fields[3].AsString;
                campo5 := cdsTemp.Fields[4].AsString;
                campo6 := cdsTemp.Fields[5].AsString;
                campo7 := cdsTemp.Fields[6].AsString;
                campo8 := cdsTemp.Fields[7].AsString;
                campo9 := cdsTemp.Fields[8].AsString;
                campo10 := cdsTemp.Fields[9].AsString;
                campo11 := cdsTemp.Fields[10].AsString;
                objeto.AddPair('id',campo1);
                objeto.AddPair('tipo_carga',campo2);
                objeto.AddPair('coeficiente_de_custo',campo3);
                objeto.AddPair('unidade',campo4);
                objeto.AddPair('eixos_2',campo5);
                objeto.AddPair('eixos_3',campo6);
                objeto.AddPair('eixos_4',campo7);
                objeto.AddPair('eixos_5',campo8);
                objeto.AddPair('eixos_6',campo9);
                objeto.AddPair('eixos_7',campo10);
                objeto.AddPair('eixos_9',campo11);
                //objeto.AddPair('eixos_9',campo5);
            cdsTemp.next;
                campo3 := cdsTemp.Fields[2].AsString;
                campo4 := cdsTemp.Fields[3].AsString;
                campo5 := cdsTemp.Fields[4].AsString;
                campo6 := cdsTemp.Fields[5].AsString;
                campo7 := cdsTemp.Fields[6].AsString;
                campo8 := cdsTemp.Fields[7].AsString;
                campo9 := cdsTemp.Fields[8].AsString;
                campo10 := cdsTemp.Fields[9].AsString;
                campo11 := cdsTemp.Fields[10].AsString;
                objeto.AddPair('coeficiente_de_custos',campo3);
                objeto.AddPair('unidades',campo4);
                objeto.AddPair('eixos_2-',campo5);
                objeto.AddPair('eixos_3-',campo6);
                objeto.AddPair('eixos_4-',campo7);
                objeto.AddPair('eixos_5-',campo8);
                objeto.AddPair('eixos_6-',campo9);
                objeto.AddPair('eixos_7-',campo10);
                objeto.AddPair('eixos_9-',campo11);
                objetarray.AddElement(objeto);
                cdsTemp.next;
                memo3.Lines.Add(objeto.ToString)

            end;
             memo3.Lines.Add(objetarray.ToString);
        finally
            objeto.DisposeOf;

        end;
    end;

procedure TFormMain.Panel2MouseEnter(Sender: TObject);
begin
  Panel2.Color := clBlue;
end;

procedure TFormMain.Panel2MouseLeave(Sender: TObject);
begin
  Panel2.Color := $00FF8000;
end;

procedure TFormMain.Panel9MouseEnter(Sender: TObject);
begin
  Panel9.Color := clGray;
end;

procedure TFormMain.Panel9MouseLeave(Sender: TObject);
begin
  Panel9.Color := $002B95FF;
end;

end.
