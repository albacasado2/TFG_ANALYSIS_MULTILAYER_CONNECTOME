# TFG_MULTILAYER CONNECTOME
 Exploring the Multi-Layer Connectome of C. Elegans: Integrating monoamine and neuropeptide layers into community detection and functional analysis
 
 The connectome that is going to be used in this thesis is based on the full hermaphrodite C. elegans connectome, containing 300 neurons, from which 280 are nonpharyngeal (CANL/R are excluded
as they have no clear synapses) and 20 pharyngeal.

The synaptic and gap nonpharyngeal network connections are obtained from WormAtlas (https://www.wormatlas.org/neuronalwiring.html) based on the analysis made by Varshney et al., while the pharyngeal information is described by Cook et al. and the data obtained
from hermaphrodite chemical and gap in symmetric from WormWiring https://wormwiring.org/pages/adjacency.html.

However, it is currently known that the extrasynaptic transmissions via monoamines and neuropeptides are also important networks in this global connectivity, a draft connectome of extrasynaptic monoamines connections, as well as a partial network of neuropeptide signaling, based on new and published gene expression data.

Then, the C. elegans wiring diagram can be mapped as a multiplex network with synaptic, gap, monoamine, and neuropeptide different layers that will be analyzed to observe the overlapping and connections between them, covering a total of 2711 chemical synapses, 1097 gap, 2625 monoamine, and 8930 neuropeptide interactions.

Using these data, an adjacency matrix was used to represent all the connectome and guarantee that the way of reading that information was equal to the one developed by Bentley et al.
The code to plot this adjacent matrix is in PRUEBA_MATRIZ_TODA_LA_RED.m plots the matrix, it was considered that the vertical direction corresponds with the input neurons that control the horizontal direction neurons, the output-controlled ones. The order of the neurons was obtained from the same page used to obtain the pharyngeal synaptic and gap connections, aforementioned.

To identify communities of neurons in all of the network layers, Louvain and Girvan-Newman algorithms were used. In both cases, the communities library from Python was used by entering an adjacency matrix that represents an undirect graph that could be weighted or unweighted.
The output of each algorithm is a list of communities, where each community represents an aggregation of certain neurons, depending on the requirements of each algorithm as it has been explained previously in models and methods. In order to plot the results obtained depending on the position of the neurons,the Matlab functions created were plotear_por_ganglio.m and plotear_por_funcion.m.

In order to represent the neurons separated by modules, ganglia, and functions the same functions as in the previous plots were used: plotear_por_ganglio.m and plotear_por_funcion.m, and a posterior normalization of the values by dividing by the total for each concrete module to obtain the final figures.
(For each of the outputs obtained from Python, the following codes were used: louvain_modulos_synap.m, louvain_modulos_gap_.m, louvain_modulos_tot.m, louvain_modulos_np_.m, girvan_modulos_synap.m, girvan_modulos_gap_.m, girvan_modulos_total_.m)

From that community data, the following measurements were obtained to identify the participation of neurons in their community or with respect to other communities (the code is in network_measurements.m Matlab file)

To obtain the modularity values, we have used the modularity.m Matlab function by Perrone et al.
To acquire the path length and the network efficiency, calculatePathLength.m has been created to find the minimum distance between neurons. The network efficiency is the inverse of the path length results.
To calculate the reciprocity, the sum of the multiplication between the adjacent matrix and its transpose was performed.
To compute the inter and intra-connectivity it was necessary to sum the connections through all the modules.

In the case of the rich club and PCA analyses, we considered the initial data without any modification by the community detection algorithms. To obtain the rich club coefficients, it was necessary to use the randmio_dir function from the Brain Connectivity Toolbox to normalize the values. The code to obtain the rich club plots is in rich_club_coefficient.m.

Finally, to perform the Principal Component Analysis (PCA), Matlab function pca.m was needed to obtain the principal components and the variance of each of them. In the Matlab file PCA.m all the code appears.



