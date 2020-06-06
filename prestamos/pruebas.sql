
use Prestamos
go

exec consultarLibros;
exec consultarPrestamos null;--todos
exec consultarPrestamos 1;--devueltos
exec consultarPrestamos 2;--activos
exec consultarPrestamosVencidos--vencidos

exec prestamoLibroEstudiante 1, null, null --libro inexistente
exec prestamoLibroEstudiante 3, 1, null --estudiante no activo o inexistente (no activo en este caso)
exec prestamoLibroEstudiante 2, 1, null --estudiante moroso con deudas vencidas
exec prestamoLibroEstudiante 5, 1, null --estudiante moroso con préstamos vencidos
exec prestamoLibroEstudiante 1, 1, null --estudiante moroso