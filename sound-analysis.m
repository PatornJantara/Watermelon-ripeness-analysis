% Sound analysis 26-12-2019 
% Coding by Patorn - J

% setup parameter (upper frequency- average sampling rate - Fourier sampling rate)
limit = 200 ; 
average_sampling_rate = 10 ;  % sampling
Fs = 1000;
% plot (time domain - frequency domain - discrete frequency domain)

% unripe.wav
[unripe_1, fs] = audioread('1point1.1.wav');
[unripe_2, fs] = audioread('1point1.2.wav');
[unripe_3, fs] = audioread('1point1.3.wav');
[unripe_4, fs] = audioread('1point1.4.wav');
[unripe_5, fs] = audioread('1point1.5.wav');
[unripe_6, fs] = audioread('1point1.6.wav');
[unripe_7, fs] = audioread('1point1.7.wav');
[unripe_8, fs] = audioread('1point1.8.wav');
[unripe_9, fs] = audioread('1point1.9.wav');
[unripe_10, fs] = audioread('1point1.10.wav');

% ripe.wav
[ripe_1, fs] = audioread('2point1.1.wav');
[ripe_2, fs] = audioread('2point1.2.wav');
[ripe_3, fs] = audioread('2point1.3.wav');
[ripe_4, fs] = audioread('2point1.4.wav');
[ripe_5, fs] = audioread('2point1.5.wav');
[ripe_6, fs] = audioread('2point1.6.wav');
[ripe_7, fs] = audioread('2point1.7.wav');
[ripe_8, fs] = audioread('2point1.8.wav');
[ripe_9, fs] = audioread('2point1.9.wav');
[ripe_10, fs] = audioread('2point1.10.wav');

% tranform to frequency domian unripe
unripe_1_fft = fft(unripe_1,Fs);
unripe_2_fft = fft(unripe_2,Fs);
unripe_3_fft = fft(unripe_3,Fs);
unripe_4_fft = fft(unripe_4,Fs);
unripe_5_fft = fft(unripe_5,Fs);
unripe_6_fft = fft(unripe_6,Fs);
unripe_7_fft = fft(unripe_7,Fs);
unripe_8_fft = fft(unripe_8,Fs);
unripe_9_fft = fft(unripe_9,Fs);
unripe_10_fft = fft(unripe_10,Fs);

% tranform to frequency domian ripe
ripe_1_fft = fft(ripe_1,Fs);
ripe_2_fft = fft(ripe_2,Fs);
ripe_3_fft = fft(ripe_3,Fs);
ripe_4_fft = fft(ripe_4,Fs);
ripe_5_fft = fft(ripe_5,Fs);
ripe_6_fft = fft(ripe_6,Fs);
ripe_7_fft = fft(ripe_7,Fs);
ripe_8_fft = fft(ripe_8,Fs);
ripe_9_fft = fft(ripe_9,Fs);
ripe_10_fft = fft(ripe_10,Fs);

% abs unripe
abs_unripe_1_fft = abs(unripe_1_fft(:,1));
abs_unripe_2_fft = abs(unripe_2_fft(:,1));
abs_unripe_3_fft = abs(unripe_3_fft(:,1));
abs_unripe_4_fft = abs(unripe_4_fft(:,1));
abs_unripe_5_fft = abs(unripe_5_fft(:,1));
abs_unripe_6_fft = abs(unripe_6_fft(:,1));
abs_unripe_7_fft = abs(unripe_7_fft(:,1));
abs_unripe_8_fft = abs(unripe_8_fft(:,1));
abs_unripe_9_fft = abs(unripe_9_fft(:,1));
abs_unripe_10_fft = abs(unripe_10_fft(:,1));

% abs ripe
abs_ripe_1_fft = abs(ripe_1_fft(:,1));
abs_ripe_2_fft = abs(ripe_2_fft(:,1));
abs_ripe_3_fft = abs(ripe_3_fft(:,1));
abs_ripe_4_fft = abs(ripe_4_fft(:,1));
abs_ripe_5_fft = abs(ripe_5_fft(:,1));
abs_ripe_6_fft = abs(ripe_6_fft(:,1));
abs_ripe_7_fft = abs(ripe_7_fft(:,1));
abs_ripe_8_fft = abs(ripe_8_fft(:,1));
abs_ripe_9_fft = abs(ripe_9_fft(:,1));
abs_ripe_10_fft = abs(ripe_10_fft(:,1));

% unripe /10
abs_unripe_fft = abs_unripe_1_fft + abs_unripe_2_fft+abs_unripe_3_fft;
abs_unripe_fft = abs_unripe_fft+abs_unripe_4_fft+abs_unripe_5_fft+abs_unripe_6_fft;
abs_unripe_fft = abs_unripe_fft +abs_unripe_7_fft+abs_unripe_8_fft+abs_unripe_9_fft+abs_unripe_10_fft;
abs_unripe_fft = abs_unripe_fft/10 ;

