# Usa una imagen base de Java para compilar el código
FROM openjdk:11-jdk-slim AS build

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el código fuente al contenedor
COPY src /app/src

# Compila el código fuente
RUN javac /app/src/Main.java -d /app/out

# Crea un archivo JAR
RUN jar cfe /app/my-java-app.jar Main -C /app/out .

# Usa una imagen base más pequeña para ejecutar el JAR
FROM openjdk:11-jre-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo JAR desde la fase de compilación
COPY --from=build /app/my-java-app.jar /app/my-java-app.jar

# Ejecuta la aplicación
CMD ["java", "-jar", "my-java-app.jar"]
