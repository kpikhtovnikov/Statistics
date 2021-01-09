n=input("n=");
m=1000;

% Равномерное распределение
a=4;
d=5;
A=a-d/2;
B=a+d/2;
X=(B-A)*rand(n,m)+A;

gamma = 0.90;

k=0;
half_sumX=(max(X)+min(X))/2;
for half_sumx=half_sumX
    s1 = half_sumx+(log(1-gamma)*(d/n))/2;
    s2 = half_sumx-(log(1-gamma)*(d/n))/2;
    %disp(s1);
    %disp(s2);
    if((a<s2)&&(a>s1))
        k=k+1;
    end
end

percent = k/m;
disp("percent=");
disp(percent);