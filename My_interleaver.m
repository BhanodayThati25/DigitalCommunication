function y=My_interleaver(n,B,N,a)
y=zeros(n,N*a);
k=1;
    for i = 1:N*a
        l=1;
        for j = 1:n
            y(floor(k),l) = B(j,i);
            if l == N*a
                l=0;
            end
            l=l+1;
            k=k+1/(N*a);
        end
    end 
end
