SELECT T.Codigo, T.Descripcion, T.HEstimadas,T.TipoTarea 
                FROM TareasGenericas T, Asignaturas A
                WHERE A.Nombre = 'Herramientas Avanzadas de SW' 
                AND A.codigo = T.CodAsig AND T.Explotacion = 1
                AND T.Codigo NOT IN (SELECT ET.CodTarea 
                FROM EstudiantesTareas ET
                WHERE ET.Email = 'jose@ikasle.ehu.es'); 