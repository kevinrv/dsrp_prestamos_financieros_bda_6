/* 
Ejercicios Propuestos de Nivel Intermedio y Avanzado
Intermedio
Consulta con JOINs m�ltiples:

Obt�n una lista de todos los pr�stamos, mostrando:
El cliente (nombre o raz�n social seg�n corresponda).
La sucursal.
El empleado que gestion� el pr�stamo.
El tipo de pr�stamo.
El monto total otorgado y la tasa de inter�s.
Cuotas Pendientes:

Crea una consulta para listar las cuotas vencidas que no han sido completamente abonadas, mostrando:
El cliente.
El pr�stamo relacionado.
El n�mero de cuota y el monto pendiente.
Reporte de Saldos por Pr�stamo:

Calcula el monto pendiente total de cada pr�stamo (suma de monto_pendiente de las cuotas relacionadas) y clasif�calos como:
"Al d�a" si no tienen cuotas vencidas.
"En mora" si tienen al menos una cuota vencida.
Pagos por Cliente:

Dise�a una consulta que liste los clientes y el total de dinero que han abonado hasta la fecha, incluyendo aquellos que no han realizado ning�n pago.
Validaci�n de Restricciones:

Intenta insertar un pr�stamo cuyo tipo_prestamo_id no exista en la tabla tipos_prestamo y analiza el error generado.
Actualizaci�n Masiva:

Crea una consulta que aumente la tasa_interes de todos los pr�stamos en 0.5% si el monto otorgado es mayor a 50,000.
Avanzado
Reporte Consolidado de Pr�stamos:

Genera un reporte con el siguiente formato:
Nombre o Raz�n Social del cliente.
Cantidad total de pr�stamos activos.
Monto total otorgado en todos sus pr�stamos.
Monto total pendiente.
Subconsultas Correlacionadas:

Encuentra los empleados que han gestionado al menos un pr�stamo en cada sucursal.
Pagos Detallados por Cuotas:

Lista todas las cuotas pagadas parcialmente, mostrando:
El cliente.
El pr�stamo relacionado.
El n�mero de cuota.
El monto pendiente inicial, el monto abonado, y el saldo restante.
Cuotas Vencidas en un Rango de Fechas:

Crea una consulta parametrizada que permita listar las cuotas vencidas en un rango de fechas especificado por el usuario.
Procedimiento Almacenado - Registro de Pr�stamos:

Dise�a un procedimiento almacenado que registre un nuevo pr�stamo, asignando autom�ticamente las cuotas relacionadas (seg�n el plazo) con:
Montos iguales distribuidos en todas las cuotas.
Fechas de vencimiento calculadas seg�n el plazo y la fecha de inicio.
Disparador para Pagos:

Crea un disparador (TRIGGER) que:
Se active al insertar un nuevo pago en la tabla pagos.
Actualice autom�ticamente el monto_pendiente en la tabla cuotas.
Cambie el estado de la cuota a "Pagado" si su saldo pendiente llega a cero.
Reporte de Eficiencia de Sucursales:

Genera un reporte que muestre:
El nombre de cada sucursal.
El n�mero total de pr�stamos gestionados.
El porcentaje de estos pr�stamos que est�n al d�a.
El monto total otorgado.
Optimizaci�n de Cuotas con Pagos Parciales:

Dise�a un procedimiento almacenado que redistribuya autom�ticamente pagos parciales de una cuota en cuotas futuras cuando el monto abonado supera el saldo pendiente de la cuota actual.
Consulta Jer�rquica de Empleados:

Lista los empleados junto con sus supervisores directos y, si aplica, el supervisor del supervisor, mostrando:
Nombre del empleado.
Nombre del supervisor directo.
Nombre del supervisor superior.
Auditor�a de Cambios:

Crea una tabla de auditor�a para registrar cualquier cambio en la tabla prestamos (incluyendo actualizaciones y eliminaciones), con:
El ID del pr�stamo afectado.
El tipo de cambio (INSERT, UPDATE, DELETE).
La fecha y el usuario que realiz� el cambio.*/