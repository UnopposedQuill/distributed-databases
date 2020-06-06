
use Prestamos
go

exec consultarLibros;
exec consultarPrestamos null;--todos
exec consultarPrestamos 1;--devueltos
exec consultarPrestamos 2;--activos
exec consultarPrestamosVencidos--vencidos

--fallos
exec prestamoLibroEstudiante 1, null, null --libro inexistente
exec prestamoLibroEstudiante 3, 1, null --estudiante no activo o inexistente (no activo en este caso)
exec prestamoLibroEstudiante 2, 1, null --estudiante moroso con deudas vencidas
exec prestamoLibroEstudiante 5, 1, null --estudiante con préstamos vencidos
exec prestamoLibroEstudiante 1, 1, null --estudiante moroso

--correcto
exec prestamoLibroEstudiante 4, 1, null

--fallos (profesores)
exec prestamoLibroProfesor 1, null, null --libro inexistente
exec prestamoLibroProfesor 2, 1, null --profesor no activo o inexistente (no activo en este caso)
exec prestamoLibroProfesor 3, 1, null --profesor moroso con deudas vencidas
exec prestamoLibroProfesor 4, 1, null --profesor con préstamos vencidos
exec prestamoLibroProfesor 5, 1, null --profesor moroso

--correcto
exec prestamoLibroProfesor 1, 1, null