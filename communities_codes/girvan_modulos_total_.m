%primero cargamos la informacion de PRUEBA_MATRIZ_TODA_LA_RED para tener la
%matriz de adjacencia generica y así ahora depsues tratarla con diferentes
%algoritmos para ver los resultados

girvan_modules_synap=table2cell(readtable("girvan_modulos_total.txt",'Delimiter',',','NumHeaderLines',0));
t=cell2mat(girvan_modules_synap);

lista_source_girvan_positions=transpose(t);
lista_target_girvan_positions=transpose(t);

lista_source=table2cell(info_wormatlas(:,1));
lista_target=table2cell(info_wormatlas(:,1));

lista_source_girvan=[];

for i=1:length(lista_source_girvan_positions)
    pos=lista_source_girvan_positions(i);
    lista_source_girvan=[lista_source_girvan; lista_source(pos+1)];
end
lista_target_girvan=lista_source_girvan;



%%

red_neuronal_monoaminas=zeros(length(lista_source_girvan),length(lista_target_girvan));
MA(:,1)=table2cell(info_article(:,1));
MA(:,2)=table2cell(info_article(:,2)); 

for i=1:length(MA)
    source_pos=find(strcmp(lista_source_girvan,MA(i,1)));
    target_pos=find(strcmp(lista_target_girvan,MA(i,2)));
    red_neuronal_monoaminas(source_pos,target_pos)=1;
end

%De modo que tenemos red_neuronal_monoaminas que es una matriz binaria que
%indica la interacción entre source y target y tenemos
%red_neuronal_monoaminas_abs que indica la relación entre source y target
%de manera general considerando que puede darse la misma interacción más de
%una vez.

%% RED NEURONAL NEUROPEPTIDOS
red_neuronal_neuropeptidos=zeros(length(lista_source_girvan),length(lista_target_girvan));
NP(:,1)=table2cell(info_article_np(:,1));
NP(:,2)=table2cell(info_article_np(:,2)); 

for i=1:length(NP)
    source_pos=find(strcmp(lista_source_girvan,NP(i,1)));
    target_pos=find(strcmp(lista_target_girvan,NP(i,2)));
    red_neuronal_neuropeptidos(source_pos,target_pos)=1;
end


%% RED NEURONAL SINAPTICA Y DE GAP

red_neuronal_synap=zeros(length(lista_source_girvan),length(lista_source_girvan));
red_neuronal_gap=zeros(length(lista_source_girvan),length(lista_source_girvan));
SY(:,1)=table2cell(info_whitefig(:,1));
SY(:,2)=table2cell(info_whitefig(:,2)); 
SY(:,3)=table2cell(info_whitefig(:,3));
SY(:,4)=table2cell(info_whitefig(:,4));
PHAR(:,1)=table2cell(info_albertfig(:,1));
PHAR(:,2)=table2cell(info_albertfig(:,2));
PHAR(:,3)=table2cell(info_albertfig(:,4));
PHAR(:,4)=table2cell(info_albertfig(:,3));


for i=1:length(PHAR)
    source_pos=find(strcmp(lista_source_girvan,PHAR(i,1)));
    target_pos=find(strcmp(lista_target_girvan,PHAR(i,2)));
    t=strcmp(PHAR(i,3),'G');
    if t==1
        red_neuronal_gap(source_pos,target_pos)=cell2mat(PHAR(i,4));
        %red_neuronal_gap_abs(source_pos,target_pos)=red_neuronal_gap_abs(source_pos,target_pos)+1;
    else
        red_neuronal_synap(source_pos,target_pos)=cell2mat(PHAR(i,4));
        %red_neuronal_synap_abs(source_pos,target_pos)=red_neuronal_synap_abs(source_pos,target_pos)+1;
    end
end

for i=1:length(SY)
    source_pos=find(strcmp(lista_source_girvan,SY(i,1)));
    target_pos=find(strcmp(lista_target_girvan,SY(i,2)));
    t=strcmp(SY(i,3),'EJ');
    s1=strcmp(SY(i,3),'S');
    s2=strcmp(SY(i,3),'Sp');
    if t==1
        red_neuronal_gap(source_pos,target_pos)=cell2mat(SY(i,4));
        %red_neuronal_gap_abs(source_pos,target_pos)=red_neuronal_gap_abs(source_pos,target_pos)+1;
    end
    if (s1==1)|(s2==1)
        red_neuronal_synap(source_pos,target_pos)=cell2mat(SY(i,4));
        %red_neuronal_synap_abs(source_pos,target_pos)=red_neuronal_synap_abs(source_pos,target_pos)+1;
    end
end

%De modo que tenemos red_neuronal_monoaminas que es una matriz binaria que
%indica la interacción entre source y target y tenemos
%red_neuronal_monoaminas_abs que indica la relación entre source y target
%de manera general considerando que puede darse la misma interacción más de
%una vez.

