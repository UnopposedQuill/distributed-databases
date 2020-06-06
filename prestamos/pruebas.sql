
use Prestamos
go

exec consultarLibros;
exec consultarPrestamos null;--todos
exec consultarPrestamos 1;--devueltos
exec consultarPrestamos 2;--activos
exec consultarPrestamosVencidos--vencidos

exec prestamoLibro 1, null, null --libro inexistente
exec prestamoLibro 3, 1, null --estudiante no activo o inexistente (no activo en este caso)
exec prestamoLibro 1, 1, null --estudiante moroso