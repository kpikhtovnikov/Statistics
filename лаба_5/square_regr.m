%Исходные данные
xmin = -1.8; xmax = 2.6;
n = 40; sigma = 1.2;
a0 = -3.3; a1 = -1.7; a2 = 0.3;
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
y = a2*x.^2+a1*x+a0+z;
a = polyfit(x, y, 2);
a2Apr = a(1);
a1Apr = a(2);
a0Apr = a(3);
yIst = a2*x.^2+a1*x +a0;
yRegr = a2Apr*x.^2+a1Apr *x + a0Apr;
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
ost_disp = ost_disp/(n-3);
X = [x'.^2 x' ones(n, 1)];
A = X'*X;
C = inv(A);
disp("A=");
disp(A);
disp("C=");
disp(Aobr);
