
use Prestamos
go

exec consultarLibros;
exec consultarPrestamos null;--todos
exec consultarPrestamos 1;--devueltos
exec consultarPrestamos 2;--activos
exec consultarPrestamosVencidos--vencidos

exec prestamoLibro 1, 1, (DATEADD(month, 1, GETDATE()));