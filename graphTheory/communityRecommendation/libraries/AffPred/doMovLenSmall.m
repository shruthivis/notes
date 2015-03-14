addpath('../data/MovieLens/small/mat');  %load all.mat

if 1
    %Getting the data ready
    load splt_3.mat
    [nuTrn, nmTrn] = size(trn);

    if 0
        for i = 1:nmTrn
            mrats = trn(:,i);   nzidx = find(mrats);  nzlen = length(nzidx);
            if nzlen>5;
                rp = randperm(nzlen); iidx = rp(1:round(0.5*nzlen));
                nzidx = nzidx(iidx);
                z = sparse(nuTrn,1);  z(nzidx) = mrats(nzidx);
                trn(:,i) = z;
            end
        end
    end

    trn = sparse(trn);
    [Utrn,Mtrn,D] = find(trn);     Utrn = sort(unique(Utrn));  Mtrn = sort(unique(Mtrn));
    [Utst,Mtst,D] = find(tst);     Utst = sort(unique(Utst));  Mtst = sort(unique(Mtst));
    Uidx = intersect(Utrn,Utst);   Midx = intersect(Mtrn, Mtst);
    train = trn(Uidx, Midx);       test = tst(Uidx,Midx);

    [nusers,nmovies] = size(train);


    if 1
        %decentralizae
        [U,M,D] = find(train); mu = mean(D);
        train = sparse(U,M,D-mu);
        %removie the bias
        lbd = 0.1;
        Vbup = double(lbd*ones(1,nusers));  Vbip = double(lbd*ones(1,nmovies));
        bup = zeros(nusers,1);  bip = zeros(nmovies,1);
        [bu,bi] = JacobiBias(600, train, [Vbup,Vbip]', [bup; bip], [bup; bip]);
        bpred = repmat(bu,[1,nmovies])+ repmat(bi',[nusers,1]);
        Btrn = spones(train);  Btst = spones(test);
        train = train - Btrn.*bpred;
        test  = test -  Btst.*(mu+bpred);
    end
end


%ulab = ULabel; mlab = MLabel;
TRN_ERR_0 = []; TST_ERR_0 = [];
TRN_ERR_1 = []; TST_ERR_1 = []; TRN_ERR_2 = []; TST_ERR_2 = [];

nfacts = 10;


UFactorsIni = 0.03*ones(nfacts,nusers); MFactorsIni = 0.03*ones(nfacts,nmovies);
lrate = 0.001;  maxiter = 1000;  
B = spones(train);


if 0 %----
Au = sparse(zeros(nusers));   Am = sparse(zeros(nmovies));
lambda = 15
alpha  = 0

[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, UFactorsIni, MFactorsIni, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);


RMSE_NOGL = GetRMSE(test,PP,QQ)
end  %----

%return;
%===========
lambda = 1 
alpha  = 12
load Wn Au Am;  
Au = Au(Uidx,Uidx);  %Au = Au./repmat(sum(Au,2),[1,length(Uidx)]);
Am = Am(Midx,Midx);  %Am = Am./repmat(sum(Am,2),[1,length(Midx)]); 
 
%[E,F,G] = find(Au); G = G(randperm(length(G))); Au = sparse(E,F,G);
%[E,F,G] = find(Am); G = G(randperm(length(G))); Am = sparse(E,F,G);


[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, UFactorsIni, MFactorsIni, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);
[PP, QQ] = simonfunkMFGL_knn(maxiter, lambda, alpha, PP, QQ, train, B, lrate, Au, Am);




RMSE_GL = GetRMSE(test,PP,QQ)
%RMSE_NOGL










