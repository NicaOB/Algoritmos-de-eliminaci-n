program eliminacionVector;
const
	dimF = 10;
type
	vNum = array [1 .. dimF] of integer;
procedure cargarVector(var v:vNum; var dimL:integer);
	var
		i:integer;
	begin
		for i:= 1 to dimF do
			v[i]:= i;
		dimL:= i;
	end;
procedure mostrarVector(v:vNum; dimL:integer);
	var
		i:integer;
	begin
		for i:= 1 to dimL do
			writeln(v[i],'         ', i);
	end;
procedure eliminar(var v:vNum; var dimL:integer);
	var
		pos:integer;
	begin
		writeln('Ingrese la posicion a eliminar: ');
		readln(pos);
		if ((pos >= 1) and (pos <= dimL)) then
			begin
				for pos:= pos to dimL - 1 do
					v[pos] := v[pos + 1];
				writeln('La posicion se elimino con exito.');
				dimL:= dimL - 1;
			end
		else
			writeln('La posicion es invalida.');
	end;
var
	v:vNum;
	dimL:integer;
begin
	cargarVector(v,dimL);
	mostrarVector(v,dimL);
	eliminar(v,dimL);
	mostrarVector(v,dimL);
end.
