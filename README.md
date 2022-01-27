# Parametric Study and Prediction Models of the Seismic Response of Single-Degree-of-Freedom Structural Systems Equipped with Maxwell Material Fluid Viscous Dampers. 

Parametric Study and Prediction Models of the Seismic Response of
Single-Degree-of-Freedom Structural Systems Equipped with Maxwell Material Fluid Viscous Dampers.
Bryan Chalarca, Andre Filiatrault, Daniele Perrone.
University School for Advanced Studies IUSS Pavia, Italy.
January 2022.

Gaussian Process Regression models to predict the peak absolute
acceleration (MPAA), peak mass absolute spectral acceleration (MPMASA),
peak relative velocity (MPRV), and the peak relative displacement (MPRD),
as a factor of such value in an equivalent SDoF model without dampers.

To use the prediction models in MATLAB, listed:
N_MPAA_model.mat, N_MPMASA_model.mat, N_MPRD_model.mat, N_MPRV_model.mat,
open the MATLAB script "Prediction_models.m"
The input data to generate the prediction can be save in a txt file o be defined as
a matrix in MATLAB. The order of the variables is important. Each row represent a data point
and each column a input variable: Period (s), Maxwell Stiffness as a fraction of the model
stiffness (Kd/Kmod), Supplemental damping ratio as % (e.g. 10), Seismic intensity as the ground spectral
acceleration at 1 s in g (e.g. 0.6), and velocity exponent of FVD. [T Kd/Kmod Damp Sa Alpha];

The *.rar files contain the GPR models including the original data point used to calibrate the models
as well as all the parameters obtained from the optimization process carried out by the Regression Learner app
in MATLAB 2020b. Further information about the model calibration can be found at:
https://www.mathworks.com/help/stats/train-regression-models-in-regression-learner-app.html

The test SDOF models use in the manuscript are used here as an example. Check the "Input.txt" file.

Please feel free to contact the corresponding author to get further information.

More information about the seismic performance of nonstructural elements at:
https://sites.google.com/iusspavia.it/nonstructural/
