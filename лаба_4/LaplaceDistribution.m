n=input("n=");
m=1000;
% t = 2/16, 2/48, 2/160, 0
a=3;
u=4;
t=0;
y1=rand(n,m);
y2=rand(n,m);
X=(log(y1)-log(y2))*u+(a+t);
Y = sort(X);
%xprim = linspace(min(Y(:,1)), max(Y(:,1)), n);
Teor_distribution = cdflaplace(Y, a,sqrt(2)*u);

for i=1:m
    for j=1:n
        M(j,i) = max(abs((j - 1)/n - Teor_distribution(j,i)), abs(j/n - Teor_distribution(j,i)));
    end
end
M;
maximum = max(M);
maximum;
k = 0;
for i=1:m
    criterion_statistics_kolmogorov = sqrt(n) * maximum(i);
    if criterion_statistics_kolmogorov > 1.36
        k = k + 1;
    end
end
k;
fprintf("Мощность критерия Колмогорова: %f\n", k / m);

r = floor(1+3.322*log10(n));
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
%[nh I]=relative_frequency(Y,n);
nh;
I;
nu = nh./n;

for i=1:m
    for j=1:r
        if j == 1
            P(j,i) = cdflaplace(I(j,i), a, sqrt(2)*(u));
        else
            P(j,i) = cdflaplace(I(j,i), a,sqrt(2)*(u)) - cdflaplace(I(j - 1,i), a,sqrt(2)*(u));
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

