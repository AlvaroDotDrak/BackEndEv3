import MySQLdb

try:
    # Conectar a MySQL (sin especificar DB para poder borrarla)
    db = MySQLdb.connect(host="localhost", user="root", passwd="", port=3306)
    cursor = db.cursor()
    
    # Borrar la base de datos si existe
    cursor.execute("DROP DATABASE IF EXISTS veterinaria_db")
    print("Base de datos 'veterinaria_db' eliminada.")
    
    # Crear la base de datos de nuevo
    cursor.execute("CREATE DATABASE veterinaria_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
    print("Base de datos 'veterinaria_db' creada exitosamente.")
    
    db.close()
except Exception as e:
    print(f"Error: {e}")
