n=input("n=");
m=1000;

% распределение Лапласа
a=3;
u=4;
y1=rand(n,m);
y2=rand(n,m);
X=(log(y1)-log(y2))*u+a;

c = 1.645;
gamma = 0.9;

k=0;
medianX=median(X);
for medianx=medianX
    s1 = medianx-c*u/(sqrt(n));
    s2 = medianx+c*u/(sqrt(n));
    %disp(s1);
    %disp(s2);
    if((a<s2)&&(a>s1))
        k=k+1;
    end
end

percent = k/m;
disp("percent=");
disp(percent);