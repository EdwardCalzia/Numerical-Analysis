program NumericalAnalysis;

const
  MaxIterations = 1000;  { Maximum number of iterations }
  Tolerance = 1E-6;      { Tolerance for convergence }

var
  A, B, C, FA, FB, FC: Double;
  Iteration: Integer;

function F(X: Double): Double;
{ This function defines the function whose root we want to find }
begin
  F := X*X - 2;
end;

begin
  { Initialize the endpoints of the interval }
  A := 0;
  B := 2;

  { Check if the function changes sign at the endpoints }
  FA := F(A);
  FB := F(B);
  if FA*FB >= 0 then
  begin
    WriteLn('Error: Function does not change sign on the interval');
    Halt;
  end;

  { Perform the bisection method until convergence or maximum iterations }
  Iteration := 0;
  repeat
    C := (A + B) / 2;
    FC := F(C);
    if FA*FC < 0 then
      B := C
    else
      A := C;
    Iteration := Iteration + 1;
  until (Iteration >= MaxIterations) or (Abs(B-A) < Tolerance);

  { Output the result }
  WriteLn('Root = ', C:0:6);
  WriteLn('Iterations = ', Iteration);
end.
