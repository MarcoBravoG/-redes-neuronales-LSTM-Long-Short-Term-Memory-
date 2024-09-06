# -redes-neuronales-LSTM-Long-Short-Term-Memory-
Explicación paso a paso:

    Generación de datos: Se genera una onda senoidal que se usará como serie de tiempo.
        n = 100: 100 puntos de datos en total.
        data = sin(...): Genera una onda senoidal.

    División de datos: Los primeros 80 puntos se usan para el entrenamiento y los últimos 20 para las pruebas.

    Preparación de datos: Los datos se convierten en celdas de secuencias para que la red LSTM pueda procesarlos.

    Arquitectura de la red:
        sequenceInputLayer(1): Capa de entrada con una característica (un valor por paso temporal).
        lstmLayer(50): Capa LSTM con 50 unidades (neuronas).
        fullyConnectedLayer(1): Capa de salida con un valor (predicción).
        regressionLayer: Se utiliza para tareas de regresión (predicción de valores continuos).

    Opciones de entrenamiento: El optimizador Adam se utiliza para entrenar el modelo durante 250 épocas con una tasa de aprendizaje inicial de 0.01.

    Predicción: Se realiza la predicción de la serie de tiempo sobre los datos de prueba (últimos 20 puntos) y se grafica la comparación entre los datos reales y los predichos.

Este código proporciona un punto de partida para trabajar con LSTM en MATLAB para la predicción de series de tiempo.
