# LLE-Solvers
This is a small Library of Liquid Liquid Extraction Solvers. The solvers are located in the 
folders. Everything was written in MATLAB.
See Geankoplis *Transport Processes and Separation Processes* chapter 11 for sample problems.

# How it Works
The solver identifies were the mixing point is, then it uses some of the steps outlined in 
*Geankoplis* to come to a solution.

# Example
Using the Single Stage Split solver a user enters the following into the MATLAB command window:
[T, points, raff, extract, percentRec] = solveLLE(0.3,0.32,500) (the last argument is the total 
mass)
solveLLE will then return a table **T**,**points** which is the concentration in the raffinate 
or extract, **raff** and **extract** will return the mass in extract,**percentRec** will return 
the % Recovery.


# Plotting

*plotEquilibrium* will plot your data and tielines and produce a pdf of the plot. It is a script 
that has many options in it (uncomment the lines to use them). Knowledge of Right Triangle 
diagrams are **essential** to using this script.

