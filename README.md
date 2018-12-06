Adaptive window cross-correlation technique (AWCCT)
===================================================

This folder contains Matlab source code files for processing phase-detection probe signals in high-velocity air-water flows. 
The code was developed by Matthias Kramer (UNSW Canberra, [ORCID](https://orcid.org/0000-0001-5673-2751)) and Daniel Valero (IHE Delft, [ORCID](http://orcid.org/0000-0002-7127-7547)). It includes the following features:

- Novel technique for processing dual-tip phase-detection probe signals in air-water flows.
- Segmentation of the signal based on a small number of encompassed bubbles/droplets.
- Estimation of pseudo-instantaneous interfacial velocities and turbulence intensities.
- Filtering criteria ensure reliability of estimated velocities.


If using the AWCCT for publishing research, please cite the following reference to credit the authors and to direct your readers to the original  research work:

M. Kramer, D. Valero, H. Chanson and D. Bung (2019). Towards reliable turbulence estimations with phase-detection probes: an adaptive window cross-correlation technique, Experiments in Fluids, 60:2 ([DOI](https://doi.org/10.1007/s00348-018-2650-9))

1 Contents
----------

The code was written in Matlab R2017a. The folder contains the listed files:
- RunAWCCT.m: main code to run the AWCCT.
- windows.m: segmentation of the signal into short time windows.
- velocity.m: computation of pseudo-instantaneous velocities.
- thres.m: single threshold technique.
- ROC.m: robust outlier cutoff.
- GN2002.m: filtering after Goring and Nikora (2002, [DOI](https://doi.org/10.1061/(ASCE)0733-9429(2002)128:1(117))).
- chord.m: evaluation of chord times.
- tightsubplot: customize subplots (from Matlab FileExchange).
- legendflex: customize legends (from Matlab FileExchange).
- setpos: part of the legendflex package.
- getpos: part of the legendflex package. 
- *.dat: phase-detection probe data, measured at the eighth step edge of a large-sized stepped spillway, see Kramer et al. (2019).


2 Processing parameters
------------------------

Important processing paramters include:
- Np (line 29): number of encompassed particles of the dispersed phase. For example, a window with 
Np = 2 particles contains two water chords and two air chords, compare Fig. 1 in Kramer et al. (2019).
- Rxymaxthres (line 30): threshold of the maximum cross-correlation coefficient. A value between 0.5 to 0.7 is recommended, as indicated in Matos et al. (2002, [DOI](https://doi.org/10.1061/40655(2002)58)) and Andre et al. (2003, [DOI](https://doi.org/10.1061/(ASCE)0733-9429(2005)131:5(423)).
- SPRthres (line 31): threshold of the secondary peak ratio, as defined in Kramer et al. (2019). A value of 0.6 is recommended, similar to Keane and Adrian (1990, [DOI](https://doi.org/10.1088/0957-0233/1/11/013)) and Hain and Kähler (2007, [DOI](https://doi.org/10.1007/s00348-007-0266-6)).

