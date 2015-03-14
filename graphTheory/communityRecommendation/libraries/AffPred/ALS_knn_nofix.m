function  [P, Q] = ALS_knn(R, B, Pini, Qini, ReguInfo, maxiter); 

%% Load the useful variables
%R    = Rinfo.ratings;  B    = Rinfo.mask;
%Pini = Pinfo.ini;      Qini = Qinfo.ini;

lambda = ReguInfo.lambda;    alpha = ReguInfo.alpha;
[N,M] = size(R);   

Nfact = size(Pini,2);
eps = 1e-3;  


%% Preporcessing/Initialization
for u = 1:N;  UIidx{u} = find(B(u,:)); end;
for i = 1:M;  IUidx{i} = find(B(:,i)); end;
 
it = 0;  P = Pini;  Q = Qini;  converge = 0;

%% The Main Loop
while it < maxiter & ~converge
    %fit P
    it = it +1;
    for u = 1:N
         
        iidx = UIidx{u};
        
        Nidx = ReguInfo.UserNNidx{u};
         W   = ReguInfo.UserNNwts{u};
        if ~isempty(W)
%             whos P
%             Nidx
%             keyboard;
            mP = W*P(Nidx,:);   sumW = sum(W);
        else
            mP = zeros(1,Nfact);  sumW = eps;
        end           

        
        %keyboard
        r  = R(u,iidx)';   Qu = Q(iidx,:); % + Qfix(iidx,:);  r = r - Qu*pfix';
        
        A = [Qu', lambda*eye(Nfact), alpha*sumW*eye(Nfact)]';  %keyboard;
        b = [r; zeros(Nfact,1); alpha*mP'];
    % whos A b 
    %    keyboard;
        P(u,:) = (pinv(A)*b)';
        
        
   end
    
    
   %fit Q
   Qold = Q;
    for i = 1:M
        uidx = IUidx{i};
        
        Nidx = ReguInfo.ItemNNidx{i};
         W   = ReguInfo.ItemNNwts{i};
        if ~isempty(W)
            mQ = W*Q(Nidx,:);   sumW = sum(W);
        else
            mQ = zeros(1,Nfact);  sumW = eps;
        end
 
        
        r  = R(uidx,i);  Pi = P(uidx,:); %+ Pfix(uidx,:);  r = r - Pi*qfix';  
        A = [Pi', lambda*eye(Nfact), alpha*sumW*eye(Nfact)]';
        b = [r; zeros(Nfact,1); alpha*mQ'];
      %  whos A b
        Q(i,:) = (pinv(A)*b)';
                
    end
    
    if norm(Q-Qold)<eps; converge = 1; end
    
    
end
%return;


%keyboard



