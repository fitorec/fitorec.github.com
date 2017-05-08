class Alumno:
	''' Constructor '''
	def __init__(self, name):
		self.__nombre= name
	''' Método setNombre '''
	def setNombre(self, name):
		self.__nombre= name
	''' Método getNombre '''
	def getNombre(self):
		return self.__nombre

# Probando ejemplo
j = Alumno("Juan")
p = Alumno("Pedro")
print(j.getNombre())
print(p.getNombre())
