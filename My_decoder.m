function y=My_decoder(n,B,N,a)
y=zeros(n,N);
    for i = 1:n
        for m = 1:N
            number0 = 0;
            number1 = 0;
            for k = a*(m-1)+1:a*m
                if B(i,k) == 0
                    number0 = number0 +1;
                elseif B(i,k) == 1
                    number1 = number1 +1;   
                end 
            end
            if number0 > number1
                y(i,m) =  0;
            else
                y(i,m) = 1;
            end
        end  
    end
end