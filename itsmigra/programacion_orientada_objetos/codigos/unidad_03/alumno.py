class Alumno:
	def __init__(self):
		self.matricula = "it20150012"
		self.__nombre= "default Nombre"
juan = Alumno()
''' esto es correcto y lo mas común'''
print("Matricula: ", juan.matricula, "\n\n")

''' Codigo correcto '''
# Accdemos para imprimir el nombre
print("Nombre: ", juan._Alumno__nombre, "\n\n")
# Modificando el nombre
juan._Alumno__nombre = "Juan"
# Accdemos para imprimir el nombre
print("Nombre: ", juan._Alumno__nombre, "\n\n")

''' Codigo de Error '''
# Esto genera error por que desde el exterior no existe la varaible "__nombre"
print("Nombre: ", juan.__nombre, "\n\n")
