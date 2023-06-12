%primero cargamos la informacion de PRUEBA_MATRIZ_TODA_LA_RED para tener la
%matriz de adjacencia generica y así ahora depsues tratarla con diferentes
%algoritmos para ver los resultados

louvaina_modules_synap=table2cell(readtable("louvaina_modulos_np.txt",'Delimiter',',','NumHeaderLines',0));
t=cell2mat(louvaina_modules_synap);

lista_source_louvaina_positions=transpose(t);
lista_target_louvaina_positions=transpose(t);

info_wormatlas=readtable('PRUEBA-WORMATLAS.csv');
lista_source=table2cell(info_wormatlas(:,1));
lista_target=table2cell(info_wormatlas(:,1));

lista_source_louvaina=[];

for i=1:length(lista_source_louvaina_positions)
    pos=lista_source_louvaina_positions(i);
    lista_source_louvaina=[lista_source_louvaina; lista_source(pos+1)];
end
lista_target_louvaina=lista_source_louvaina;



%%

red_neuronal_monoaminas=zeros(length(lista_source_louvaina),length(lista_target_louvaina));
MA(:,1)=table2cell(info_article(:,1));
MA(:,2)=table2cell(info_article(:,2)); 

for i=1:length(MA)
    source_pos=find(strcmp(lista_source_louvaina,MA(i,1)));
    target_pos=find(strcmp(lista_target_louvaina,MA(i,2)));
    red_neuronal_monoaminas(source_pos,target_pos)=1;
end

%De modo que tenemos red_neuronal_monoaminas que es una matriz binaria que
%indica la interacción entre source y target y tenemos
%red_neuronal_monoaminas_abs que indica la relación entre source y target
%de manera general considerando que puede darse la misma interacción más de
%una vez.

%% RED NEURONAL NEUROPEPTIDOS
red_neuronal_neuropeptidos=zeros(length(lista_source_louvaina),length(lista_target_louvaina));
NP(:,1)=table2cell(info_article_np(:,1));
NP(:,2)=table2cell(info_article_np(:,2)); 

for i=1:length(NP)
    source_pos=find(strcmp(lista_source_louvaina,NP(i,1)));
    target_pos=find(strcmp(lista_target_louvaina,NP(i,2)));
    red_neuronal_neuropeptidos(source_pos,target_pos)=1;
end

%% RED NEURONAL SINAPTICA Y DE GAP

red_neuronal_synap=zeros(length(lista_source_louvaina),length(lista_source_louvaina));
red_neuronal_gap=zeros(length(lista_source_louvaina),length(lista_source_louvaina));
SY(:,1)=table2cell(info_whitefig(:,1));
SY(:,2)=table2cell(info_whitefig(:,2)); 
SY(:,3)=table2cell(info_whitefig(:,3));
SY(:,4)=table2cell(info_whitefig(:,4));
PHAR(:,1)=table2cell(info_albertfig(:,1));
PHAR(:,2)=table2cell(info_albertfig(:,2));
PHAR(:,3)=table2cell(info_albertfig(:,4));
PHAR(:,4)=table2cell(info_albertfig(:,3));


for i=1:length(PHAR)
    source_pos=find(strcmp(lista_source_louvaina,PHAR(i,1)));
    target_pos=find(strcmp(lista_target_louvaina,PHAR(i,2)));
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
    source_pos=find(strcmp(lista_source_louvaina,SY(i,1)));
    target_pos=find(strcmp(lista_target_louvaina,SY(i,2)));
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
spy(red_neuronal_neuropeptidos,'r',7)


figure;
spy(red_neuronal_neuropeptidos,'r',7)
hold on;
spy(red_neuronal_synap,'m',7)
spy(red_neuronal_monoaminas,'g',7)
spy(red_neuronal_gap,'b',7)


hold off;
TOTAL=red_neuronal_synap+red_neuronal_gap+red_neuronal_monoaminas+red_neuronal_neuropeptidos;
%% AHORA VAMOS A PLOTEAR LOS MODULOS EN FUNCION DE LA FUNCION

figure;
subplot(4,1,1)
module_1=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_1.txt",'Delimiter',',','NumHeaderLines',0));
module_1=cell2mat(module_1);
[a1,fun_mod1]=plotear_por_funcion(module_1);
    
subplot(4,1,2)
module_2=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_2.txt",'Delimiter',',','NumHeaderLines',0));
module_2=cell2mat(module_2);
[a2,fun_mod2]=plotear_por_funcion(module_2);

subplot(4,1,3)
module_3=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_3.txt",'Delimiter',',','NumHeaderLines',0));
module_3=cell2mat(module_3);
[a3,fun_mod3]=plotear_por_funcion(module_3);

 subplot(4,1,4)
module_4=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_4.txt",'Delimiter',',','NumHeaderLines',0));
module_4=cell2mat(module_4);
[a4,fun_mod4]=plotear_por_funcion(module_4);


hold off

%% AHORA VAMOS A PLOTEARLO SEPARANDO POR GANGLIOS

figure;
subplot(4,1,1)
module_1=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_1.txt",'Delimiter',',','NumHeaderLines',0));
module_1=cell2mat(module_1);
[a1,gan_mod1]=plotear_por_ganglio(module_1);
    
subplot(4,1,2)
module_2=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_2.txt",'Delimiter',',','NumHeaderLines',0));
module_2=cell2mat(module_2);
[a2,gan_mod2]=plotear_por_ganglio(module_2);

subplot(4,1,3)
module_3=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_3.txt",'Delimiter',',','NumHeaderLines',0));
module_3=cell2mat(module_3);
[a3,gan_mod3]=plotear_por_ganglio(module_3);

subplot(4,1,4)
module_4=table2cell(readtable("D:\TFG\S1 Dataset. Included are edge lists and source data for monoamine and neuropeptide networks\DATOS S1\edge_lists\louvaina_modulos_np\modulo_4.txt",'Delimiter',',','NumHeaderLines',0));
module_4=cell2mat(module_4);
[a4,gan_mod4]=plotear_por_ganglio(module_4);


hold off