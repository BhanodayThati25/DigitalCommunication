function y=My_demodulator(n,B,N,a)
y = zeros(n,N*a);
    for i = 1:n
        for j = 1:a
            if N == 1
                d = zeros(1,2);
                d(1) = abs((B(i,j)-(-1))^2);
                d(2) = abs((B(i,j)-(1))^2);
                if min(d) == d(1)
                    y(i,j) = 0;
                elseif min(d) == d(2)
                    y(i,j) = 1;
                end 
            elseif N == 2
                d = zeros(1,4);
                d(1) = abs((B(i,j)-(-1-1*1j))^2);
                d(2) = abs((B(i,j)-(-1+1*1j))^2);
                d(3) = abs((B(i,j)-(1-1*1j))^2);
                d(4) = abs((B(i,j)-(1+1*1j))^2);
                if min(d) == d(1)
                    y(i,j) = 0;
                    y(i,j+a) = 0;
                elseif min(d) == d(2)
                    y(i,j) = 0;
                    y(i,j+a) = 1;
                elseif min(d) == d(3)
                    y(i,j) = 1;
                    y(i,j+a) = 0;
                elseif min(d) == d(4)
                    y(i,j) = 1;
                    y(i,j+a) = 1;
                end
            elseif N == 4
                d = zeros(1,16);
                 d(1) = abs((B(i,j)-(-3+3j))^2);
                 d(2) = abs((B(i,j)-(-1+3j))^2);
                 d(3) = abs((B(i,j)-(-1+1j))^2);
                 d(4) = abs((B(i,j)-(-3+1j))^2);
                 d(5) = abs((B(i,j)-(1+3j))^2);
                 d(6) = abs((B(i,j)-(3+3j))^2);
                 d(7) = abs((B(i,j)-(1+1j))^2);
                 d(8) = abs((B(i,j)-(3+1j))^2);
                 d(9) = abs((B(i,j)-(-3-1j))^2);
                 d(10) = abs((B(i,j)-(-1-1j))^2);
                 d(11)= abs((B(i,j)-(-1-3j))^2);
                 d(12)= abs((B(i,j)-(-3-3j))^2);
                 d(13)= abs((B(i,j)-(1-1j))^2);
                 d(14)= abs((B(i,j)-(3-1j))^2);
                 d(15)= abs((B(i,j)-(3-3j))^2);
                 d(16)= abs((B(i,j)-(1-3j))^2);
                 if min(d) == d(1)
                   y(i,j) = 0;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 0;
               elseif min(d) == d(2)
                  y(i,j) = 0;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 1;  
               elseif min(d) == d(3)
                   y(i,j) = 0;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 1;    
               elseif min(d) == d(4)
                   y(i,j) = 0;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 0;    
               elseif min(d) == d(5)
                   y(i,j) = 0;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 0;    
                elseif min(d) == d(6)
                   y(i,j) = 0;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 1;    
                 elseif min(d) == d(7)
                   y(i,j) = 0;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 1;    
                 elseif min(d) == d(8)
                   y(i,j) = 0;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 0;    
                   elseif min(d) == d(9)
                   y(i,j) = 1;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 0;    
                   elseif min(d) == d(10)
                   y(i,j) = 1;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 1;    
                   elseif min(d) == d(11)
                   y(i,j) = 1;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 0;    
                   elseif min(d) == d(12)
                   y(i,j) = 1;
                   y(i,j+a) = 1;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 1;    
                   elseif min(d) == d(13)
                   y(i,j) = 1;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 0;  
                    elseif min(d) == d(14)
                   y(i,j) = 1;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 0;
                   y(i,j+3*a) = 1;  
                    elseif min(d) == d(15)
                   y(i,j) = 1;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 0;  
                    elseif min(d) == d(16)
                   y(i,j) = 1;
                   y(i,j+a) = 0;
                   y(i,j+2*a) = 1;
                   y(i,j+3*a) = 1;  
                 end
            end
        end
    end                   
end