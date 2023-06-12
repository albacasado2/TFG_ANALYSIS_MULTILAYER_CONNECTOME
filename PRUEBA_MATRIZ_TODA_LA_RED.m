clc;
clear;
%Antes de nada es importante poner bien el directorio donde está el archivo
%de Excel

%Leemos la información neuronal de C.Elegans proporcionada por el artículo
info_article=readtable('edgelist_MA.csv');
info_article_np=readtable('edgelist_NP.csv');
info_wormatlas=readtable('PRUEBA-WORMATLAS.csv');
info_whitefig=readtable('conectionsGAPYSINAPTIC.csv');
info_albertfig=readtable('CONEXIONESPHARINGEAL.csv');%Matriz SINAPTICA Y DE GAP DE NEURONAS FARINGEAS



%% Matriz de MONOAMINAS

%Ahora vamos a crear una matriz ADJ donde tengamos 0 y 1 en función del
%origen y destino de la red neuronal.
%miramos primero todas las neuronas sources que hay

lista_source=[];
lista_target=[];
%convertimos la infromacion de source de una table a una cell tipe para que
%sea más fácil trabajar con la información
%el excel ya está cambiado para que las neuronas aparezcan en el orden que
%queremos, es decir, pharyngeal-sensory-interneurons-motor
lista_source=table2cell(info_wormatlas(:,1));
lista_target=table2cell(info_wormatlas(:,1));

%%
red_neuronal_monoaminas=zeros(length(lista_source),length(lista_target));
MA(:,1)=table2cell(info_article(:,1));
MA(:,2)=table2cell(info_article(:,2)); 
count_MA=0;
for i=1:length(MA)
    source_pos=find(strcmp(lista_source,MA(i,1)));
    target_pos=find(strcmp(lista_target,MA(i,2)));
    red_neuronal_monoaminas(source_pos,target_pos)=1;
    count_MA=count_MA+1;
end

%De modo que tenemos red_neuronal_monoaminas que es una matriz binaria que
%indica la interacción entre source y target y tenemos
%red_neuronal_monoaminas_abs que indica la relación entre source y target
%de manera general considerando que puede darse la misma interacción más de
%una vez.

%% RED NEURONAL NEUROPEPTIDOS
red_neuronal_neuropeptidos=zeros(length(lista_source),length(lista_target));
NP(:,1)=table2cell(info_article_np(:,1));
NP(:,2)=table2cell(info_article_np(:,2)); 
count_NP=0;
for i=1:length(NP)
    source_pos=find(strcmp(lista_source,NP(i,1)));
    target_pos=find(strcmp(lista_target,NP(i,2)));
    red_neuronal_neuropeptidos(source_pos,target_pos)=1;
    count_NP=count_NP+1;
end
%% RED NEURONAL SINAPTICA Y DE GAP

red_neuronal_synap=zeros(length(lista_source),length(lista_source));
red_neuronal_gap=zeros(length(lista_source),length(lista_source));
SY(:,1)=table2cell(info_whitefig(:,1));
SY(:,2)=table2cell(info_whitefig(:,2)); 
SY(:,3)=table2cell(info_whitefig(:,3));
SY(:,4)=table2cell(info_whitefig(:,4));
PHAR(:,1)=table2cell(info_albertfig(:,1));
PHAR(:,2)=table2cell(info_albertfig(:,2));
PHAR(:,3)=table2cell(info_albertfig(:,4));
PHAR(:,4)=table2cell(info_albertfig(:,3));
count_GAP=0;
count_SYNAP=0;

for i=1:length(PHAR)
    source_pos=find(strcmp(lista_source,PHAR(i,1)));
    target_pos=find(strcmp(lista_target,PHAR(i,2)));
    t=strcmp(PHAR(i,3),'G');
    if t==1
        red_neuronal_gap(source_pos,target_pos)=cell2mat(PHAR(i,4));
        %red_neuronal_gap_abs(source_pos,target_pos)=red_neuronal_gap_abs(source_pos,target_pos)+1;
        count_GAP=count_GAP+1;
    else
        red_neuronal_synap(source_pos,target_pos)=cell2mat(PHAR(i,4));
        %red_neuronal_synap_abs(source_pos,target_pos)=red_neuronal_synap_abs(source_pos,target_pos)+1;
        count_SYNAP=count_SYNAP+1;
    end
end

for i=1:length(SY)
    source_pos=find(strcmp(lista_source,SY(i,1)));
    target_pos=find(strcmp(lista_target,SY(i,2)));
    t=strcmp(SY(i,3),'EJ');
    s1=strcmp(SY(i,3),'S');
    s2=strcmp(SY(i,3),'Sp');
    if t==1
        red_neuronal_gap(source_pos,target_pos)=cell2mat(SY(i,4));
        %red_neuronal_gap_abs(source_pos,target_pos)=red_neuronal_gap_abs(source_pos,target_pos)+1;
        count_GAP=count_GAP+1;
    end
    if (s1==1)|(s2==1)
        red_neuronal_synap(source_pos,target_pos)=cell2mat(SY(i,4));
        %red_neuronal_synap_abs(source_pos,target_pos)=red_neuronal_synap_abs(source_pos,target_pos)+1;
        count_SYNAP=count_SYNAP+1;
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
spy(red_neuronal_gap,'b',7)
figure;
spy(red_neuronal_monoaminas,'g',7)
figure;
spy(red_neuronal_neuropeptidos,'r',7)
figure
spy(red_neuronal_neuropeptidos,'r',7)
hold on;
spy(red_neuronal_synap,'m',7)
spy(red_neuronal_gap,'b',7)
spy(red_neuronal_monoaminas,'g',7)

hold off;

%% TODO EL CONECTOMA EN UNA MATRIZ

TOTAL=red_neuronal_synap + red_neuronal_gap + red_neuronal_monoaminas + red_neuronal_neuropeptidos;
% 
% figure;
% spy(TOTAL)

