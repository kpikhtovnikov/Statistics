function histogram_for_evaluation(x,k)
nexttile
hold on;grid on
histogram(x,k)
[x,h]=hist(x,k);
plot(h,x,'--or')
hold off