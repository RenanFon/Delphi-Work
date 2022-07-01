unit appLeitorFreteMinimo.model.extrairHTML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, idhttp;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  idhttp: TIdHTTP;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  idhttp := TIdHTTP.Create(nil);
  Memo1.Text := idhttp.Get('https://www.in.gov.br/en/web/dou/-/resolucao-n-5.959-de-20-de-janeiro-de-2022-375504795');
end;

end.
