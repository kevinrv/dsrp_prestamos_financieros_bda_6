USE dsrp_prestamos_financieros_6;
GO
--Igualdad simple "Selecionar el dni, nombre completo y email de todos
-- las personas naturales que se llamen David"


SELECT*FROM personas_naturales;

SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales
WHERE nombres='Juan';