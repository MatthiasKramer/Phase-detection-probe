Phase-detection signal processing toolbox
=========================================

This toolbox contains the **adaptive window cross-correlation (AWCC)** technique for processing dual-tip phase-detection probe signals in high-velocity air-water flows, developed by Matthias Kramer (UNSW Canberra) and Daniel Valero (IHE Delft), with contributions from Benjamin Hohermuth (ETH Zurich) and Stefan Felder (UNSW Sydney). The code is subject to further expansion and currently includes the following features (version 1.2):

- Single-threshold filter to detect air- and water-phases.
- Segmentation of the signal based on a small number of encompassed bubbles/droplets.
- Estimation of pseudo-instantaneous interfacial velocities and turbulence intensities.
- Reliable velocity estimates through implementation of filtering criteria.
- Velocity bias correction using window duration weighting.

The uploaded source code allows computation of basic two-phase flow parameters, including void fraction (*C*), particle count rate (*F*), chord times (*t<sub>ch</sub>*), pseudo-instantaneous interfacial velocities (*u*) and turbulence intensities (*Tu*). When using the AWCC technique, please consider citing the following references to credit the authors and to direct readers to the original research works:

- M. Kramer and D. Valero (2019). Phase-detection signal processing toolbox v1.2  [![DOI](https://zenodo.org/badge/160460025.svg)](https://zenodo.org/badge/latestdoi/160460025)

- M. Kramer, B. Hohermuth, D. Valero and S. Felder (2020). Best practices for velocity estimations in highly aerated flows with dual-tip phase-detection probes, International Journal of Multiphase Flow, ([DOI](https://doi.org/10.1016/j.ijmultiphaseflow.2020.103228))

- M. Kramer, D. Valero, H. Chanson and D. Bung (2019). Towards reliable turbulence estimations with phase-detection probes: an adaptive window cross-correlation technique, Experiments in Fluids, 60:2 ([DOI](https://doi.org/10.1007/s00348-018-2650-9))

1 Contents
----------
The phase-detection signal processing toolbox is written in Matlab R2017a. This repository contains source code files and a representative spillway data set, the latter recorded at the University of Queensland (UQ):
- Batch.m: main code to perform batch-mode processing.
- awcc.m: awcc technique.
- chord.m: evaluation of chord times.
- roc.m: robust outlier cutoff. Simplification of Goring and Nikora (2002, [DOI](https://doi.org/10.1061/(ASCE)0733-9429(2002)128:1(117))), as modified by Wahl (2003, [DOI](https://doi.org/10.1061/(ASCE)0733-9429(2003)129:6(484))). ROC only uses instantaneous velocity data (instead of gradients). Note that velocity series are sparse in time, thus gradients correspond to different values of dt (and could be biased). Further description can be found in Valero (2018, [handle](https://orbi.uliege.be/handle/2268/229191)) or Valero et al. (2020) [DOI](https://doi.org/10.1016/j.flowmeasinst.2020.101809).
- thres.m: single threshold technique for the binarisation of the raw signals, and void fraction calculation. This is based on the mid value between the air and water modes. In conductivity probes, voltage values below threshold indicate air, and water the other way around.
- velocity.m: computation of pseudo-instantaneous velocities. 
- windows.m: segmentation of the signal into windows.
- spillway-data: phase-detection probe data, measured at the eighth step edge of a large-sized stepped spillway, see Kramer et al. (2019).


2 Processing parameters and best practices
------------------------
Best practices for the application of the AWCC are
- A combined cross-correlation based filtering filtering approach **R<sub>12,max</sub>**/(**SPR<sub>i</sub><sup>2</sup>** + 1) > **A** is proposed, where the parameter **A** was chosen as **A** = 0.4. Herein, **R<sub>12,i,max</sub>** is the maximum cross-correlation coefficient and **SPR** is the secondary peak ratio, as defined in Kramer et al. (2019).

- Select the number of particles **N<sub>P</sub>** within a recommended range between 5 < **N<sub>P</sub>** < 15. The aim is to keep  **N<sub>P</sub>** small while avoiding non-physical velocity information. A sensitivity analysis should lead to converging mean velocities.

- A suffcient number of valid pseudo-instantaneous velocity data must be recorded to reduce the uncertainty in the estimation of mean and turbulent properties. A low datayield directly implies the need for longer sampling durations. In such cases, it is recommended to increase the sampling duration until the moments of the velocity samples converge.

3 How to run the code?
----------------------
Copy the source code and the *.dat files into the same folder and run "RUNawcc.m". Please, update your sampling properties.

The instantaneous velocities are accessible through the Matlab workspace.

Please note that the read.m function considers that *.dat files: i) are binarised and ii) include the probe position. If your input files are different, this function should be modified. For unsteady measurements, you may consider commenting out the roc method call (filtering for steady flows).

4 Comment on measurement accuracy
----------------------------------
Phase-detection probe measurements may overestimate time-averaged velocities and underestimate turbulence intensities, as shown in     Corre and Ishii (2002, [DOI](https://doi.org/10.1016/S0029-5493(02)00130-9)) and Kramer et al. (2019). Possible reasons include:
- Probe tips are not aligned with flow streamlines.
- A greater number of bubbles/droplets impact the tips during periods of high velocities. This issue is considered in the code modification after Kramer et al. (2021) [DOI](https://doi.org/10.1016/j.ijmultiphaseflow.2020.103228)

This topic is currently being investigated. It is anticipated that the measurement accuracy of a dual-tip probe decreases in two- or three-dimensional flow situations and in regions with high velocity fluctuations. A thorough discussion on probes and analysis agorithms limitations in highly aerated flows can be found in Chanson (2020) [DOI](https://doi.org/10.1016/j.ijmultiphaseflow.2020.103330), and Kramer et al. (2021) [DOI](https://doi.org/10.1016/j.ijmultiphaseflow.2020.103475).

5 Releases
----------
- AWCC v1.0
- AWCC v1.1: implementation of a combined cross-correlation based filtering criteria and inclusion of batch-mode processing.
- AWCC v1.2: velocity bias correction

6 Contact
----------
For **feedback**, **questions** and **recommendations**, please use the issue-section or contact the authors via Email:

- Matthias Kramer, UNSW Canberra, School of Engineering and Information Technology (SEIT). Email: m.kramer@adfa.edu.au, [ORCID](https://orcid.org/0000-0001-5673-2751)
- Daniel Valero, IHE Delft Institute for Water Education, Water Science and Engineering Department. Email: d.valero@un-ihe.org, [ORCID](http://orcid.org/0000-0002-7127-7547)

7 Selected References
---------------------
- Neal, L. G. and Bankoff, S. G. (1963). A high resolution resistivity probe for determination of local void properties in gas–liquid flow. American Institue of Chemical Engineers Journal 9(4), pages 490–494.
- Herringe, R. A. and Davis, M. R. (1976). Structural development of gas–liquid mixture flows. Journal of Fluid Mechanics 73, pages 97–123.
- Cartellier, A. and Achard, J. (1991). Local phase detection probes in fluid/fluid two-phase flows. Review of Scientific Instruments 62(2), pages 279–303.
- Chanson, H. and Toombes, L. (2002). Air-water flows down stepped chutes: turbulence and flow structure observations. International Journal of Multiphase Flow 28(11), pages 1737–1761.
- Felder, S. and Chanson, H. (2015). Phase-detection probe measurements in high-velocity free-surface flows including a discussion of key
sampling parameters. Experimental and Thermal Fluid Science 61, pages 66–79.
- Kramer, M., Valero, D., Chanson, H. and Bung, D. B. (2019). Towards reliable turbulence estimations with phase-detection probes: an adaptive window cross-correlation technique, Experiments in Fluids, 60.
- Kramer, M., Hohermuth, B., Valero, D. and Felder, D. (2021). Best practices for velocity estimations in highly aerated flows with dual-tip phase-detection probes. International Journal of Multiphase Flow, 126, 103228.
- Chanson, H. (2020). On velocity estimations in highly aerated flows with dual-tip phase-detection probes - A commentary. International Journal of Multiphase Flow, 126, 103330.
- Kramer, M., Hohermuth, B., Valero, D. and Felder, D. (2021). On velocity estimations in highly aerated flows with dual-tip phase-detection probes - closure. International Journal of Multiphase Flow, 134, 103475.

