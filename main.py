import os
import sys

def unir_archivos(extension, directorio, archivo_salida):
  """
  Une todos los archivos con la extensión especificada en un solo archivo.

  Args:
    extension: La extensión de los archivos a unir.
    directorio: El directorio donde se encuentran los archivos.
    archivo_salida: El nombre del archivo de salida.
  """

  with open(archivo_salida, "a") as f:
    for archivo in os.listdir(directorio):
      if archivo.endswith(extension):
        with open(os.path.join(directorio, archivo), "r") as a:
          #print("contenido de " + archivo + ": " + a.read())
          f.write(a.read())

      # Comprobar si el archivo es un directorio.
      if os.path.isdir(os.path.join(directorio, archivo)):
        # Recursiva para buscar archivos en el subdirectorio.
        unir_archivos(extension, os.path.join(directorio, archivo), archivo_salida)

def unir_archivos_cpp(directorio, archivo_salida):
  """
  Une todos los archivos .cpp en un solo archivo.

  Args:
    directorio: El directorio donde se encuentran los archivos.
    archivo_salida: El nombre del archivo de salida.
  """

  unir_archivos(".cpp", directorio, archivo_salida)

def unir_archivos_h(directorio, archivo_salida):
  """
  Une todos los archivos .h en un solo archivo.

  Args:
    directorio: El directorio donde se encuentran los archivos.
    archivo_salida: El nombre del archivo de salida.
  """

  unir_archivos(".h", directorio, archivo_salida)


def unir_archivos_py(directorio, archivo_salida):
  """
  Une todos los archivos .py en un solo archivo.

  Args:
    directorio: El directorio donde se encuentran los archivos.
    archivo_salida: El nombre del archivo de salida.
  """

  unir_archivos(".py", directorio, archivo_salida)

if __name__ == "__main__":
  # Obtener los argumentos del programa.
  directorio = sys.argv[1]
  archivo_salida = sys.argv[2]

  print("Archivo salida: " + archivo_salida)

  # Unir los archivos .cpp.
  #unir_archivos_cpp(directorio, archivo_salida)
  #unir_archivos_h(directorio, archivo_salida)

  #Unir los archivos .py.
  unir_archivos_py(directorio, archivo_salida)