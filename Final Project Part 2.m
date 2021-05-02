sfreq = input('please enter sampling frequency of signal\n');
StartOfTime = input('enter start of time scale\n');
EndOfTime = input('enter end of time scale\n');
NofBreakPoints = input('enter number of break points\n');
a = [];
x = NofBreakPoints;
i=0;
for i= 0:x-1
    m = input('enter the position , smallest first please\n');
    a = [a m];
end
time = [StartOfTime,a,EndOfTime];
ttot = linspace(StartOfTime,EndOfTime,sfreq*(EndOfTime-StartOfTime));
totSignal=[];
for n = 1:length(time)-1
    limits = time(n+1)-time(n);
    fprintf('region from %d to %d\n',time(n),time(n+1));
    fprintf(' 1- Dc signal\n 2- Ramp signal\n 3- General order polynomial\n 4- exponential signal\n 5- Sinusoidal signal\n');
    signal = input('enter the code for the signal you want to draw\n');
    t =linspace(time(n),time(n+1),limits*sfreq);
    
    if signal == 1;
        AmplitudeDC = input('enter the amplitude\n');
        DC = AmplitudeDC * ones(1, int16(limits*sfreq));
        totSignal = [totSignal,DC];
    end 
    
    if signal == 2;
        SlopeRamp = input('enter the slope\n');
        InterceptRamp = input('enter the Intercept\n');
        Ramp = SlopeRamp * t + InterceptRamp;
        totSignal = [totSignal,Ramp];
    end
    
      if signal == 3;
      powerArray = [];
      ApolyArray = [];
      polySignal = 0;
      power = input('enter the greatest power\n');
      powerArray(1) = power;
      for v=1:power-1
          powerArray = [powerArray,power-v];
      end
      for z=1:length(powerArray)
      Apoly2 = input(sprintf('enter the amplitude for %d th power\n',powerArray(z)));
      ApolyArray = [ApolyArray,Apoly2];    
      polySignal = polySignal+ ApolyArray(z)*(t.^powerArray(z));
      end
      Intercept = input('enter the intercept\n');
      polySignal = polySignal+Intercept;
      totSignal = [totSignal,polySignal]; 
      end
      
    if signal == 4;
        AmplitudeExp = input('enter the amplitude\n');
        Exponent = input('enter the exponent\n');
        ExpSignal = AmplitudeExp * exp(Exponent * t);
        totSignal = [totSignal,ExpSignal];
    end
    
    if signal == 5;
        AmplitudeSin = input('enter the amplitude\n');
        Freq = input('enter frequency\n');
        phase = input('enter phase\n');
        cond=input('1-sin\n2-cos\n');
        if cond == 1;
        SinSignal = AmplitudeSin * sin(2*pi*Freq*t+phase);
        totSignal = [totSignal,SinSignal];
        end
        if cond == 2;
        CosSignal = AmplitudeSin * cos(2*pi*Freq*t+phase);
        totSignal = [totSignal,CosSignal];
        end
        
    end
end
figure; plot(ttot,totSignal)
editProgram = 1;
modif = input('1)modification with changing the original signal\n2)modification without changing the original signal\n0)Quit program\n');
if modif ==2
    while editProgram > 0
             editProgram = input('press any number greater than 0 to edit on the signal , 0 to end the program\n');
      if editProgram >0    
             fprintf('1-Amplitude scale\n2-Time reversal\n3-Time shift\n4-Expanding the signal\n5-Compressing the signal\n6-None\n');
             edit = input('enter the code for modification you want to do\n');
         if edit == 1
             amp = input('enter the scale value\n');
            totSignal2 = totSignal*amp;
            figure; plot(ttot,totSignal2)
         elseif edit == 2
             t2 = -ttot;
           figure;  plot(t2,totSignal)
         elseif edit == 3
             shift = input('enter the value you want to shift\n');
             t3 = ttot-shift;
            figure; plot(t3,totSignal);
         elseif edit == 4
             expand = input('enter the expand value\n');
            t4 = ttot*expand;
           figure;  plot(t4,totSignal);
         elseif edit == 5
             compress = input('enter the compressing value\n');
             t5 = ttot/compress;
           figure;  plot(t5,totSignal);
         elseif edit == 6
             figure; plot(ttot,totSignal)
         else
             fprintf('enter valid code\n');
         end
       end
    end
end
if modif ==1
    while editProgram > 0
             editProgram = input('press any number greater than 0 to edit on the signal , 0 to end the program\n');
      if editProgram >0    
             fprintf('1-Amplitude scale\n2-Time reversal\n3-Time shift\n4-Expanding the signal\n5-Compressing the signal\n6-None\n');
             edit = input('enter the code for modification you want to do\n');
         if edit == 1
             amp = input('enter the scale value\n');
            totSignal = totSignal*amp;
            figure; plot(ttot,totSignal)
         elseif edit == 2
             ttot = -ttot;
           figure;  plot(ttot,totSignal)
         elseif edit == 3
             shift = input('enter the value you want to shift\n');
             ttot = ttot-shift;
            figure; plot(ttot,totSignal);
         elseif edit == 4
             expand = input('enter the expand value\n');
            ttot = ttot*expand;
           figure;  plot(ttot,totSignal);
         elseif edit == 5
             compress = input('enter the compressing value\n');
             ttot = ttot/compress;
           figure;  plot(ttot,totSignal);
         elseif edit == 6
             figure; plot(ttot,totSignal)
         else
             fprintf('enter valid code\n');
         end
       end
    end
end