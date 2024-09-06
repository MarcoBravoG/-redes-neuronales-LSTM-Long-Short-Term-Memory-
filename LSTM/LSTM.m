% Generar datos simulados (onda senoidal)
n = 100; % Número de datos
t = linspace(0, 10, n)';
data = sin(2*pi*0.1*t); % Onda senoidal

% Dividir los datos en entrenamiento y prueba
trainData = data(1:80);
testData = data(81:end);

% Convertir los datos a celdas de secuencias para LSTM
XTrain = num2cell(trainData(1:end-1))'; % Secuencia de entrada (80 puntos)
YTrain = num2cell(trainData(2:end))';   % Secuencia de salida (79 puntos)

% Definir la arquitectura de la red
layers = [ ...
    sequenceInputLayer(1)                 % Capa de entrada (un valor por paso temporal)
    lstmLayer(50,'OutputMode','sequence') % Capa LSTM con 50 neuronas
    fullyConnectedLayer(1)                % Capa totalmente conectada para salida
    regressionLayer];                     % Capa de regresión para predicción continua

% Especificar las opciones de entrenamiento
options = trainingOptions('adam', ...  % Optimizador Adam
    'MaxEpochs', 250, ...              % Número de épocas
    'GradientThreshold', 1, ...
    'InitialLearnRate', 0.01, ...
    'Verbose', 0, ...
    'Plots', 'training-progress');     % Mostrar progreso del entrenamiento

% Entrenar la red LSTM
net = trainNetwork(XTrain, YTrain, layers, options);

% Predicción en los datos de prueba
XTest = num2cell(testData(1:end-1))';  % Convertir datos de prueba a secuencia
YPred = predict(net, XTest);           % Realizar predicción

% Convertir celdas de salida a matriz para graficar
YPred = cell2mat(YPred);

% Graficar los resultados
figure;
plot(t(1:end-1), data(1:end-1), 'b', 'DisplayName', 'Datos Reales');
hold on;
plot(t(81:end-1), YPred, 'r--', 'DisplayName', 'Predicción');
legend;
title('Predicción de Serie de Tiempo con LSTM');
xlabel('Tiempo');
ylabel('Valor');
