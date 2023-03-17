program NumericalIntegration;

const
  N = 1000;   { Number of subintervals }
  A = 0;      { Lower limit of integration }
  B = 1;      { Upper limit of integration }

var
  H, X, Sum: Double;
  I: Integer;

function F(X: Double): Double;
{ This function defines the integrand }
begin
  F := Sqrt(1 - X*X);
end;

begin
  { Compute the step size }
  H := (B - A) / N;

  { Compute the sum of the function values at the endpoints and midpoints }
  Sum := (F(A) + F(B)) / 2;
  for I := 1 to N-1 do
  begin
    X := A + I*H;
    Sum := Sum + F(X);
  end;

  { Compute the integral using the trapezoidal rule }
  Sum := H*Sum;

  { Output the result }
  WriteLn('Integral = ', Sum:0:6);
end.
