function y=My_modulator(n,B,N,a)
y=zeros(n,a);
    for i = 1:n
        for j = 1 : a
            if B(i,j) == 0
                if N == 1
                    y(i,j) = -1;
                else
                    if B(i,j+a) == 0
                       if N == 2
                          y(i,j) = -1-1j;
                       elseif N==4
                          if B(i,j+2*a) == 0
                              if B(i,j+3*a) == 0
                                  y(i,j) = -3+3*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = -1+3*1j;
                              end
                          elseif B(i,j+2*a) == 1
                              if B(i,j+3*a) == 0
                                  y(i,j) = -3+1*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = -1+1*1j;
                              end
                          end
                       end
                    elseif B(i,j+a) == 1
                        if N == 2
                          y(i,j) = -1+1j;
                       elseif N==4
                          if B(i,j+2*a) == 0
                              if B(i,j+3*a) == 0
                                  y(i,j) = 1+3*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = 3+3*1j;
                              end
                          elseif B(i,j+2*a) == 1
                              if B(i,j+3*a) == 0
                                  y(i,j) = 3+1*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = 1+1*1j;
                              end
                          end
                        end    
                    end
                end
            elseif B(i,j) == 1
                if N == 1
                    y(i,j) = 1;
                else
                    if B(i,j+a) == 0
                       if N == 2
                          y(i,j) = 1-1*1j;
                       elseif N==4
                          if B(i,j+2*a) == 0
                              if B(i,j+3*a) == 0
                                  y(i,j) = 1-1*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = 3-1*1j;
                              end
                          elseif B(i,j+2*a) == 1
                              if B(i,j+3*a) == 0
                                  y(i,j) = 3-3*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = 1-3*1j;
                              end
                          end
                       end
                    elseif B(i,j+a) == 1
                        if N == 2
                          y(i,j) = 1+1*1j;
                       elseif N==4
                          if B(i,j+2*a) == 0
                              if B(i,j+3*a) == 0
                                  y(i,j) = -3-1*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = -1-1*1j;
                              end
                          elseif B(i,j+2*a) == 1
                              if B(i,j+3*a) == 0
                                  y(i,j) = -1-3*1j;
                              elseif B(i,j+3*a) == 1
                                  y(i,j) = -3-3*1j;
                              end
                          end
                        end    
                    end
                end
            end
        end
        
    end   
end