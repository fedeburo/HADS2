SELECT A.Nombre 
              FROM Asignaturas A, EstudiantesGrupo EG, Usuarios U, GruposClase GC 
                WHERE U.email= 'pepe@ikasle.ehu.es' and U.email=  EG.Email
                and EG.Grupo = GC.codigo AND GC.codigoasig = A.codigo;