N1=10; N2=100; N3=1000; 
M=1000;
%распределение равномерное
a1=4;a2=5;
%распределение Лапласа
b1=3;b2=4;

%шаг гистограммы
k=1+round(3.322*log10(M));

%генерация по равномерному распределению
m=M; 
A=a1-a2/2;
B=a1+a2/2;
n=N1; r_1_1= (B-A)*rand(n,m)+A; 
n=N2; r_1_2= (B-A)*rand(n,m)+A;
n=N3; r_1_3= (B-A)*rand(n,m)+A;
%генерация по распределению Лапласа
n=N1; y1=rand(n,m); y2=rand(n,m); r_2_1=(log(y1)-log(y2))*b2 +b1; 
n=N2; y1=rand(n,m); y2=rand(n,m); r_2_2=(log(y1)-log(y2))*b2 +b1; 
n=N3; y1=rand(n,m); y2=rand(n,m); r_2_3=(log(y1)-log(y2))*b2 +b1; 
%оценки a1,a2,a3 и СКО оценок для равномерного распределения при N=10
a1_1_1=mean(r_1_1); a2_1_1=median(r_1_1); a3_1_1=(max(r_1_1)+min(r_1_1))/2;
r1_1_1=std(a1_1_1); r2_1_1=std(a2_1_1); r3_1_1=std(a3_1_1); 
r1_1=[r1_1_1,r2_1_1,r3_1_1]; 
%теоретические данные для равномерного распределения при N=10
d=a2; n=N1; t1_1_1=d/sqrt(12*n); t2_1_1=d/(2*sqrt(n)); t3_1_1=d/sqrt(2*(n+1)*(n+2)); 
t1_1=[t1_1_1,t2_1_1,t3_1_1];
%Вывод практических и теоретических характеристик разброса СКО оценок
disp('Равномерное распределение ');
disp('1_____r1________r2________r3___(10)');disp(r1_1);
disp('1_____t1________t2________t3___(10)');disp(t1_1);

%гистограммы для параметров a для равномерного распределения при N=10
figure
tiledlayout(3,1)
histogram_for_evaluation(a1_1_1,k)
histogram_for_evaluation(a2_1_1,k)
histogram_for_evaluation(a3_1_1,k)

%оценки a1,a2,a3 и СКО оценок для равномерного распределения при N=100
a1_1_2=mean(r_1_2); a2_1_2=median(r_1_2); a3_1_2=(max(r_1_2)+min(r_1_2))/2;
r1_1_2=std(a1_1_2); r2_1_2=std(a2_1_2); r3_1_2=std(a3_1_2); 
r2_1=[r1_1_2,r2_1_2,r3_1_2];
%теоретические данные для равномерного распределения при N=100
n=N2; t1_1_2=d/sqrt(12*n); t2_1_2=d/(2*sqrt(n)); t3_1_2=d/sqrt(2*(n+1)*(n+2)); 
t1_2=[t1_1_2,t2_1_2,t3_1_2]; 
%Вывод практических и теоретических характеристик разброса СКО оценок
disp('2_____r1________r2________r3___(100)');disp(r2_1);
disp('2_____t1________t2________t3___(100)');disp(t1_2);
%гистограммы для параметров a для равномерного распределения при N=100
figure
tiledlayout(3,1)
histogram_for_evaluation(a1_1_2,k)
histogram_for_evaluation(a2_1_2,k)
histogram_for_evaluation(a3_1_2,k)

%оценки a1,a2,a3 и СКО оценок для равномерного распределения при N=1000
a1_1_3=mean(r_1_3); a2_1_3=median(r_1_3); a3_1_3=(max(r_1_3)+min(r_1_3))/2;
r1_1_3=std(a1_1_3); r2_1_3=std(a2_1_3); r3_1_3=std(a3_1_3); 
r3_1=[r1_1_3,r2_1_3,r3_1_3]; 
%теоретические данные для равномерного распределения при N=1000
n=N3; t1_1_3=d/sqrt(12*n); t2_1_3=d/(2*sqrt(n)); t3_1_3=d/sqrt(2*(n+1)*(n+2)); 
t1_3=[t1_1_3,t2_1_3,t3_1_3]; 
%Вывод практических и теоретических характеристик разброса СКО оценок
disp('3_____r1________r2________r3___(1000)');disp(r3_1);
disp('3_____t1________t2________t3___(1000)');disp(t1_3);
%гистограммы для параметров a для равномерного распределения при N=1000
figure
tiledlayout(3,1)
histogram_for_evaluation(a1_1_3,k)
histogram_for_evaluation(a2_1_3,k)
histogram_for_evaluation(a3_1_3,k)

