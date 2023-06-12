function [a,gan_mod]=plotear_por_ganglio(module)

info_name=readtable('Neuronposiciones.csv');
info_name=table2cell(info_name(:,1));
lista_posiciones_x=table2cell(readtable("posiciones1.txt",'NumHeaderLines',0));
lista_posiciones_x=cell2mat(lista_posiciones_x);
info_wormatlas=readtable('PRUEBA-WORMATLAS.csv');
info_wormatlas=table2cell(info_wormatlas);

a=[];
for i=1:length(module)
    pos=module(i)+1;
    t=find(strcmp(info_name,info_wormatlas(pos,1)));
    a=[a, t];
end

gan_mod=zeros(1,11);
for j=1:length(a)
    if a(j)<=20
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.6350 0.0780 0.1840])
        xlim([0 0.9]);
        gan_mod(1)=gan_mod(1)+1;
    elseif (20<a(j))&(a(j)<=58)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.8500 0.3250 0.0980])
        xlim([0 0.9]);
        gan_mod(2)=gan_mod(2)+1;
    elseif (58<a(j))&(a(j)<=64)
        scatter(lista_posiciones_x(a(j)),1,'filled','y')
        xlim([0 0.9]);
        gan_mod(3)=gan_mod(3)+1;
    elseif (64<a(j))&(a(j)<=128)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.9290 0.6940 0.1250])
        xlim([0 0.9]);
        gan_mod(4)=gan_mod(4)+1;
    elseif (128<a(j))&(a(j)<=160)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.4660 0.6740 0.1880])
        xlim([0 0.9]); 
        gan_mod(5)=gan_mod(5)+1;
    elseif (160<a(j))&(a(j)<=190)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.4660 0.6740 0.4880])
        xlim([0 0.9]);
        gan_mod(6)=gan_mod(6)+1;
    elseif (190<a(j))&(a(j)<=203)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.4660 0.6740 0.8880])
        xlim([0 0.9]);
        gan_mod(7)=gan_mod(7)+1;
    elseif (203<a(j))&(a(j)<=260)
        scatter(lista_posiciones_x(a(j)),1,'filled','c')
        xlim([0 0.9]);
        gan_mod(8)=gan_mod(8)+1;
    elseif (260<a(j))&(a(j)<=284)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor' ,[0.4940 0.1840 0.1560])
        xlim([0 0.9]);
        gan_mod(9)=gan_mod(9)+1;
    elseif (284<a(j))&(a(j)<=296)
        scatter(lista_posiciones_x(a(j)),1,'filled','MarkerFaceColor',[0.4940 0.1840 0.5560])
        xlim([0 0.9]);
        gan_mod(10)=gan_mod(10)+1;
    elseif (296<a(j))&(a(j)<=300)
        scatter(lista_posiciones_x(a(j)),1,'filled','k')
        xlim([0 0.9]);
        gan_mod(11)=gan_mod(11)+1;
    end
    hold on
end

