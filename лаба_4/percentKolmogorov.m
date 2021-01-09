function percentKolmogorov(X)
    k=0;
    K_095=1.36;
    m=1000;
    for i=X
        if((i>K_095))
            k=k+1;
        end
    end
    disp("процент=");
    disp(k/m);
end
