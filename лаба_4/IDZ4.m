clear all
clc
n = 1000; %n = 10, 100, 1000
m = 1000;
a_norm = 4;
s = 4;
a_ravn = 4;
d = 4;
A = a_ravn - d / 2;
B = a_ravn + d / 2;

t = 1.6; %t = 16, 16/3, 1.6, 0
X = s * randn(n,m) + (a_norm - t);
Y = sort(X);
Teor = normcdf(Y, a_norm, s);

for i=1:m
    for j=1:n
        M(j,i) = max(abs((j - 1)/n - Teor(j,i)), abs(j/n - Teor(j,i)));
    end
end
M;
MAX = max(M);
MAX;
k = 0;
for i=1:m
    Tn = sqrt(n) * MAX(i);
    if Tn > 1.36
        k = k + 1;
    end
end
k;
fprintf("Мощность критерия Колмогорова: %f\n", k / m);

r = fix(log2(n)) + 1;
h = fix((n - 1) / r);
for i=1:m
    for j=1:r
        if j == r
            nh(j,i) = n - h * (r - 1);
            I(j,i) = Y(n, i);
        else
            nh(j,i) = h;
            I(j,i) = Y(j * h, i);
        end
    end
end
nh;
I;
nu = nh./n;

for i=1:m
    for j=1:r
        if j == 1
            P(j,i) = normcdf(I(j,i), a_norm, s);
        else
            P(j,i) = normcdf(I(j,i), a_norm, s) - normcdf(I(j - 1,i), a_norm, s);
        end
    end
end
P;

Pirs = zeros(1,m);
for i=1:m
    for j=1:r
        Pirs(1,i) = Pirs(1,i) + ((nh(j,i) - n * P(j,i))^2 / (n * P(j,i)));
    end
end
Pirs;
k = 0;
for i=1:m
    if Pirs(1,i) > chi2inv(0.95, r - 1)
        k = k + 1;
    end
end
k;
fprintf("Мощность критерия хи-квадрат: %f\n", k / m);


