ADAPTIVE WINDOW CROSS-CORRELATION TECHNIQUE

This folder contains Matlab source code for processing dual-tip phase-detection signals in high-velocity air-water flows. 
The code was developed by Matthias Kramer (matthias_kramer@hotmail.com) and Daniel Valero (valero@fh-aachen.de).

- Novel technique for processing phase-detection probe signals in air-water flows.
- Segmentation of the signal based on a small number of encompassed bubbles/droplets.
- Estimation of pseudo-instantaneous interfacial velocities and turbulence intensities.
- Velocity spectra can subsequently be computed based on velocity time series.


If using this code, please cite

%------------------------------------------------------------------------------------------------------------------------%

M. Kramer, D. Valero, H. Chanson and D. Bung (2019)

Towards reliable turbulence estimations with phase-detection probes:

an adaptive window cross-correlation technique

Experiments in Fluids, 2019, 60:2

%------------------------------------------------------------------------------------------------------------------------%


The code was developed in Matlab R2017a. The folder contains the following files:
- RunAWCCT.m: main code to run the Adaptive Window Cross-Correlation Technique.
- windows.m: segmentation of the signal into short time windows.
- velocity.m: computation of pseudo-instantaneous velocities.
- thres.m: single threshold technique.
- ROC.m: robust outlier cutoff.
- GN2002.m: filtering after Goring and Nikora (2002).
- chord.m: evaluation of chord times.
- tightsubplot: customize subplots (from Matlab FileExchange).
- legendflex: customize legends (from Matlab FileExchange).
- setpos: part of the legendflex package.
- getpos: part of the legendflex package. 
- *.dat: phase-detection probe data, measured at the eight step edge of a large-sized stepped spillway, see Kramer et al. (2019).


Important processing paramters include:
- Np (line 29): number of encompassed particles of the dispersed phase. For example, a window with 
Np = 2 particles contains two water chords and two air chords, compare Fig. 1 in Kramer et al. (2019).
- Rxymaxthres (line 30): threshold of the cross-correlation coefficient.
- SPRthres (line 31): threshold of the secondary peak ratio, as defined in Kramer et al. (2019).
 
