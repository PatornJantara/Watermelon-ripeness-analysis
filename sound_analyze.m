% Sound analysis 26-12-2019 
% Coding by Patorn-J

% setup parameter (upper frequency- average sampling rate - Fourier sampling rate)
limit = 200 ;
average_sampling_rate = 10 ;
Fs = 1000;
% plot (time domain - frequency domain - discrete frequency domain)
[data, fs] = audioread('1point1.1.wav');
figure
sound = plot(data,'b'); xlabel('Time(ms)'); ylabel('Amplitude');
title('Signal time domain')
data_fft = fft(data,Fs);
abs_data_fft = abs(data_fft(:,1));
figure
fourier_transform = plot(abs_data_fft); xlabel('Frequency'); ylabel('Amplitude');
title('Signal frequency Domain')
xlim([0,limit])
figure
sampling_fourier_transform = stem(abs_data_fft) ; xlabel('Frequency'); ylabel('Amplitude');
title('Discrete signal frequency Domain')
xlim([0,limit])
% sampling plot setup
sample = abs_data_fft(1:1:limit);
i = 1 ;
old_i = 0 ;
average_i = 0 ;
average_sampling = 0;
old_average_sampling = 0 ;
% plot average sampling point
figure
hold on
while i <= limit 
    average_i = average_i+sample(i);  
    if mod(i,average_sampling_rate) == 0 
        average_sampling = average_i/average_sampling_rate;
        plot([old_i i], [old_average_sampling , average_sampling],'b' )
        old_average_sampling = average_sampling ;
        old_i = i ;
        average_i = 0 ;
        average_sampling = 0 ;
    end
    i = i+1 ;
end
xlabel('Frequency'); ylabel('Amplitude');
title('Average sampling');
hold off
