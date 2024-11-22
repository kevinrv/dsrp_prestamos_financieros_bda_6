# dsrp_prestamos_financieros_bda_6

Caso: Gestión de Préstamos Financieros
Una entidad financiera necesita un sistema para administrar los préstamos otorgados a sus clientes. Este sistema debe permitir registrar y consultar información sobre los clientes, los préstamos otorgados, las cuotas generadas y los pagos realizados.

Requerimientos:
Clientes:

Se debe almacenar información básica de los clientes, como su tipo (persona natural o jurídica), nombre completo o razón social, número de identificación, dirección, teléfono y correo electrónico.
Préstamos:

Cada préstamo debe estar asociado a un cliente.
Se debe registrar el monto otorgado, la tasa de interés, el plazo (en meses), la fecha de inicio y la fecha de vencimiento.
Un préstamo puede ser de diferentes tipos, como personal, hipotecario o vehicular.
Cuotas:

Cada préstamo genera un cronograma de cuotas con su número de cuota, monto, fecha de vencimiento y estado (pendiente, pagada, vencida).
El cálculo de las cuotas debe considerar el monto del préstamo, la tasa de interés y el plazo.
Pagos:

Los clientes pueden realizar pagos parciales o totales de una o más cuotas.
Se debe registrar la fecha del pago, el monto abonado y la cuota o cuotas asociadas.
Sucursales (opcional):

Cada préstamo debe estar vinculado a la sucursal donde fue otorgado.
Cada sucursal tiene un código único, dirección y gerente asignado.
