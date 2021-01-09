function percentHi2(X)
    k=0;
    K_095=3.84;
    m=1000;
    for i=X
        if((i>K_095))
            k=k+1;
        end
    end
    disp("процент=");
    disp(k/m);
end
