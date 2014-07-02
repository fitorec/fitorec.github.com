CREATE `alumnos_grupos`
UPDATE `alumnos_id`
SET `Ivan`=[value-1],`Eder`=[value-2]
UPDATE `grupos_id`
SET `sistemas computacionales`=[5to-cuatrimestre],`sistemas computacionales=[6to-cuatrimestre],
 INSERT INTO `alumnos_grupos`
     (alumno_id, grupo_id) VALUES
     (
        SELECT
        alumnos.id AS alumno_id,
        grupos.id AS grupo_id
        FROM grupos, alumnos
        WHERE alumnos.id=20,
     );
