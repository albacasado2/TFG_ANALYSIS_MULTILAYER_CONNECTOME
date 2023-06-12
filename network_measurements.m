%% NETWORK MEASUREMENTS
%% Modularity

community_agrupations=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\girvan_modulos_total\community_agrupations.txt",'Delimiter',',','NumHeaderLines',0));
community_agrupations=cell2mat(community_agrupations);

for i=1:300
    agrupations(i)=community_agrupations(i)+1;
end
Q(1)=modularity(red_neuronal_synap,agrupations);
Q(2)=modularity(red_neuronal_gap,agrupations);
Q(3)=modularity(red_neuronal_monoaminas,agrupations);
Q(4)=modularity(red_neuronal_neuropeptidos,agrupations);
Q(5)=modularity(TOTAL,agrupations);



%% Path length
% % characteristic path length
% adj_matrix_=sparse(red_neuronal_synap);
% D = graphallshortestpaths(adj_matrix_,'directed',true);
% n=300;
% D(D==Inf)=0;
% L(1) = sum(D(:))/(n*(n-1));
% E(1)=1/L(1);
% adj_matrix_=sparse(red_neuronal_gap);
% D = graphallshortestpaths(adj_matrix_,'directed',true);
% n=300;
% D(D==Inf)=0;
% L(2) = sum(D(:))/(n*(n-1));
% E(2)=1/L(2);
% adj_matrix_=sparse(red_neuronal_monoaminas);
% D = graphallshortestpaths(adj_matrix_,'directed',true);
% n=300;
% D(D==Inf)=0;
% L(3) = sum(D(:))/(n*(n-1));
% E(3)=1/L(3);
% adj_matrix_=sparse(red_neuronal_neuropeptidos);
% D = graphallshortestpaths(adj_matrix_,'directed',true);
% n=300;
% D(D==Inf)=0;
% L(4) = sum(D(:))/(n*(n-1));
% E(4)=1/L(4);
% adj_matrix_=sparse(TOTAL);
% D = graphallshortestpaths(adj_matrix_,'directed',true);
% n=300;
% D(D==Inf)=0;
% L(5) = sum(D(:))/(n*(n-1));
% E(5)=1/L(5);
% characteristic path length
D = calculatePathLengths(red_neuronal_synap);
n=300;
D(D==Inf)=0;
L(1) = sum(D(:))/(n*(n-1));
E(1)=1/L(1);
D = calculatePathLengths(red_neuronal_gap);
n=300;
D(D==Inf)=0;
L(2) = sum(D(:))/(n*(n-1));
E(2)=1/L(2);
D = calculatePathLengths(red_neuronal_monoaminas);
n=300;
D(D==Inf)=0;
L(3) = sum(D(:))/(n*(n-1));
E(3)=1/L(3);
D = calculatePathLengths(red_neuronal_neuropeptidos);
n=300;
D(D==Inf)=0;
L(4) = sum(D(:))/(n*(n-1));
E(4)=1/L(4);
D = calculatePathLengths(TOTAL);
n=300;
D(D==Inf)=0;
L(5) = sum(D(:))/(n*(n-1));
E(5)=1/L(5);

%% RECIPROCITY
C=TOTAL;

% Calculate transpose of connectivity matrix
C_transpose = C';

% Calculate element-wise product of C and C_transpose
C_product = C.*C_transpose;

% Calculate sum of elements in C_product
sum_C_product = sum(sum(C_product));

% Calculate sum of elements in C
sum_C = sum(sum(C));

% Calculate reciprocity
reciprocity(5) = sum_C_product / sum_C;


%% Inter and intra connectivity
% PRIMERO RUNEAMOS EL CODIGO DE LOUVAIN_MODULOS_SYNAP PARA TENER LA MATRIZ
% DE ADYACENCIA ORDENADA EN COMUNIDADES
% intra connectivity: calculate how connected are nodes inside of the
% module
%inter connectovity: how connected are nodes of a module with the outside
%nodes of the rest of the modules
%Interconnectivity


louvaina_modules_synap=table2cell(readtable("louvaina_modulos_gap.txt",'Delimiter',',','NumHeaderLines',0));
t=cell2mat(louvaina_modules_synap);

lista_source_louvaina_positions=transpose(t);

info_wormatlas=readtable('PRUEBA-WORMATLAS.csv');
lista_source=table2cell(info_wormatlas(:,1));

lista_source_louvaina=[];

for i=1:length(lista_source_louvaina_positions)
    pos=lista_source_louvaina_positions(i);
    lista_source_louvaina=[lista_source_louvaina; lista_source(pos+1)];
end


for i=1:12
    filename = strcat('D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_gap\louvaina_modulos_gap_',num2str(i),'.txt'); % name of the dicom files
    module=table2cell(readtable(filename,'Delimiter',',','NumHeaderLines',0));
    module=cell2mat(module);
    nodes=length(module);
    lista_module=transpose(module);
    name=lista_source(lista_module(1)+1);
    pos=find(strcmp(lista_source_louvaina,name));
    pos1_(i)=pos;
    pos2_(i)=pos1_(i)+nodes;
end
TOTAL_=TOTAL>0;
for i=1:length(pos1_)
    pos1=pos1_(i);
    if i==length(pos1_)
            pos4=300;
    else
            pos4=pos2_(i);
    end
    for j=1:length(pos1_)
        pos3=pos1_(j);
        if j==length(pos1_)
            pos2=300;
        else
            pos2=pos2_(j);
        end
        interconnectivity(i,j)=sum(sum(TOTAL_(pos1:pos4,pos3:pos2)))/((pos4-pos1)*(pos2-pos3));
    end
end

figure;
imagesc(interconnectivity);
colorbar;
ylabels={'1','2','3','4','5','6','7','8','9','10','11','12','13'};
xlabels={'1','2','3','4','5','6','7','8','9','10','11','12','13'};

% Set the y-axis tick labels to be the letters you defined
yticks([1 2 3 4 5 6 7 8 9 10 11 12 13])
yticklabels(ylabels)
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13])
xticklabels(xlabels)
set(gca,'FontSize',14)


xlabel('Modules');
ylabel('Modules');


