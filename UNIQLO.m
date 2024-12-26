clear; close all;
tau = 0.05; %сек
fd = 1e3; % частота дискретизации 
samples_per_sybl = fd * tau; % отсчетов на символ
encodd = [1 0 0 1 0 1 0 1 0 0 1 1 0 0]; % можно и через ранди
t = linspace(0,length(encodd) * tau, samples_per_sybl * length(encodd)); % временная ось
videopulses = repelem (encodd, samples_per_sybl); % видеосигнал из последовательности  encodd
figure(1)
plot (t, videopulses);
title("Информационная последовательность"); xlabel('t, c'); ylabel('s(t), В');

% ФМн - 2 
% 1 = pi ; 0 = 0
M = 2;

% Параметры модуляции
fc = 55; % несущая частота, Гц
phase_shift = pi; % фазовый сдвиг для 1
%pi/4



% Формируем фазовый сигнал
phases = repelem(encodd * phase_shift, samples_per_sybl); % фазовый сигнал
carrier = cos(2 * pi * fc * t); % несущая частота

% Модулированный сигнал
modulated_signal = cos(2 * pi * fc * t + phases);

figure(2)
plot(t, modulated_signal);
title("PSK-2 модулированный сигнал");
xlabel('t, c'); ylabel('s_{PSK}(t), В');
grid on;

%спектр
    sp = abs(fftshift( fft(videopulses) )); % спектр для видеоимпульсов хемминга
fh = (- length (videopulses) / 2 : length(videopulses) / 2 - 1) * (fd / length(videopulses)); % Частотная ось
figure(3)

plot (fh, sp/max(sp));
title("Спектр последовательности ");xlabel('f, Гц'); ylabel('|S(f)|')

scatterplot(modulated_signal)
