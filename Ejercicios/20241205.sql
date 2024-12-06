/* Ejercicios Propuestos:
Inserción de Datos Iniciales:

Inserta al menos 3 registros en cada una de las tablas personas_naturales y personas_juridicas.
Registra 5 sucursales con códigos únicos y direcciones ficticias.
Crea 3 tipos de préstamo con descripciones.
Consulta Básica:

Obtén una lista de todos los clientes (personas naturales y jurídicas) con su tipo de persona (tipo_persona).
Relación Cliente-Préstamo:

Inserta al menos 5 registros en la tabla clientes, vinculando algunos con personas_naturales y otros con personas_juridicas.
Registra 3 préstamos asignados a diferentes sucursales y empleados, especificando los tipos de préstamo.
Pagos y Cuotas:

Para cada préstamo registrado, crea 3 cuotas con fechas de vencimiento consecutivas y estados alternados entre "Pendiente" y "Pagado".
Registra pagos realizados para cubrir una o más cuotas y genera los correspondientes registros en detalle_pagos.
Consultas Intermedias:

Lista los préstamos activos, mostrando el cliente, el tipo de préstamo, y el monto otorgado.
Encuentra todas las cuotas pendientes, incluyendo el nombre del cliente y el código del préstamo.
Obtén el total abonado por cada cliente en sus pagos.
Actualizaciones y Eliminaciones:

Actualiza la dirección de una sucursal.
Marca como eliminados (llenando deleted_at y deleted_by) todos los préstamos cuyo plazo ya haya vencido.
Elimina un cliente y todos los registros asociados (préstamos, cuotas, etc.).
Estadísticas y Agregaciones:

Calcula el promedio de los montos otorgados en los préstamos.
Determina cuál sucursal ha otorgado el mayor número de préstamos.
Genera un reporte con el total de intereses generados por los préstamos.
Validaciones:

Intenta insertar un registro en clientes con un tipo_persona no permitido y verifica la restricción CHECK.
Inserta un empleado con un supervisor_id que no existe y observa el resultado.
Procedimientos Almacenados:

Crea un procedimiento almacenado que registre automáticamente un pago y actualice las cuotas afectadas.
Diseña un procedimiento para generar un reporte con los préstamos activos de una sucursal específica.
Consultas Avanzadas:

Encuentra todos los préstamos con cuotas vencidas, incluyendo el nombre del cliente y el monto pendiente.
Lista los empleados que no tienen supervisor.*/