unit Unit2;

interface

uses
  UAbstractFactory;

type

  Controller = class
  private
    FMyField: boolean;
    fAbstractFactory: AbstractFactory;
    fAbstractButton: AbstractButton;
    fAbstractWindow: AbstractWindow;
    procedure SetCreateAbstractFactory(Value: boolean);
    function GetDestroyAbstractFactory: boolean;
  public
    property MyField: boolean read GetDestroyAbstractFactory
      write SetCreateAbstractFactory;
    function AbstractFactoryPrintButton: string;
    function AbstractFactoryPrintWindow: string;
  end;

implementation

/// ////////////////////////////////////////////////////////

{ Controller }

function Controller.AbstractFactoryPrintButton: string;
begin
  result := fAbstractFactory.printButton(fAbstractButton);
end;

function Controller.AbstractFactoryPrintWindow: string;
begin
  result := fAbstractFactory.printWindow(fAbstractWindow);
end;

function Controller.GetDestroyAbstractFactory: boolean;
begin
  fAbstractFactory.Free;
  fAbstractButton.Free;
  fAbstractWindow.Free;
  result := FMyField;
end;

procedure Controller.SetCreateAbstractFactory(Value: boolean);
begin
  FMyField := Value;
  if Value = true then
  begin
    fAbstractFactory := WinFactory.Create;
    fAbstractButton := WinButton.Create;
    fAbstractWindow := WinWindow.Create;
  end
  else
  begin
    fAbstractFactory := MacFactory.Create;
    fAbstractButton := WinButton.Create;
    fAbstractWindow := MacWindow.Create;
  end;
end;

end.
