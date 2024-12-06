/* 
Ejercicios Propuestos de Nivel Intermedio y Avanzado
Intermedio
Consulta con JOINs múltiples:

Obtén una lista de todos los préstamos, mostrando:
El cliente (nombre o razón social según corresponda).
La sucursal.
El empleado que gestionó el préstamo.
El tipo de préstamo.
El monto total otorgado y la tasa de interés.
Cuotas Pendientes:

Crea una consulta para listar las cuotas vencidas que no han sido completamente abonadas, mostrando:
El cliente.
El préstamo relacionado.
El número de cuota y el monto pendiente.
Reporte de Saldos por Préstamo:

Calcula el monto pendiente total de cada préstamo (suma de monto_pendiente de las cuotas relacionadas) y clasifícalos como:
"Al día" si no tienen cuotas vencidas.
"En mora" si tienen al menos una cuota vencida.
Pagos por Cliente:

Diseña una consulta que liste los clientes y el total de dinero que han abonado hasta la fecha, incluyendo aquellos que no han realizado ningún pago.
Validación de Restricciones:

Intenta insertar un préstamo cuyo tipo_prestamo_id no exista en la tabla tipos_prestamo y analiza el error generado.
Actualización Masiva:

Crea una consulta que aumente la tasa_interes de todos los préstamos en 0.5% si el monto otorgado es mayor a 50,000.
Avanzado
Reporte Consolidado de Préstamos:

Genera un reporte con el siguiente formato:
Nombre o Razón Social del cliente.
Cantidad total de préstamos activos.
Monto total otorgado en todos sus préstamos.
Monto total pendiente.
Subconsultas Correlacionadas:

Encuentra los empleados que han gestionado al menos un préstamo en cada sucursal.
Pagos Detallados por Cuotas:

Lista todas las cuotas pagadas parcialmente, mostrando:
El cliente.
El préstamo relacionado.
El número de cuota.
El monto pendiente inicial, el monto abonado, y el saldo restante.
Cuotas Vencidas en un Rango de Fechas:

Crea una consulta parametrizada que permita listar las cuotas vencidas en un rango de fechas especificado por el usuario.
Procedimiento Almacenado - Registro de Préstamos:

Diseña un procedimiento almacenado que registre un nuevo préstamo, asignando automáticamente las cuotas relacionadas (según el plazo) con:
Montos iguales distribuidos en todas las cuotas.
Fechas de vencimiento calculadas según el plazo y la fecha de inicio.
Disparador para Pagos:

Crea un disparador (TRIGGER) que:
Se active al insertar un nuevo pago en la tabla pagos.
Actualice automáticamente el monto_pendiente en la tabla cuotas.
Cambie el estado de la cuota a "Pagado" si su saldo pendiente llega a cero.
Reporte de Eficiencia de Sucursales:

Genera un reporte que muestre:
El nombre de cada sucursal.
El número total de préstamos gestionados.
El porcentaje de estos préstamos que están al día.
El monto total otorgado.
Optimización de Cuotas con Pagos Parciales:

Diseña un procedimiento almacenado que redistribuya automáticamente pagos parciales de una cuota en cuotas futuras cuando el monto abonado supera el saldo pendiente de la cuota actual.
Consulta Jerárquica de Empleados:

Lista los empleados junto con sus supervisores directos y, si aplica, el supervisor del supervisor, mostrando:
Nombre del empleado.
Nombre del supervisor directo.
Nombre del supervisor superior.
Auditoría de Cambios:

Crea una tabla de auditoría para registrar cualquier cambio en la tabla prestamos (incluyendo actualizaciones y eliminaciones), con:
El ID del préstamo afectado.
El tipo de cambio (INSERT, UPDATE, DELETE).
La fecha y el usuario que realizó el cambio.*/