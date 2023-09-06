clear all
clear
clc
Mode = input('Enter "1" if you want "BPSK modulation",\nEnter "2" if you want "QPSK modulation",\nEnter "4" if you want "16-QAM modulation":');
if Mode ~= 1 && Mode ~= 2 && Mode ~= 4 
    disp('wrong input');
    return;
end
n_bits    = 90000; % number of bits
M_bits    = rand(n_bits,1) > 0.5;  %message signal generated with rand function
n_symbols = ceil(n_bits/Mode);
SNR_db    = [0:20]; % multiple Eb/N0 values
norm      = [1,sqrt(2),0,sqrt(10)];
bits      = My_matrix(n_bits,Mode,M_bits);
PE_bits   = zeros(5,length(SNR_db)); %error probability of bits  
PE_symbol = zeros(5,length(SNR_db)); %error probability of symbols
for e = 1:2
for b = 1:2
for m =3%1 : 2 : 5
    for i = 1:length(SNR_db)
        encod_bits = My_encoder(n_symbols,bits,Mode,m);
        if b == 1
            int_bits   = My_interleaver(n_symbols,encod_bits,Mode,m); %interlever bits
        else
            int_bits   = encod_bits;
        end
        mod_bits   = My_modulator(n_symbols,int_bits,Mode,m);
        noise      = norm(Mode)/sqrt(2)*[randn(m,n_symbols) + 1i*randn(m,n_symbols)]'; %guassian noise
        if e ==2
        for c = 24*n_symbols/50 : 26*n_symbols/50
            for d = 1 : m
            noise(c,d) = 3*norm(Mode)/sqrt(2)*[randn(1,1) + 1i*randn(1,1)]';
            end
        end
        end
        rec_bits   = mod_bits + 10^(-SNR_db(i)/20)*noise; % recieved symbols
        demod_bits = My_demodulator(n_symbols,rec_bits,Mode,m);
        if b == 1
            deint_bits = My_deinterleaver(n_symbols,demod_bits,Mode,m);
        else
            deint_bits = demod_bits;
        end
        final_bits = My_decoder(n_symbols,deint_bits,Mode,m);
        error =0;
        errorl =0;
        for j = 1:n_symbols
          if Mode == 1
              if bits(j) ~= final_bits(j) 
                error = error + 1;
              end
              errorl = error ;
              theory_graph = 0.5*erfc(sqrt(10.^(SNR_db/10)));
          elseif Mode == 2
              if bits(j,1) ~= final_bits(j,1) || bits(j,2) ~= final_bits(j,2)
                error = error + 1;
              end
              for a = 1:Mode
                  if bits(j,a) ~= final_bits(j,a)
                      errorl = errorl + 1;
                  end
              end
              theory_graph = erfc(sqrt(0.5*(10.^(SNR_db/10)))) - (1/4)*(erfc(sqrt(0.5*(10.^(SNR_db/10))))).^2;
          elseif Mode == 4
              if bits(j,1) ~= final_bits(j,1) || bits(j,2) ~= final_bits(j,2) || bits(j,3) ~= final_bits(j,3) || bits(j,4) ~= final_bits(j,4)
                error = error + 1;
              end
              for a = 1:Mode
                  if bits(j,a) ~= final_bits(j,a)
                      errorl = errorl + 1;
                  end
              end
              theory_graph = 3/2*erfc(sqrt(0.1*(10.^(SNR_db/10))));
          end
        end
     PE_bits(m,i) = errorl/n_bits;    
     PE_symbol(m,i) =error/n_symbols;
    end
end
figure(1)
    semilogy(SNR_db,PE_symbol(1,:));
    hold on
    semilogy(SNR_db,PE_symbol(3,:));
    %semilogy(SNR_db,PE_symbol(5,:));
    %semilogy(SNR_db,theory_graph);
    grid on
    xlabel('SNR, dB');
    ylabel('Symbol Error Rate');
    title('Symbol error probability curve');
figure(2)
    semilogy(SNR_db,PE_bits(1,:));
    hold on
    semilogy(SNR_db,PE_bits(3,:));
    %semilogy(SNR_db,PE_bits(5,:));
    grid on
    xlabel('SNR, dB');
    ylabel('Bit Error Rate');
    title('Bit error probability curve');
end
end