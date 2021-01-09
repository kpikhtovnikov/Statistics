n=input("n=");
m=1000;
                    
% Генерация выборок
a=3;
u=4;
y1=rand(n,m);
y2=rand(n,m);
X0=(log(y1)-log(y2))*u+a;
y1=rand(n,m);
y2=rand(n,m);
X1=(log(y1)-log(y2))*u+a+2/(u^2);
y1=rand(n,m);
y2=rand(n,m);
X2=(log(y1)-log(y2))*u+a+(2/(u^2))/3;
y1=rand(n,m);
y2=rand(n,m);
X3=(log(y1)-log(y2))*u+a+(2/(u^2))/10;
y1=rand(n,m);
y2=rand(n,m);
X4=(log(y1)-log(y2))*u+a;

xprim = linspace(min(X0(:,1)), max(X0(:,1)), n);
y = cdflaplace(xprim, a, sqrt(2)*(u));
plot(y);
                        %Критерий Колмогорова-Смирнова
%квантиль уровная 0.95 распределения Колмогорова-Смирнова
%K_095=1.36;

% Отклонение
criterion_statistics_kolmogorov_01=sqrt(n)*(max(abs(sort(X1)-sort(X0))));
criterion_statistics_kolmogorov_02=sqrt(n)*(max(abs(sort(X2)-sort(X0))));
criterion_statistics_kolmogorov_03=sqrt(n)*(max(abs(sort(X3)-sort(X0))));
criterion_statistics_kolmogorov_04=sqrt(n)*(max(abs(sort(X4)-sort(X0))));
%g=var(X0);
%gamma = 0.95
disp("сдвиг θ = β")
percentKolmogorov(criterion_statistics_kolmogorov_01);
disp("сдвиг θ = β/3")
percentKolmogorov(criterion_statistics_kolmogorov_02);
disp("сдвиг θ = β/10")
percentKolmogorov(criterion_statistics_kolmogorov_03);
disp("сдвиг θ = 0")
percentKolmogorov(criterion_statistics_kolmogorov_04);

                        %Критерий Xи-квадрат
fregn_X0=relative_frequency(X0,n);
%fregn_Xi=fregn_X0=relative_frequency(X1,n);

degree_of_freedom_10 = 7.81;
degree_of_freedom_100 = 7;
degree_of_freedom_1000 = 7;
%квантиль уровная 0.95 распределения Хи-квадрат
%K_095=3.84;      

% Отклонение
%criterion_statistics_Xi2_01=sqrt(n)*(max(abs(sort(X1)-sort(X0))));
%criterion_statistics_Xi2_02=sqrt(n)*(max(abs(sort(X2)-sort(X0))));
%criterion_statistics_Xi2_03=sqrt(n)*(max(abs(sort(X3)-sort(X0))));
%criterion_statistics_Xi2_04=sqrt(n)*(max(abs(sort(X4)-sort(X0))));
%g=var(X0);
%gamma = 0.95
%disp("сдвиг θ = β")
%percentHi2(criterion_statistics_Xi2_01);
%disp("сдвиг θ = β/3")
%percentHi2(criterion_statistics_Xi2_02);
%disp("сдвиг θ = β/10")
%percentHi2(criterion_statistics_Xi2_03);
%disp("сдвиг θ = 0")
%percentHi2(criterion_statistics_Xi2_04);