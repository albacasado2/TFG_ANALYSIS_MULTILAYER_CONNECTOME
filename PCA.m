%% PROBAMOS CON LAS MATRICES NORMALES
A=TOTAL;
[coeff,score,latent,tsquared,explained,mu]=pca(A);
latent_perc=(latent*100)/sum(latent);
figure;
plot(latent_perc,'bo-')
xlim([1 100])
xlabel('Principal components','FontSize',14)
ylabel('Variance value','FontSize',14)
title('PCA to the whole connectome','FontSize',14)

% RECOVER THE ORIGINAL DATA AFTER APLYING PCA AND REDUCING THE DIMENSIONS
c=repmat(mu, size(score, 1), 1);
numComp=26;
X = score(:, 1:numComp) * coeff(:, 1:numComp)' + c;
X=round(X);
figure;
spy(X,'b')
title('Recover after reducing to 26 components','FontSize',14)
figure;
spy(TOTAL,'b')
title('Original whole connectome matrix','FontSize',14)


%%
A=red_neuronal_synap;
[coeff,score,latent,tsquared,explained,mu]=pca(A);
latent_perc=(latent*100)/sum(latent);

figure;
plot(latent_perc,'bo-')
xlim([1 100])
xlabel('Principal components','FontSize',14)
ylabel('Variance value','FontSize',14)
title('PCA to the synaptic layer','FontSize',14)
% RECOVER THE ORIGINAL DATA AFTER APLYING PCA AND REDUCING THE DIMENSIONS
c=repmat(mu, size(score, 1), 1);
numComp=26;
X = score(:, 1:numComp) * coeff(:, 1:numComp)' + c;
red_neuronal_synap_PCA=round(X);
figure;
spy(red_neuronal_synap_PCA,'m')
title('Recover after reducing to 26 components','FontSize',14)
figure;
spy(A,'m')
title('Original synaptic matrix','FontSize',14)

%%

A=red_neuronal_gap;
[coeff,score,latent,tsquared,explained,mu]=pca(A);
latent_perc=(latent*100)/sum(latent);

figure;
plot(latent_perc,'bo-')
xlim([1 100])
xlabel('Principal components','FontSize',14)
ylabel('Variance value','FontSize',14)
title('PCA to the gap layer','FontSize',14)
% RECOVER THE ORIGINAL DATA AFTER APLYING PCA AND REDUCING THE DIMENSIONS
c=repmat(mu, size(score, 1), 1);
numComp=17;
X = score(:, 1:numComp) * coeff(:, 1:numComp)' + c;
red_neuronal_gap_PCA=round(X);
figure;
spy(red_neuronal_gap_PCA,'b')
title('Recover after reducing to 17 components','FontSize',14)
figure;
spy(A,'b')
title('Original gap matrix','FontSize',14)
%%
A=red_neuronal_monoaminas;
[coeff,score,latent,tsquared,explained,mu]=pca(A);
latent_perc=(latent*100)/sum(latent);

figure;
plot(latent_perc,'bo-')
xlim([1 100])
xlabel('Principal components','FontSize',14)
ylabel('Variance value','FontSize',14)
title('PCA to the monoamine layer','FontSize',14)
% RECOVER THE ORIGINAL DATA AFTER APLYING PCA AND REDUCING THE DIMENSIONS
c=repmat(mu, size(score, 1), 1);
numComp=3;
X = score(:, 1:numComp) * coeff(:, 1:numComp)' + c;
red_neuronal_monoaminas_PCA=round(X);
figure;
spy(red_neuronal_monoaminas_PCA,'g')
title('Recover after reducing to 3 components','FontSize',14)
figure;
spy(A,'g')
title('Original monoamine matrix','FontSize',14)

%%
A=red_neuronal_neuropeptidos;
[coeff,score,latent,tsquared,explained,mu]=pca(A);
latent_perc=(latent*100)/sum(latent);

figure;
plot(latent_perc,'bo-')
xlim([1 100])
xlabel('Principal components','FontSize',14)
ylabel('Variance value','FontSize',14)
title('PCA to the neuropeptide layer','FontSize',14)
% RECOVER THE ORIGINAL DATA AFTER APLYING PCA AND REDUCING THE DIMENSIONS
c=repmat(mu, size(score, 1), 1);
numComp=7;
X = score(:, 1:numComp) * coeff(:, 1:numComp)' + c;
red_neuronal_neuropeptidos_PCA=round(X);
figure;
spy(red_neuronal_neuropeptidos_PCA,'r')
title('Recover after reducing to 7 components','FontSize',14)
figure;
spy(A,'r')
title('Original neuropeptide matrix','FontSize',14)
figure;
plot(coeff(:,1),coeff(:,2),'*')
%% ploteamos todo el connectoma despues de haber reducido cada capa por separado
figure;
spy(red_neuronal_neuropeptidos,'r',7)
hold on;
spy(red_neuronal_synap,'m',7)
spy(red_neuronal_gap,'b',7)
spy(red_neuronal_monoaminas,'g',7)
hold off;
title('Original whole connectome matrix','FontSize',14)
figure
spy(red_neuronal_neuropeptidos_PCA,'r',7)
hold on;
spy(red_neuronal_synap_PCA,'m',7)
spy(red_neuronal_gap_PCA,'b',7)
spy(red_neuronal_monoaminas_PCA,'g',7)
hold off;
title('Recover after using PCA','FontSize',14)
%% PROBAMOS CON LAS MATRICES TRASPUESTAS

% EL PROBAR CON LAS MATRICES TRASPEUSTAS TENEMOS LOS MISMOS RESULTADOS QUE
% SIN TRASPONERLAS
% A=TOTAL';
% [coeff,score,latent,tsquared,explained,mu]=pca(A);
% latent_perc=(latent*100)/sum(latent);
% figure;
% plot(latent_perc,'bo-')
% xlim([1 100])
% xlabel('Principal components','FontSize',14)
% ylabel('Variance value','FontSize',14)
% title('PCA to the whole connectome','FontSize',14)
% 
% A=red_neuronal_synap';
% [coeff,score,latent,tsquared,explained,mu]=pca(A);
% latent_perc=(latent*100)/sum(latent);
% 
% figure;
% plot(latent_perc,'bo-')
% xlim([1 100])
% xlabel('Principal components','FontSize',14)
% ylabel('Variance value','FontSize',14)
% title('PCA to the synaptic layer','FontSize',14)
% 
% A=red_neuronal_gap';
% [coeff,score,latent,tsquared,explained,mu]=pca(A);
% latent_perc=(latent*100)/sum(latent);
% 
% figure;
% plot(latent_perc,'bo-')
% xlim([1 100])
% xlabel('Principal components','FontSize',14)
% ylabel('Variance value','FontSize',14)
% title('PCA to the gap layer','FontSize',14)
% 
% A=red_neuronal_monoaminas';
% [coeff,score,latent,tsquared,explained,mu]=pca(A);
% latent_perc=(latent*100)/sum(latent);
% 
% figure;
% plot(latent_perc,'bo-')
% xlim([1 100])
% xlabel('Principal components','FontSize',14)
% ylabel('Variance value','FontSize',14)
% title('PCA to the monoamine layer','FontSize',14)
% 
% A=red_neuronal_neuropeptidos';
% [coeff,score,latent,tsquared,explained,mu]=pca(A);
% latent_perc=(latent*100)/sum(latent);
% 
% figure;
% plot(latent_perc,'bo-')
% xlim([1 100])
% xlabel('Principal components','FontSize',14)
% ylabel('Variance value','FontSize',14)
% title('PCA to the neuropeptide layer','FontSize',14)

