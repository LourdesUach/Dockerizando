# Usar una imagen base de OpenJDK
FROM openjdk:11-jdk-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar git
RUN apt-get update && apt-get install -y git

# Clonar el repositorio
RUN git clone https://github.com/LourdesUach/Dockerizando.git .

# Compilar el programa Java
RUN javac App.java

# Ejecutar el programa Java
CMD ["java", "App"]
