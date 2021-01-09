N1=10; N2=100; N3=1000; M=1000;
%нормальное
a1=2;a2=3;
%лаплас
b1=3;b2=4;

k=1+round(3.322*log10(M));

%генерация по нормальному распределению
n=N1; m=M; r_1_1= (a2)*randn(n,m)+a1; 
n=N2; r_1_2= (a2)*randn(n,m)+a1;
n=N3; r_1_3= (a2)*randn(n,m)+a1;
%Rr_1_3=normrnd(a1,a2,N3,M);
%генерация по распределению Лапласа
n=N1; y1=rand(n,m); y2=rand(n,m); r_2_1=(log(y1)-log(y2))*b2 +b1; 
n=N2; y1=rand(n,m); y2=rand(n,m); r_2_2=(log(y1)-log(y2))*b2 +b1;
n=N3; y1=rand(n,m); y2=rand(n,m); r_2_3=(log(y1)-log(y2))*b2 +b1;
%оценка норм.
a1_1_1=mean(r_1_1); a2_1_1=median(r_1_1); a3_1_1=(max(r_1_1)+min(r_1_1))/2;
r1_1_1=std(a1_1_1); r2_1_1=std(a2_1_1); r3_1_1=std(a3_1_1); r1_1=[r1_1_1,r2_1_1,r3_1_1]; 
%теор
s=a2; n=N1; t1_1_1=s/sqrt(n); t2_1_1=s*sqrt(pi/(2*n)); t3_1_1=0.65*s/sqrt(log(n)); 
%для удобства
T1_1=[t1_1_1,t2_1_1,t3_1_1]; 
disp('1_____r1________r2________r3___(10)');disp(r1_1);disp(T1_1);
%гистограммы для параметров a..
figure
tiledlayout(3,1)
nexttile
hold on;grid on
histogram(a1_1_1,k)
[x,h]=hist(a1_1_1,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a2_1_1,k)
[x,h]=hist(a2_1_1,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a3_1_1,k)
[x,h]=hist(a3_1_1,k);
plot(h,x,'--or')
hold off

a1_1_2=mean(r_1_2); a2_1_2=median(r_1_2); a3_1_2=(max(r_1_2)+min(r_1_2))/2;
r1_1_2=std(a1_1_2); r2_1_2=std(a2_1_2); r3_1_2=std(a3_1_2); r2_1=[r1_1_2,r2_1_2,r3_1_2];
%теор
n=N2; t1_1_2=s/sqrt(n); t2_1_2=s*sqrt(pi/(2*n)); t3_1_2=0.65*s/sqrt(log(n));
%для удобства
T1_2=[t1_1_2,t2_1_2,t3_1_2]; 
disp('2_____r1________r2________r3___(100)');disp(r2_1);disp(T1_2);
%гистограммы для параметров a..
figure
tiledlayout(3,1)
nexttile
hold on;grid on
histogram(a1_1_2,k)
[x,h]=hist(a1_1_2,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a2_1_2,k)
[x,h]=hist(a2_1_2,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a3_1_2,k)
[x,h]=hist(a3_1_2,k);
plot(h,x,'--or')
hold off

a1_1_3=mean(r_1_3); a2_1_3=median(r_1_3); a3_1_3=(max(r_1_3)+min(r_1_3))/2;
r1_1_3=std(a1_1_3); r2_1_3=std(a2_1_3); r3_1_3=std(a3_1_3); r3_1=[r1_1_3,r2_1_3,r3_1_3]; 
%теор
n=N3; t1_1_3=s/sqrt(n); t2_1_3=s*sqrt(pi/(2*n)); t3_1_3=0.65*s/sqrt(log(n)); 
%для удобства
T1_3=[t1_1_3,t2_1_3,t3_1_3]; 
disp('3_____r1________r2________r3___(1000)');disp(r3_1);disp(T1_3);
%гистограммы для параметров a..
figure
tiledlayout(3,1)
nexttile
hold on;grid on
histogram(a1_1_3,k)
[x,h]=hist(a1_1_3,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a2_1_3,k)
[x,h]=hist(a2_1_3,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a3_1_3,k)
[x,h]=hist(a3_1_3,k);
plot(h,x,'--or')
hold off

%оценка лаплас.
a1_2_1=mean(r_2_1); a2_2_1=median(r_2_1); a3_2_1=(max(r_2_1)+min(r_2_1))/2;
r1_2_1=std(a1_2_1); r2_2_1=std(a2_2_1); r3_2_1=std(a3_2_1); r1_2=[r1_2_1,r2_2_1,r3_2_1]; 
%теор
u=b2; n=N1; t1_2_1=u*sqrt(2/n); t2_2_1=u/sqrt(n); t3_2_1=0.97*u; 
%для удобства
T2_1=[t1_2_1,t2_2_1,t3_2_1]; 
disp('4_____r1________r2________r3___(10)');disp(r1_2);disp(T2_1);
%гистограммы для параметров a..
figure
tiledlayout(3,1)
nexttile
hold on;grid on
histogram(a1_2_1,k)
[x,h]=hist(a1_2_1,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a2_2_1,k)
[x,h]=hist(a2_2_1,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a3_2_1,k)
[x,h]=hist(a3_2_1,k);
plot(h,x,'--or')
hold off
 
a1_2_2=mean(r_2_2); a2_2_2=median(r_2_2); a3_2_2=(max(r_2_2)+min(r_2_2))/2;
r1_2_2=std(a1_2_2); r2_2_2=std(a2_2_2); r3_2_2=std(a3_2_2); r2_2=[r1_2_2,r2_2_2,r3_2_2]; 
%теор
n=N2; t1_2_2=u*sqrt(2/n); t2_2_2=u/sqrt(n); t3_2_2=0.97*u; 
%для удобства
T2_2=[t1_2_2,t2_2_2,t3_2_2]; 
disp('5_____r1________r2________r3___(100)');disp(r2_2);disp(T2_2);
%гистограммы для параметров a..
figure
tiledlayout(3,1)
nexttile
hold on;grid on
histogram(a1_2_2,k)
[x,h]=hist(a1_2_2,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a2_2_2,k)
[x,h]=hist(a2_2_2,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a3_2_2,k)
[x,h]=hist(a3_2_2,k);
plot(h,x,'--or')
hold off

a1_2_3=mean(r_2_3); a2_2_3=median(r_2_3); a3_2_3=(max(r_2_3)+min(r_2_3))/2;
r1_2_3=std(a1_2_3); r2_2_3=std(a2_2_3); r3_2_3=std(a3_2_3); r3_2=[r1_2_3,r2_2_3,r3_2_3]; 
%теор
n=N3; t1_2_3=u*sqrt(2/n); t2_2_3=u/sqrt(n); t3_2_3=0.97*u; 
%для удобства
T2_3=[t1_2_3,t2_2_3,t3_2_3]; 
disp('6_____r1________r2________r3___(1000)');disp(r3_2);disp(T2_3);
%гистограммы для параметров a..
figure
tiledlayout(3,1)
nexttile
hold on;grid on
histogram(a1_2_3,k)
[x,h]=hist(a1_2_3,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a2_2_3,k)
[x,h]=hist(a2_2_3,k);
plot(h,x,'--or')
hold off
nexttile
hold on;grid on
histogram(a3_2_3,k)
[x,h]=hist(a3_2_3,k);
plot(h,x,'--or')
hold off
%%%%%%%%%%%%

