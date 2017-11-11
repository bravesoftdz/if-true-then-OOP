unit Unit2;

interface

uses
  UAbstractFactory;

type
  CheckBox1Checked = class
  public
    function GetAbstractFactory: AbstractFactory; virtual; abstract;
    function GetAbstractButton: AbstractButton; virtual; abstract;
    function GetAbstractWindow: AbstractWindow; virtual; abstract;
  published
    constructor create; virtual; abstract;
  end;

  CheckBox1CheckedTrue = class(CheckBox1Checked)
  private
    fAbstractFactory: AbstractFactory;
    fAbstractButton: AbstractButton;
    fAbstractWindow: AbstractWindow;
  public
    function GetAbstractFactory: AbstractFactory; override;
    function GetAbstractButton: AbstractButton; override;
    function GetAbstractWindow: AbstractWindow; override;
  published
    constructor create; override;
  end;

  CheckBox1CheckedFalse = class(CheckBox1Checked)
  private
    fAbstractFactory: AbstractFactory;
    fAbstractButton: AbstractButton;
    fAbstractWindow: AbstractWindow;
  public
    function GetAbstractFactory: AbstractFactory; override;
    function GetAbstractButton: AbstractButton; override;
    function GetAbstractWindow: AbstractWindow; override;
  published
    constructor create; override;
  end;

implementation

{ CheckBox1Checkedrue }

constructor CheckBox1CheckedTrue.create;
begin
    fAbstractFactory := WinFactory.Create;
    fAbstractButton := WinButton.Create;
    fAbstractWindow := WinWindow.Create;
end;

function CheckBox1CheckedTrue.GetAbstractButton: AbstractButton;
begin
  result := fAbstractButton;
end;

function CheckBox1CheckedTrue.GetAbstractFactory: AbstractFactory;
begin
  result := fAbstractFactory;
end;

function CheckBox1CheckedTrue.GetAbstractWindow: AbstractWindow;
begin
  result := fAbstractWindow;
end;

{ CheckBox1CheckedFalse }

constructor CheckBox1CheckedFalse.create;
begin
    fAbstractFactory := MacFactory.Create;
    fAbstractButton := MacButton.Create;
    fAbstractWindow := MacWindow.Create;
end;

function CheckBox1CheckedFalse.GetAbstractButton: AbstractButton;
begin
  result := fAbstractButton;
end;

function CheckBox1CheckedFalse.GetAbstractFactory: AbstractFactory;
begin
  result := fAbstractFactory;
end;

function CheckBox1CheckedFalse.GetAbstractWindow: AbstractWindow;
begin
  result := fAbstractWindow;
end;

end.