% ripe /10
abs_ripe_fft = abs_ripe_1_fft + abs_ripe_2_fft+abs_ripe_3_fft;
abs_ripe_fft =abs_ripe_fft +abs_ripe_4_fft+abs_ripe_5_fft+abs_ripe_6_fft;
abs_ripe_fft =abs_ripe_fft +abs_ripe_7_fft+abs_ripe_8_fft+abs_ripe_9_fft+abs_ripe_10_fft;
abs_ripe_fft = abs_ripe_fft/10;

% unripe
figure
hold on
plot(abs_unripe_1_fft,'b');plot(abs_unripe_2_fft,'b');plot(abs_unripe_3_fft,'b');
plot(abs_unripe_4_fft,'b');plot(abs_unripe_5_fft,'b');plot(abs_unripe_6_fft,'b');
plot(abs_unripe_7_fft,'b');plot(abs_unripe_8_fft,'b');plot(abs_unripe_9_fft,'b');plot(abs_unripe_10_fft,'b');
hold off
xlabel('Frequency'); ylabel('Amplitude');
title('Unripe Watermelon Sound in Frequency Domain')
xlim([0,limit]);
ylim([0 120]);

% unripe average
figure
plot(abs_unripe_fft,'b'); 
xlabel('Frequency'); ylabel('Amplitude');
title('Unripe Watermelon Sound in Frequency Domain - Average')
xlim([0,limit]);
ylim([0 120]);

% ripe
figure
hold on
plot(abs_ripe_1_fft,'b');plot(abs_ripe_2_fft,'b');plot(abs_ripe_3_fft,'b');
plot(abs_ripe_4_fft,'b');plot(abs_ripe_5_fft,'b');plot(abs_ripe_6_fft,'b');
plot(abs_ripe_7_fft,'b');plot(abs_ripe_8_fft,'b');plot(abs_ripe_9_fft,'b');plot(abs_ripe_10_fft,'b');
hold off
xlabel('Frequency'); ylabel('Amplitude');
title('Ripe Watermelon Sound in Frequency Domain')
xlim([0,limit]);
ylim([0 120]);

% ripe average
figure
plot(abs_ripe_fft,'r'); 
xlabel('Frequency'); ylabel('Amplitude');
title('Ripe Watermelon Sound in Frequency Domain - Average')
xlim([0,limit]);
ylim([0 120]);

% comparision
figure
hold on
fourier_transform_unripe = plot(abs_unripe_fft,'b'); 
fourier_transform_ripe = plot(abs_ripe_fft,'r'); 
xlabel('Frequency'); ylabel('Amplitude');
title('Signal frequency Domain');
legend({'unripe','ripe'}); 
xlim([0,limit]);
hold off

% discrete
figure
sampling_fourier_transform = stem(abs_unripe_fft) ; xlabel('Frequency'); ylabel('Amplitude');
title('Unripe-Discrete signal frequency Domain')
xlim([0,limit])
ylim([0 120]);

figure
sampling_fourier_transform = stem(abs_ripe_fft,'r') ; xlabel('Frequency'); ylabel('Amplitude');
title('Ripe-Discrete signal frequency Domain')
xlim([0,limit])
ylim([0 120]);

% sampling plot setup

%plot average unripe 5 
sample_unripe = abs_unripe_fft(1:1:limit);
i = 1 ;
old_i = 0 ;
average_unripe_i = 0 ;
average_sampling_unripe = 0;
old_average_sampling_unripe = 0 ;
next = 10 ; 
figure
hold on
while i <= limit 
    average_unripe_i = average_unripe_i+sample_unripe(i);  
    if mod(i,next) == 0 
        average_sampling_unripe = average_unripe_i/average_sampling_rate;
        plot([old_i i-5], [old_average_sampling_unripe , average_sampling_unripe],'b' )
        old_average_sampling_unripe = average_sampling_unripe ;
        old_i = i-5 ;
        average_unripe_i = 0 ;
        average_sampling_unripe = 0 ;
        i = i-5 ;
        next = next + 5 ;
    end
    i = i+1 ;
end

%plot average ripe 5 
sample_ripe = abs_ripe_fft(1:1:limit);
i = 1 ;
old_i = 0 ;
average_ripe_i = 0 ;
average_sampling_ripe = 0;
old_average_sampling_ripe = 0 ;
next = 10 ; 

while i <= limit 
    average_ripe_i = average_ripe_i+sample_ripe(i);  
    if mod(i,next) == 0 
        average_sampling_ripe = average_ripe_i/average_sampling_rate;
        plot([old_i i-5], [old_average_sampling_ripe , average_sampling_ripe],'r' )
        old_average_sampling_ripe = average_sampling_ripe ;
        old_i = i-5 ;
        average_ripe_i = 0 ;
        average_sampling_ripe = 0 ;
        i = i-5 ;
        next = next + 5 ;
    end
    i = i+1 ;
end

cut_off_frequency = 0 ;
cut_off = abs(sample_unripe-sample_ripe);
largest = cut_off(1);
for i = 1:length(cut_off)
    if cut_off(i) > largest;
        largest = cut_off(i);
        cut_off_frequency = i ;
    end
end

yl = get(gca, 'YLim');
line( [cut_off_frequency cut_off_frequency], yl )
xlabel('Frequency'); ylabel('Amplitude');
title('Average sampling');
hold off

disp('cut_off_frequency')
disp(cut_off_frequency)

