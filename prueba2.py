from datetime import date
class Libro: 
    def __init__(self, titulo, autor, editorial, isbn):
        self.titulo = titulo
        self.autor = autor
        self.editorial = editorial
        self.isbn = isbn
        self.disponible = True
        self.historial = []

    def __str__(self):
        estado = "Disponible" if self.disponible else "Prestado"
        return f"{self.titulo} - {self.autor} ({self.editorial}) | {estado}"
    

class Usuario: 
    def __init__(self, nombre, usuario_id):
        self.nombre = nombre
        self.usuario_id = usuario_id
        self.libros_prestados = []

    def __str__(self):
        return f"Usuarios: {self.nombre} (ID: {self.usuario_id}) | Libros Prestados: {len(self.libros_prestados)}"  


class Bibliotecas:
    def __init__(self, nombre):
        self.nombre = nombre
        self.libros = []
        self.usuarios = []

    def agregar_libros(self, libro):
        self.libros.append(libro)
        print(f"Libro '{libro.titulo}' agregado a la biblioteca")
        
    def registrar_usuario(self, usuario):
        self.usuarios.append(usuario)
        print(f"Usuario '{usuario.nombre}' registrado en la biblioteca")

    def prestar_libro(self, isbn, usuario_id):
        libro = next((libro for libro in self.libros if libro.isbn == isbn), None)
        usuario = next((usuario for usuario in self.usuarios if usuario.usuario_id == usuario_id), None)

        if not libro: 
            print("Libro no encontrado")
            return
        if not usuario:
            print("Usuario no encontrado")
            return
        if not libro.disponible:
            print(f"El libro '{libro.titulo}' no está disponible")
            return
        
        libro.disponible = False
        libro.historial.append({"usuario": usuario.nombre, "fecha": date.today()})
        usuario.libros_prestados.append(libro)
        print(f"Libro '{libro.titulo}' prestado a {usuario.nombre} el {date.today()}")

    def devolver_libro(self, isbn, usuario_id):
        usuario = next((usuario for usuario in self.usuarios if usuario.usuario_id == usuario_id), None)
        libro = next ((libro for libro in usuario.libros_prestados if libro.isbn == isbn), None)
        if not libro:
            print("Este usuario no tiene ese libro.")
            return
        
        libro.disponible = True
        usuario.libros_prestados.remove(libro)
        print(f"Libro '{libro.titulo}' devuelto por {usuario.nombre}.")

    def buscar_libro(self, termino):
        resultados = [libro for libro in self.libros if termino.lower() in libro.titulo.lower() or termino.lower() in libro.autor.lower()]

        if resultados:
            for libro in resultados:
                print(libro)
        else:
            print("No se encontraron libros con ese título.")



    #prueba
Biblioteca = Bibliotecas("Biblioteca Central")

libro1 = Libro("Cien años de soledad", "Gabriel García Márquez", "Sudamericana", "978-0307474728")
libro2 = Libro("El Principito", "Antoine de Saint-Exupery", "Reynal", "978-0156012195")
libro3 = Libro("El amor en los tiempos del cólera", "Gabriel García Márquez", "Oveja Negra", "978-03")

usuario1 = Usuario("David Jimenez", "U001")
usuario2 = Usuario("Ana Garcia", "U002")

Biblioteca.agregar_libros(libro1)
Biblioteca.agregar_libros(libro2)
Biblioteca.agregar_libros(libro3)
Biblioteca.registrar_usuario(usuario1)
Biblioteca.registrar_usuario(usuario2)

print("\n---- PRÉSTAMO ----")
Biblioteca.prestar_libro("978-0307474728", "U001")
Biblioteca.prestar_libro("978-0156012195", "U002")

print("\n---- BÚSQUEDA ----")
Biblioteca.buscar_libro("Cien años")

print("\n---- DEVOLUCIÓN ----")
Biblioteca.devolver_libro("978-0307474728", "U001") 

print("\n---- ESTADO USUARIOS ----")
print(usuario1) 
print(usuario2) 