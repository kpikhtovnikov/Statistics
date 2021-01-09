%Исходные данные
xmin = -1.8; xmax = 2.6;
n = 40; sigma = 1.2;
c0 = -1.4; c1 = 7.2;
%Сформировали вектор х из n элементов
step = (xmax-xmin)/(n-1);
x(n) = 0;
x(1) = xmin;
for i = 1:(n-1)
x(i+1) = xmin + step*i;
end
%Сгенерировали гауссовский случайный шум Z
z = sigma*randn(n, 1).';
%Вектор у
y = c1*x+c0+z;
%Построение оценок параметров. Построение графиков
c = polyfit(x, y, 1);
c1_apr = c(1);
c0_apr = c(2);
yIst = c1*x +c0;
yRegr = c1_apr *x + c0_apr;
figure ('name', 'first_plot');
hold on;
plot(x, y, 'bx', 'MarkerSize', 10);
plot(x, yIst,'-g');
plot(x, yRegr,'-r');
hold off;
%Изображение остатков
e = y - yRegr;
figure ('Name', 'second_plot');
plot(x, e, 'm.', 'MarkerSize', 10);
%Остаточная дисперсия
ost_disp = 0;
for i = 1:n
ost_disp = ost_disp + (e(i))^2;
end
ost_disp = ost_disp/(n-2);
disp("Остаточная дисперсия = ");
disp(ost_disp);