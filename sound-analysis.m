% Sound analysis 26-12-2019 
% Coding by Patorn - J
% Considering different Amplitude in Frequency domain each Frequency's period
% between Unripe sound and Ripe sound

clc;
clear ;

Fs = 1000 ;
abs_average_unripe = 0;
abs_average_ripe = 0 ;
xlimit = 120 ; ylimit = 140 ;
unripe_number = 0 ; ripe_number = 0;
average_sampling_rate = 10 ; step = 5 ;

wavFiles = dir(fullfile('C:\Users\User', '*.wav'));

f1 = figure; 
f2 = figure;
for k=1:length(wavFiles)
        wavFile = wavFiles(k).name;
        [sound,fs] = audioread(wavFile);
        if strfind(wavFile,'1point') == 1
            unripe_number = unripe_number +1 ; 
            unripe = fft(sound,Fs);
            abs_unripe = abs(unripe(:,1));
                figure(f1)
                hold on
                plot(abs_unripe,'b')
                xlabel('Frequency'); ylabel('Amplitude');title('Unripe Sound Frequency Domain');
                xlim([0,xlimit]);ylim([0 ylimit]);
            abs_average_unripe = abs_average_unripe + abs_unripe ;
        else
            ripe_number = ripe_number +1 ; 
            ripe = fft(sound,Fs);
            abs_ripe = abs(ripe(:,1));
                figure(f2)
                hold on
                plot(abs_ripe,'r')
                xlabel('Frequency'); ylabel('Amplitude');title('Ripe SoundFrequency Domain');
                xlim([0,xlimit]);ylim([0 ylimit]);
            abs_average_ripe = abs_average_ripe + abs_ripe ;
        end

end
 hold off 
 
 abs_average_unripe = abs_average_unripe / unripe_number ;
 abs_average_unripe = abs(abs_average_unripe(:,1));       
 figure 
    plot(abs_average_unripe,'b')
    xlabel('Frequency'); ylabel('Amplitude');title('Average Unripe Sound Frequency Domain');
    xlim([0,xlimit]);ylim([0 ylimit]);
    
 
 abs_average_ripe = abs_average_ripe / ripe_number ;
 abs_average_ripe = abs(abs_average_ripe(:,1));       
 figure 
    plot(abs_average_ripe,'r')
    xlabel('Frequency'); ylabel('Amplitude');title('Average Ripe Sound Frequency Domain');
    xlim([0,xlimit]);ylim([0 ylimit]);
    
figure
hold on
    plot(abs_average_unripe,'b'); 
    plot(abs_average_ripe,'r'); 
    xlabel('Frequency'); ylabel('Amplitude');
    title('Unripe VS Ripe'); legend({'Unripe','Ripe'}); 
    xlim([0,xlimit]); ylim([0,ylimit]);
hold off

figure
    stem(abs_average_unripe) ;
    xlabel('Frequency'); ylabel('Amplitude');
    title('Unripe Discrete Frequency Domain')
    xlim([0,xlimit]) ; ylim([0 ylimit]);

figure
    stem(abs_average_ripe,'color','r') ;
    xlabel('Frequency'); ylabel('Amplitude');
    title('Ripe Discrete Frequency Domain')
    xlim([0,xlimit]) ; ylim([0 ylimit]);


sample_unripe = abs_average_unripe(1:1:length(abs_average_unripe));

i = 1 ;
old_i = 0 ;
average_unripe_i = 0 ;
average_sampling_unripe = 0;
old_average_sampling_unripe = 0 ;
next = average_sampling_rate ; 

figure
    hold on
    while i <= length(abs_average_unripe) 
        average_unripe_i = average_unripe_i+sample_unripe(i);  
        if mod(i,next) == 0 
            average_sampling_unripe = average_unripe_i/average_sampling_rate;
            plot([old_i i-step], [old_average_sampling_unripe , average_sampling_unripe],'b' )
            old_average_sampling_unripe = average_sampling_unripe ;
            old_i = i-step ;
            average_unripe_i = 0 ;
            average_sampling_unripe = 0 ;
            i = i-step ;
            next = next + step ;
        end
    end
    
sample_ripe = abs_average_ripe(1:1:length(abs_average_ripe));

i = 1 ;
old_i = 0 ;
average_ripe_i = 0 ;
average_sampling_ripe = 0;
old_average_sampling_ripe = 0 ;
next = average_sampling_rate ; 

while i <= length(abs_average_ripe) 
    average_ripe_i = average_ripe_i+sample_ripe(i);  
    if mod(i,next) == 0 
        average_sampling_ripe = average_ripe_i/average_sampling_rate;
        plot([old_i i-step], [old_average_sampling_ripe , average_sampling_ripe],'r' )
        old_average_sampling_ripe = average_sampling_ripe ;
        old_i = i-step ;
        average_ripe_i = 0 ;
        average_sampling_ripe = 0 ;
        i = i-step ;
        next = next + step ;
    end
    i = i+1 ;
end

    hold off
    xlabel('Frequency'); ylabel('Amplitude');
    title('Unripe Average Frequency Domain')
    xlim([0,xlimit]) ; ylim([0 ylimit]);
    
    




