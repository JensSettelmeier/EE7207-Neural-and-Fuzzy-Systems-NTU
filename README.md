# EE7207 Neural and Fuzzy Systems NTU Assignment 1

The PDF file "Live_script_Assignment_1_Jens_Settelmeier" shows a PDF version of the submitted Matlab Live Script for the Assignment which is described in the file "Assignment.pdf".

In this assignment we solve a two class classification problem with a RBF Neural Network. The training of its weights is done by a linear regression approach in "weights_regression.m". The necessary center vectors for the RBFNN are estimated by a Self Organizing Map (SOM) Network which is implemented in "som.m". Alternatively one could use a K-means approach for example to find similar center vectors. Since the RBF NN is given by the center vectors, the Train Data with its Labels and the trainable weights, we can re-write the Networkoutput Function in Matrix-Vector form as seen in the lecture and only need to compute the specifying Matrix Phi. This is done in the "big_Phi.m" file.  

# Usage

Clone/download the repo to your computer. Execute "Assignment1_script.m" or "Live_script_Assignment_1_Jens_Settelmeier.mlx" to get the answers for the task in "Assignment.pdf". 



