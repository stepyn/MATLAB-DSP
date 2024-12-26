clear; close all;

n = 3; % Количество разрядов
num_gray_codes = 2^n; % Количество комбинаций для n-разрядного кода

% Генерация чисел от 0 до 2^n - 1
binary_numbers = 0:(num_gray_codes - 1);

% Преобразование в код Грея
gray_codes = bitxor(binary_numbers, bitshift(binary_numbers, -1));

% Вывод кода Грея 
disp('Четырёхразрядный код Грея:');
for i = 1:num_gray_codes
    fprintf('%s\n', dec2bin(gray_codes(i), n));
end