%оценки a1,a2,a3 и СКО оценок для распределения Лапласа при N=10
a1_2_1=mean(r_2_1); a2_2_1=median(r_2_1); a3_2_1=(max(r_2_1)+min(r_2_1))/2;
r1_2_1=std(a1_2_1); r2_2_1=std(a2_2_1); r3_2_1=std(a3_2_1); 
r1_2=[r1_2_1,r2_2_1,r3_2_1]; 
%теоретические данные для распределения Лапласа при N=10
u=b2; n=N1; t1_2_1=u*sqrt(2/n); t2_2_1=u/sqrt(n); t3_2_1=0.97*u; 
t2_1=[t1_2_1,t2_2_1,t3_2_1];
%Вывод практических и теоретических характеристик разброса СКО оценок
disp('Распределение Лапласа');
disp('4_____r1________r2________r3___(10)');disp(r1_2);
disp('4_____t1________t2________t3___(10)');disp(t2_1);
%гистограммы для параметров a для распределения Лапласа при N=10
figure
tiledlayout(3,1)
histogram_for_evaluation(a1_2_1,k)
histogram_for_evaluation(a2_2_1,k)
histogram_for_evaluation(a3_2_1,k)

%оценки a1,a2,a3 и СКО оценок для распределения Лапласа при N=100
a1_2_2=mean(r_2_2); a2_2_2=median(r_2_2); a3_2_2=(max(r_2_2)+min(r_2_2))/2;
r1_2_2=std(a1_2_2); r2_2_2=std(a2_2_2); r3_2_2=std(a3_2_2); 
r2_2=[r1_2_2,r2_2_2,r3_2_2]; 
%теоретические данные для распределения Лапласа при N=100
n=N2; t1_2_2=u*sqrt(2/n); t2_2_2=u/sqrt(n); t3_2_2=0.97*u; 
t2_2=[t1_2_2,t2_2_2,t3_2_2]; 
%Вывод практических и теоретических характеристик разброса СКО оценок
disp('5_____r1________r2________r3___(100)');disp(r2_2);
disp('5_____t1________t2________t3___(100)');disp(t2_2);
%гистограммы для параметров a для распределения Лапласа при N=100
figure
tiledlayout(3,1)
histogram_for_evaluation(a1_2_2,k)
histogram_for_evaluation(a2_2_2,k)
histogram_for_evaluation(a3_2_2,k)

%оценки a1,a2,a3 и СКО оценок для распрделения Лапласа при N=1000
a1_2_3=mean(r_2_3); a2_2_3=median(r_2_3); a3_2_3=(max(r_2_3)+min(r_2_3))/2;
r1_2_3=std(a1_2_3); r2_2_3=std(a2_2_3); r3_2_3=std(a3_2_3); 
r3_2=[r1_2_3,r2_2_3,r3_2_3]; 
%теоретические данные для распределения Лапласа при N=1000
n=N3; t1_2_3=u*sqrt(2/n); t2_2_3=u/sqrt(n); t3_2_3=0.97*u; 
t2_3=[t1_2_3,t2_2_3,t3_2_3];
%Вывод практических и теоретических характеристик разброса СКО оценок
disp('6_____r1________r2________r3___(1000)');disp(r3_2);
disp('6_____t1________t2________t3___(1000)');disp(t2_3);
%гистограммы для параметров a для распределения Лапласа при N=1000
figure
tiledlayout(3,1)
histogram_for_evaluation(a1_2_3,k)
histogram_for_evaluation(a2_2_3,k)
histogram_for_evaluation(a3_2_3,k)

boxplot(a1_1_1)
