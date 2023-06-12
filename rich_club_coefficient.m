%calculate the rich club coefficient
%% RICH CLUB IN DEGREE

% Calculate the degree of each node
red_neuronal_synap_binary=red_neuronal_neuropeptidos>0;
adj_matrix=red_neuronal_synap_binary;
adj_matrix = double(adj_matrix~=0);
k = sum(adj_matrix);
% Sort the degree vector in descending order
[k_sorted,sort_idx] = sort(k,'descend');
kmax=max(k);
rc=zeros(kmax,1);

for j=1:kmax
    %identify nodes with deegree >=k
    richnodes=sort_idx(k(sort_idx)>=j);
    % count number of edges among rich nodes
    nedges=sum(sum(adj_matrix(richnodes,richnodes)));
    %Calculate the fraction of possible edges
    npossible=length(richnodes)*(length(richnodes)-1)/2;
    if npossible>0
        rc(j)=nedges/npossible;
    end
end

% now to obtain the normalized rich club coefficient
% generate null model
% generate random directed graph with same degree sequence
adj_matrix_rand = randmio_dir(adj_matrix,1000);
% calculate rich club coefficient for each degree level
adj_matrix_rand = double(adj_matrix_rand~=0);
k_rand = sum(adj_matrix_rand);
% Sort the degree vector in descending order
[k_sorted_rand,sort_idx_rand] = sort(k_rand,'descend');
kmax_rand=max(k_rand);
rc_rand=zeros(kmax_rand,1);

for j=1:kmax
    %identify nodes with deegree >=k
    richnodes_rand=sort_idx_rand(k_rand(sort_idx_rand)>=j);
    % count number of edges among rich nodes
    nedges_rand=sum(sum(adj_matrix_rand(richnodes_rand,richnodes_rand)));
    %Calculate the fraction of possible edges
    npossible_rand=length(richnodes_rand)*(length(richnodes_rand)-1)/2;
    if npossible_rand>0
        rc_rand(j)=nedges_rand/npossible_rand;
    end
end

rc_final=rc./rc_rand;

 % obtain circles when the k is repeated
% pos_repeat=[];
% cont=1;
% for i=1:length(k)
%     positions=find(k==k(i));
%     if length(positions)>1
%         if length(pos_repeat)>1
%             a=find(pos_repeat==k(i));
%             if length(a)==0
%                 pos_repeat(cont)=k(i);
%                 cont=cont+1;
%             end
%         else
%             pos_repeat(cont)=k(i);
%             cont=cont+1;
%         end
%     end
% end

figure;
plot(rc_final);
hold on
plot(rc);
plot(rc_rand);
% for i=1:length(pos_repeat)
%     if pos_repeat(i)~=0
%         scatter(pos_repeat(i),rc_final(pos_repeat(i)))
%     end
% end
hold off
 xlabel('k degree');
 ylabel ('Rich club coefficient');
set(gca,'FontSize',16)


%https://www.jneurosci.org/content/33/15/6380

%% SACAR QUE NEURONAS EPRTENECEN A UN INTERVALO CONCRETO

cont=1;
%interest_section=[24:38]; %PARA SYNAPTIC LAYER
%interest_section=[4:11]; %PARA GAP LAYER

interest_section=[60:110];% PARA NEUROPEPTIDE LAYER
for i=1:length(k)
    a=find(interest_section==k(i));
    if length(a)~=0
       rich_club_neurons(cont)=i;
       cont=cont+1;
    end
end

%% RICH CLUB OUT DEGREE

% Calculate the degree of each nodes
red_neuronal_synap_binary=red_neuronal_neuropeptidos>0;
adj_matrix=red_neuronal_synap_binary;
adj_matrix = double(adj_matrix~=0);
k = sum(adj_matrix,2);
k=k';
% Sort the degree vector in descending order
[k_sorted,sort_idx] = sort(k,'descend');
kmax=max(k);
rc=zeros(kmax,1);

for j=1:kmax
    %identify nodes with deegree >=k
    richnodes=sort_idx(k(sort_idx)>=j);
    % count number of edges among rich nodes
    nedges=sum(sum(adj_matrix(richnodes,richnodes)));
    %Calculate the fraction of possible edges
    npossible=length(richnodes)*(length(richnodes)-1)/2;
    if npossible>0
        rc(j)=nedges/npossible;
    end
end

% now to obtain the normalized rich club coefficient
% generate null model
% generate random directed graph with same degree sequence
adj_matrix_rand = randmio_dir(adj_matrix,1000);
% calculate rich club coefficient for each degree level
adj_matrix_rand = double(adj_matrix_rand~=0);
k_rand = sum(adj_matrix_rand,2);
k_rand=k_rand';
% Sort the degree vector in descending order
[k_sorted_rand,sort_idx_rand] = sort(k_rand,'descend');
kmax_rand=max(k_rand);
rc_rand=zeros(kmax_rand,1);

for j=1:kmax
    %identify nodes with deegree >=k
    richnodes_rand=sort_idx_rand(k_rand(sort_idx_rand)>=j);
    % count number of edges among rich nodes
    nedges_rand=sum(sum(adj_matrix_rand(richnodes_rand,richnodes_rand)));
    %Calculate the fraction of possible edges
    npossible_rand=length(richnodes_rand)*(length(richnodes_rand)-1)/2;
    if npossible_rand>0
        rc_rand(j)=nedges_rand/npossible_rand;
    end
end

rc_final=rc./rc_rand;

% obtain circles when the k is repeated
% pos_repeat=[];
% cont=1;
% for i=1:length(k)
%     positions=find(k==k(i));
%     if length(positions)>1
%         if length(pos_repeat)>1
%             a=find(pos_repeat==k(i));
%             if length(a)==0
%                 pos_repeat(cont)=k(i);
%                 cont=cont+1;
%             end
%         else
%             pos_repeat(cont)=k(i);
%             cont=cont+1;
%         end
%     end
% end

figure;
plot(rc_final);
hold on
plot(rc);
plot(rc_rand);
% for i=1:length(pos_repeat)
%     if pos_repeat(i)~=0
%         scatter(pos_repeat(i),rc_final(pos_repeat(i)))
%     end
% end
hold off
set(gca,'FontSize',16)
%xlabel('k degree');
%ylabel('Rich club coefficient')
%%
cont=1;
%interest_section=[82:145]; %PARA MONOAMINAS
interest_section=[55:121]; %PARA NEUROPEPTIDOS

for i=1:length(k)
    a=find(interest_section==k(i));
    if length(a)~=0
       rich_club_neurons(cont)=i;
       cont=cont+1;
    end
end






