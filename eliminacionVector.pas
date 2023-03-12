program eliminacionVector;
const
	dimF = 50;
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
		num,pos:integer;
		encontre:boolean;
	begin
		pos:= 1;
		encontre:= false;
		writeln('Ingrese un numero a eliminar: ');
		readln(num);
		while (pos <= dimL) and not (encontre) do
			begin
				if(v[pos] = num) then
					encontre:= true
				else
					pos+= 1;
			end;
		if(encontre)then
			begin
				for pos := pos  to (dimL - 1) do
					begin
						v[pos]:= v[pos + 1];
					end;
				writeln('El numero se elimino con exito.');
				dimL:= dimL - 1;
			end
		else
			writeln('El numero no se encuentra en el vector.');
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
