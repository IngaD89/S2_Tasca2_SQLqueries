SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT * FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND SUBSTRING(nif, CHAR_LENGTH(nif), 1) = 'K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7 AND curso = 3;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS nombre_departamento FROM profesor JOIN persona ON profesor.id_profesor = persona.id JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC, departamento.nombre ASC;
SELECT asignatura.nombre AS nombre_asignatura, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura AS matricula JOIN persona ON persona.id = matricula.id_alumno JOIN asignatura ON asignatura.id = matricula.id_asignatura JOIN curso_escolar ON curso_escolar.id = matricula.id_curso_escolar WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre AS departamento_nombre FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor  JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT * FROM persona JOIN alumno_se_matricula_asignatura matricula ON persona.id = matricula.id_alumno JOIN curso_escolar ce ON matricula.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento Order BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT persona.nombre, persona.apellido1 FROM persona RIGHT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.tipo = "profesor" and profesor.id_departamento is null;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento is null;
SELECT persona.nombre, persona.apellido1 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo = "profesor" and asignatura.nombre is null;
SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor is null;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.nombre is null;
SELECT COUNT(tipo) FROM persona WHERE tipo = "alumno";
SELECT COUNT(tipo) FROM persona WHERE YEAR(fecha_nacimiento) = 1999;
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre Order BY COUNT(profesor.id_profesor) desc;
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT grado.nombre, COUNT(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre Order BY COUNT(asignatura.id_grado) desc;
SELECT grado.nombre, COUNT(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre having COUNT(asignatura.id_grado) > 40;