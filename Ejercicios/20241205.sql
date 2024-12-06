/* Ejercicios Propuestos:
Inserci�n de Datos Iniciales:

Inserta al menos 3 registros en cada una de las tablas personas_naturales y personas_juridicas.
Registra 5 sucursales con c�digos �nicos y direcciones ficticias.
Crea 3 tipos de pr�stamo con descripciones.
Consulta B�sica:

Obt�n una lista de todos los clientes (personas naturales y jur�dicas) con su tipo de persona (tipo_persona).
Relaci�n Cliente-Pr�stamo:

Inserta al menos 5 registros en la tabla clientes, vinculando algunos con personas_naturales y otros con personas_juridicas.
Registra 3 pr�stamos asignados a diferentes sucursales y empleados, especificando los tipos de pr�stamo.
Pagos y Cuotas:

Para cada pr�stamo registrado, crea 3 cuotas con fechas de vencimiento consecutivas y estados alternados entre "Pendiente" y "Pagado".
Registra pagos realizados para cubrir una o m�s cuotas y genera los correspondientes registros en detalle_pagos.
Consultas Intermedias:

Lista los pr�stamos activos, mostrando el cliente, el tipo de pr�stamo, y el monto otorgado.
Encuentra todas las cuotas pendientes, incluyendo el nombre del cliente y el c�digo del pr�stamo.
Obt�n el total abonado por cada cliente en sus pagos.
Actualizaciones y Eliminaciones:

Actualiza la direcci�n de una sucursal.
Marca como eliminados (llenando deleted_at y deleted_by) todos los pr�stamos cuyo plazo ya haya vencido.
Elimina un cliente y todos los registros asociados (pr�stamos, cuotas, etc.).
Estad�sticas y Agregaciones:

Calcula el promedio de los montos otorgados en los pr�stamos.
Determina cu�l sucursal ha otorgado el mayor n�mero de pr�stamos.
Genera un reporte con el total de intereses generados por los pr�stamos.
Validaciones:

Intenta insertar un registro en clientes con un tipo_persona no permitido y verifica la restricci�n CHECK.
Inserta un empleado con un supervisor_id que no existe y observa el resultado.
Procedimientos Almacenados:

Crea un procedimiento almacenado que registre autom�ticamente un pago y actualice las cuotas afectadas.
Dise�a un procedimiento para generar un reporte con los pr�stamos activos de una sucursal espec�fica.
Consultas Avanzadas:

Encuentra todos los pr�stamos con cuotas vencidas, incluyendo el nombre del cliente y el monto pendiente.
Lista los empleados que no tienen supervisor.*/