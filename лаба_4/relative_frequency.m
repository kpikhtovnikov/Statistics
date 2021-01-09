function [fregn, I]=relative_frequency(X,n)
    m=1000;
    X=sort(X);
    number=1;
    while number<=m
        X_column=X(:,number);
        xmin=min(X_column);
        xmax=max(X_column);
        k=floor(1+3.322*log(n)/log(10));
        h=(xmax-xmin)/k;
        i=1;
        c=xmin-(1e-10);
        f=0;
        while i<=k
            count=0;
            for j=1:n
                if (X_column(j)>c) & (X_column(j)<=c+h)
                    count=count+1;
                end
            end
            f=f+count;
            I(i,number)=X_column(f);
            fregn(i,number)=count;
            c=xmin+h*i;
            i=i+1;
        end
        number=number+1;
    end
end
