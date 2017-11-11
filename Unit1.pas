unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  UAbstractFactory,
  unit2;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    fAbstractFactory: AbstractFactory;
    fAbstractButton: AbstractButton;
    fAbstractWindow: AbstractWindow;
    fCheckBox1Checked: CheckBox1Checked;
  public
    { Public declarations }
  published
    constructor create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    fAbstractFactory := WinFactory.Create;
    fAbstractButton := WinButton.Create;
    fAbstractWindow := WinWindow.Create;
  end
  else
  begin
    fAbstractFactory := MacFactory.Create;
    fAbstractButton := MacButton.Create;
    fAbstractWindow := MacWindow.Create;
  end;
  Label1.Caption := fAbstractFactory.printButton(fAbstractButton);
  Label2.Caption := fAbstractFactory.printWindow(fAbstractWindow);
end;

constructor TForm1.create(AOwner: TComponent);
begin
  inherited;
  fCheckBox1Checked := CheckBox1CheckedFalse.create;

  fAbstractFactory := fCheckBox1Checked.GetAbstractFactory;
  fAbstractButton := fCheckBox1Checked.GetAbstractButton;
  fAbstractWindow := fCheckBox1Checked.GetAbstractWindow;

  Label1.Caption := fAbstractFactory.printButton(fAbstractButton);
  Label2.Caption := fAbstractFactory.printWindow(fAbstractWindow);
end;

end.
