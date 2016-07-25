# scatterplots_for_aracne_networks

To use the script you need two files:
1.-A sif-like file of three columns that contains node-node names ("from" and "to" colnames) and a weight.
2.-For each condition (in this case healthy vs tumor tissue) an expression matrix where columns are the genes and rows are samples

The output is a series of scatterplots showing paired expression levels for each condition included.

The gen_vs_gen generates a scatterplot for each pair of nodes connected on the list like this:
   ![scatterplot gen-gen]( scatterplots_for_aracne_networks/gen-gen )

The top_sanos_vs_todos_subtipos generates a similar plot but with all treatments included like this:

   ![scatterplot gen-gen]( scatterplots_for_aracne_networks/sanosvstodos)
   