%% Para plotear la tabla:
figure;
spy(red_neuronal_synap,'m',7)

figure;
spy(red_neuronal_synap,'m',7)
hold on;
spy(red_neuronal_gap,'b',7)
spy(red_neuronal_monoaminas,'g',7)
spy(red_neuronal_neuropeptidos,'r',7)

hold off;

%% AHORA VAMOS A PLOTEAR LOS MODULOS EN FUNCION DE LA FUNCION

figure;
subplot(2,1,1)
module_1=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\girvan_modulos_total\girvan_modulos_total_1.txt",'Delimiter',',','NumHeaderLines',0));
module_1=cell2mat(module_1);
[a1,fun_mod1]=plotear_por_funcion(module_1);
    
subplot(2,1,2)
module_2=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\girvan_modulos_total\girvan_modulos_total_2.txt",'Delimiter',',','NumHeaderLines',0));
module_2=cell2mat(module_2);
[a2,fun_mod2]=plotear_por_funcion(module_2);


hold off

%% AHORA VAMOS A PLOTEARLO SEPARANDO POR GANGLIOS

figure;
subplot(2,1,1)
module_1=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\girvan_modulos_total\girvan_modulos_total_1.txt",'Delimiter',',','NumHeaderLines',0));
module_1=cell2mat(module_1);
[a1,gan_mod1]=plotear_por_ganglio(module_1);
    
subplot(2,1,2)
module_2=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\girvan_modulos_total\girvan_modulos_total_2.txt",'Delimiter',',','NumHeaderLines',0));
module_2=cell2mat(module_2);
[a2,gan_mod2]=plotear_por_ganglio(module_2);
hold off

%% REPRESENTACION GANGLIO-MODULO Y FUNCION-MODULO

for j=1:11
    ganglio_modulo(j,1)=gan_mod1(j);
    ganglio_modulo(j,2)=gan_mod2(j);
end
%normalize the results:
for j=1:2
    total=ganglio_modulo(1,j)+ganglio_modulo(2,j)+ganglio_modulo(3,j)+ganglio_modulo(4,j)+...
        ganglio_modulo(5,j)+ganglio_modulo(6,j)+ganglio_modulo(7,j)+ganglio_modulo(8,j)+...
        ganglio_modulo(9,j)+ganglio_modulo(10,j)+ganglio_modulo(11,j);
    ganglio_modulo_n(1,j)=ganglio_modulo(1,j)/total;
    ganglio_modulo_n(2,j)=ganglio_modulo(2,j)/total;
    ganglio_modulo_n(3,j)=ganglio_modulo(3,j)/total;
    ganglio_modulo_n(4,j)=ganglio_modulo(4,j)/total;
    ganglio_modulo_n(5,j)=ganglio_modulo(5,j)/total;
    ganglio_modulo_n(6,j)=ganglio_modulo(6,j)/total;
    ganglio_modulo_n(7,j)=ganglio_modulo(7,j)/total;
    ganglio_modulo_n(8,j)=ganglio_modulo(8,j)/total;
    ganglio_modulo_n(9,j)=ganglio_modulo(9,j)/total;
    ganglio_modulo_n(10,j)=ganglio_modulo(10,j)/total;
    ganglio_modulo_n(11,j)=ganglio_modulo(11,j)/total;
end
for j=1:4
    function_modulo(j,1)=fun_mod1(j);
    function_modulo(j,2)=fun_mod2(j);
end
%normalize it
for j=1:2
    total=function_modulo(1,j)+function_modulo(2,j)+function_modulo(3,j)+function_modulo(4,j);
    function_modulo_n(1,j)=function_modulo(1,j)/total;
    function_modulo_n(2,j)=function_modulo(2,j)/total;
    function_modulo_n(3,j)=function_modulo(3,j)/total;
    function_modulo_n(4,j)=function_modulo(4,j)/total;
end
%%
figure; 
imagesc(ganglio_modulo)
xlabel('Modules');
ylabel('Ganglion');
colorbar;
figure; 
imagesc(ganglio_modulo_n)
xlabel('Modules');
ylabel('Ganglion');
colorbar;
figure;
imagesc(function_modulo)
ylabels={'PHAR','SEN','INT','MOT'};
% Set the y-axis tick labels to be the letters you defined
yticks([1 2 3 4 5])
yticklabels(ylabels)
xlabel('Modules');
ylabel('Function');
colorbar;
figure;
imagesc(function_modulo_n)
ylabels={'PHAR','SEN','INT','MOT'};
% Set the y-axis tick labels to be the letters you defined
yticks([1 2 3 4 5])
yticklabels(ylabels)
xlabel('Modules');
ylabel('Function');
colorbar;
