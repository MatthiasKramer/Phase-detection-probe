function [modeair,modewater,threshold,C,Signalout] = thres(Signal,nbins)
% Single thresholding for void fraction estimation.

[N,centers]  = hist(Signal,nbins);
thres = (min(centers)+max(centers))/2;
Nair = mean(max(N(centers<thres)));
Nwater = mean(max(N(centers>thres)));
modeair = mean(centers(N==max(N(centers<thres))));
modewater = mean(centers(N==max(N(centers>thres))));
threshold = (modeair + modewater)/2;    

%binarization of the signal (Signalout = binarized signal)
Signalout(Signal > threshold) = 1; % Water
Signalout(Signal < threshold) = 0; % Air
 
%add one value for analyzing air/water chord
if Signalout(size(Signalout,2)) == 1
    Signalout(size(Signalout,2)+1) = 0;
else    
    Signalout(size(Signalout,2)+1) = 1;    
end

C=sum(Signal<threshold)/length(Signal); 

end
