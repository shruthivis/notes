function  [P, Q] = ALS_knn_U(R, B, Pini, Qini, lambda, alpha, Au, maxiter)
%[P, Q] = simonfunkMFGL_knn_U(maxiter, lambda, alpha, Pini, Qini, train, B, lrate, Au);
% INPUT
%       R:    the N-by-M SPARSE matrix, the training set
%       B:    the N-by-M SPARSE matrix, specifying the observed entries
%       Pini: the N-by-k matrix, the initial value of P (user factor)
%       Qini: the N-by-k matrix, the initial value of Q (item factor)
%       lambda:  paraemter for Frobenius norm regularization
%       alpha:   paraemter for Laplacian regularization     
%       Au:      the NxN SPARSE matrix specifying the affinity between users
%       maxiter: maximum number of iteration, say, 1000
% OUTPUT:
%       P, Q: the learned user and item factor (N-by-k, M-by-k)


%% Load the useful variables
[N,M] = size(R);   

Nfact = size(Pini,2);
eps = 1e-3;  


%% Preporcessing/Initialization
for u = 1:N;  UIidx{u} = find(B(u,:)); end;
for i = 1:M;  IUidx{i} = find(B(:,i)); end;
for u = 1:N;  [U,M,D] = find(Au(u,:)); UserNNidx{u} = M;  UserNNwts{u} = D; end

it = 0;  P = Pini;  Q = Qini;  converge = 0;


%% The Main Loop
while it < maxiter & ~converge
    %fit P
    it = it +1;
    for u = 1:N
         
        iidx = UIidx{u};
        
        Nidx = UserNNidx{u};
         W   = UserNNwts{u};
        if ~isempty(W)
            mP = W*P(Nidx,:);   sumW = sum(W);
        else
            mP = zeros(1,Nfact);  sumW = eps;
        end           

        
        %keyboard
        r  = R(u,iidx)';   Qu = Q(iidx,:); % + Qfix(iidx,:);  r = r - Qu*pfix';
        
        A = [Qu', lambda*eye(Nfact), alpha*sumW*eye(Nfact)]';  %keyboard;
        b = [r; zeros(Nfact,1); alpha*mP'];
        P(u,:) = (pinv(A)*b)';
        
        
   end
    
    
   %fit Q
   Qold = Q;
    for i = 1:M
        uidx = IUidx{i};
         
        r  = R(uidx,i);  Pi = P(uidx,:); %+ Pfix(uidx,:);  r = r - Pi*qfix';  
        A = [Pi', lambda*eye(Nfact)]';
        b = [r; zeros(Nfact,1);];
        Q(i,:) = (pinv(A)*b)';
                
    end
    
    if norm(Q-Qold)<eps; converge = 1; end
    
    
end
%return;


%keyboard



