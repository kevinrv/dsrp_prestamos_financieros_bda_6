-- personas naturales
SELECT*FROM personas_naturales;

INSERT INTO [dbo].[personas_naturales] ([numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion])
VALUES
('12345678', 'Juan', 'P�rez', 'G�mez', 'juan.perez@example.com', '987654321', 'Av. Siempre Viva 123'),
('23456789', 'Mar�a', 'Rodr�guez', 'L�pez', 'maria.rodriguez@example.com', '987654322', 'Calle Falsa 456'),
('34567890', 'Pedro', 'S�nchez', 'Mart�nez', 'pedro.sanchez@example.com', '987654323', 'Plaza Mayor 789'),
('45678901', 'Ana', 'Garc�a', 'Fern�ndez', 'ana.garcia@example.com', '987654324', 'Calle Real 101'),
('56789012', 'Carlos', 'Hern�ndez', 'G�mez', 'carlos.hernandez@example.com', '987654325', 'Av. Libertad 102'),
('67890123', 'Luc�a', 'Mart�nez', 'Gonz�lez', 'lucia.martinez@example.com', '987654326', 'Calle Sol 203'),
('78901234', 'Jos�', 'L�pez', 'P�rez', 'jose.lopez@example.com', '987654327', 'Calle Luna 204'),
('89012345', 'Isabel', 'Gonz�lez', 'S�nchez', 'isabel.gonzalez@example.com', '987654328', 'Av. 9 de Julio 305'),
('90123456', 'Francisco', 'Garc�a', 'Ram�rez', 'francisco.garcia@example.com', '987654329', 'Calle Rosario 406'),
('12323456', 'Marta', 'S�nchez', 'Torres', 'marta.sanchez@example.com', '987654330', 'Calle del R�o 507'),
('23434567', 'Luis', 'Rodr�guez', 'Lozano', 'luis.rodriguez@example.com', '987654331', 'Av. del Sol 608'),
('34545678', 'Carmen', 'Hern�ndez', 'Alvarez', 'carmen.hernandez@example.com', '987654332', 'Plaza Central 709'),
('45656789', 'Ra�l', 'Mart�nez', 'Su�rez', 'raul.martinez@example.com', '987654333', 'Calle San Pedro 810'),
('56767890', 'Patricia', 'Gonz�lez', 'Mart�nez', 'patricia.gonzalez@example.com', '987654334', 'Av. Primavera 911'),
('67878901', 'Juan', 'Alvarez', 'Lopez', 'juan.alvarez@example.com', '987654335', 'Calle Viento 102'),
('78989012', 'Elena', 'Su�rez', 'Jim�nez', 'elena.suarez@example.com', '987654336', 'Calle Monte 203'),
('89090123', 'Javier', 'Garc�a', 'Torres', 'javier.garcia@example.com', '987654337', 'Calle del Sol 304'),
('90101234', 'Rosa', 'Rodr�guez', 'Reyes', 'rosa.rodriguez@example.com', '987654338', 'Plaza Mayor 405'),
('12334567', 'V�ctor', 'Mart�nez', 'D�az', 'victor.martinez@example.com', '987654339', 'Av. Del Mar 506'),
('23445678', 'Claudia', 'L�pez', 'Gonz�lez', 'claudia.lopez@example.com', '987654340', 'Calle Nuevo 607'),
('34556789', 'Felipe', 'Gonz�lez', 'Torres', 'felipe.gonzalez@example.com', '987654341', 'Calle Oeste 708'),
('45667890', 'Ver�nica', 'S�nchez', 'G�mez', 'veronica.sanchez@example.com', '987654342', 'Calle Norte 809'),
('56778901', 'Eduardo', 'Hern�ndez', 'L�pez', 'eduardo.hernandez@example.com', '987654343', 'Av. del Norte 910'),
('67889012', 'Sof�a', 'Garc�a', 'Alonso', 'sofia.garcia@example.com', '987654344', 'Plaza Independencia 1011'),
('78990123', 'Jos�', 'Jim�nez', 'Fern�ndez', 'jose.jimenez@example.com', '987654345', 'Calle Centro 1112'),
('89001234', 'Patricia', 'Torres', 'Mora', 'patricia.torres@example.com', '987654346', 'Calle Europa 1213'),
('90112345', 'David', 'Su�rez', 'Garc�a', 'david.suarez@example.com', '987654347', 'Av. Costanera 1314'),
('12345679', 'Raquel', 'Ram�rez', 'Fern�ndez', 'raquel.ramirez@example.com', '987654348', 'Calle del Carmen 1415'),
('23456780', 'Manuel', 'S�nchez', 'P�rez', 'manuel.sanchez@example.com', '987654349', 'Calle Real 1516'),
('34567891', 'Sara', 'Gonz�lez', 'V�squez', 'sara.gonzalez@example.com', '987654350', 'Av. de la Paz 1617'),
('45678902', 'Oscar', 'L�pez', 'Rivas', 'oscar.lopez@example.com', '987654351', 'Plaza Mayor 1718'),
('56789023', 'M�nica', 'Ram�rez', 'Castro', 'monica.ramirez@example.com', '987654352', 'Calle Libertad 1819'),
('67890134', 'Ricardo', 'Jim�nez', 'Bravo', 'ricardo.jimenez@example.com', '987654353', 'Av. del Sol 1920'),
('78901245', 'Jessica', 'Su�rez', 'Medina', 'jessica.suarez@example.com', '987654354', 'Calle Monte 2021'),
('89012356', 'Mart�n', 'Rodr�guez', 'G�mez', 'martin.rodriguez@example.com', '987654355', 'Av. Viento 2122'),
('90123467', 'Patricia', 'Gonz�lez', 'Navarro', 'patricia.gonzalez@example.com', '987654356', 'Calle Ancha 2223'),
('12334578', 'Carlos', 'Mart�nez', 'Lozano', 'carlos.martinez@example.com', '987654357', 'Plaza del R�o 2324'),
('23445689', 'Ana', 'Rodr�guez', 'Gonz�lez', 'ana.rodriguez@example.com', '987654358', 'Calle Flor 2425'),
('34556790', 'Jos�', 'L�pez', 'Su�rez', 'jose.lopez@example.com', '987654359', 'Av. del Sol 2526'),
('45667891', 'Julia', 'Mart�nez', 'Cruz', 'julia.martinez@example.com', '987654360', 'Calle de la Paz 2627'),
('56778902', 'Antonio', 'Hern�ndez', 'Vega', 'antonio.hernandez@example.com', '987654361', 'Calle Mayor 2728'),
('67889023', 'Claudia', 'Su�rez', 'Morales', 'claudia.suarez@example.com', '987654362', 'Av. Independencia 2829'),
('78990134', 'Francisco', 'Gonz�lez', 'Paredes', 'francisco.gonzalez@example.com', '987654363', 'Calle Sol 2930'),
('89001245', 'Alejandro', 'S�nchez', 'Jim�nez', 'alejandro.sanchez@example.com', '987654364', 'Av. de la Luna 3031'),
('90112356', 'Susana', 'Ram�rez', 'Lopez', 'susana.ramirez@example.com', '987654365', 'Plaza Fuerte 3132'),
('12345680', 'Ricardo', 'Torres', 'N��ez', 'ricardo.torres@example.com', '987654366', 'Calle Fuerte 3233'),
('23456791', 'Jessica', 'Gonz�lez', 'S�nchez', 'jessica.gonzalez@example.com', '987654367', 'Av. del Sol 3334'),
('34567892', 'Alberto', 'S�nchez', 'Lozano', 'alberto.sanchez@example.com', '987654368', 'Calle Mar 3435'),
('45678903', 'Ver�nica', 'Rodr�guez', 'Torres', 'veronica.rodriguez@example.com', '987654369', 'Av. Primavera 3536');

-- Personas juridicas(importar data desde un archivo plano)

SELECT*FROM personas_juridicas;
SELECT numero_documento, razon_social, email, telefono, domicilio_fiscal AS 'direccion' 
FROM dsrp_prestamos_financieros.dbo.personas_juridicas;

-- sucursales (importar data desde otras bases de datos)
SELECT*FROM sucursales;

SELECT*FROM dsrp_prestamos_financieros.dbo.sucursales;

ALTER TABLE sucursales
ALTER COLUMN direccion NVARCHAR(500);

ALTER TABLE sucursales
ALTER COLUMN codigo VARCHAR(20);