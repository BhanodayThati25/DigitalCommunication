function y=My_encoder(n,B,N,a)
y=zeros(n,N*a);
    for i = 1:n
        for k = 1:N
            if B(i,k) == 0
                for j = (k-1)*a+1:k*a
                y(i,j) = 0;
                end
            elseif B(i,k) == 1
                for j = (k-1)*a+1:k*a
                y(i,j) = 1;
                end        
            end
        end  
    end
end