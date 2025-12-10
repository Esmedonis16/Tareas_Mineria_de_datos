data.frame(1:ncol(datos), colnames(datos))
datos_tarea <- datos[,-3]
data.frame(1:ncol(datos_tarea), colnames(datos_tarea))
reglas_tarea <- apriori(datos_tarea, parameter = list(support=0.2, confidence = 0.5))
inspect(reglas_2[0:26])

datos_carrera <- subset(datos_tarea,  CARRERA == "Licenciatura en Administración de Empresas")
reglas_carrera <- apriori(datos_carrera, parameter = list(support=0.2, confidence = 0.5))
inspect(reglas_carrera[0:344])
inspect(subset(reglas_carrera, confidence > 0.7))

datos$CARRERA <- as.factor(datos$CARRERA)
reglas <- apriori(datos, parameter = list(support=0.01, confidence=0.4))
reglas_carrera_sexo <- subset(reglas, lhs %pin% "CARRERA=" & rhs %pin% "Sexo=")
length(reglas_carrera_sexo)
inspect(reglas_carrera_sexo[0:46])


