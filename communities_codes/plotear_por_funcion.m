function [a,fun_mod]=plotear_por_funcion(module)

info_name=readtable('Neuronposiciones.csv');
info_name=table2cell(info_name(:,1));
lista_posiciones_x=table2cell(readtable("posiciones1.txt",'NumHeaderLines',0));
lista_posiciones_x=cell2mat(lista_posiciones_x);
info_wormatlas=readtable('PRUEBA-WORMATLAS.csv');
info_wormatlas=table2cell(info_wormatlas);

a=[];
fun_mod=zeros(1,4);
for i=1:length(module)
    pos=module(i)+1;
    t=find(strcmp(info_name,info_wormatlas(pos,1)));
    a=[a, t];
end

for j=1:length(a)
    if a(j)<=20
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.6350 0.0780 0.1840])
        xlim([0 0.9]);
        fun_mod(1)=fun_mod(1)+1;
    elseif (20<a(j))&(a(j)<=103)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.9290 0.6940 0.1250])
        xlim([0 0.9]);
        fun_mod(2)=fun_mod(2)+1;
    elseif (103<a(j))&(a(j)<=186)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.4660 0.6740 0.4880])
        xlim([0 0.9]);
        fun_mod(3)=fun_mod(3)+1;
    elseif (186<a(j))&(a(j)<=300)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.4940 0.1840 0.5560])
        xlim([0 0.9]);
        fun_mod(4)=fun_mod(4)+1;
    end
    hold on
end
