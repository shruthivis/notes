
%
%[P, Q] = simonfunkMFGL_knn(maxiter, lambda, alpha, Pini, Qini, train, B, lrate, Au, Am);
% INPUT
%       maxiter: maximum number of iteration, say, 1000
%       lambda:  paraemter for Frobenius norm regularization
%       alpha:   paraemter for Laplacian regularization
%       Pini:    the k-by-N matrix, the initial value of P (user factor)
%       Qini:    the k-by-M matrix, the initial value of Q (item factor)
%       train:   the N-by-M SPARSE matrix, the training set
%       B:       the N-by-M SPARSE matrix, specifying the observed entries
%       lrate:   the learning rate, say, lrate = 1e-3
%       Au:      the NxN SPARSE matrix specifying the affinity between users
%       Am:      the MxM SPARSE matrix specifying the affinity between items
% OUTPUT:
%       P, Q: the learned user and item factor
%
%
%
%[P, Q] = simonfunkMFGL_knn_U(maxiter, lambda, alpha, Pini, Qini, train, B, lrate, Au);
% INPUT
%       maxiter: maximum number of iteration, say, 1000
%       lambda:  paraemter for Frobenius norm regularization
%       alpha:   paraemter for Laplacian regularization
%       Pini:    the k-by-N matrix, the initial value of P (user factor)
%       Qini:    the k-by-M matrix, the initial value of Q (item factor)
%       train:   the N-by-M SPARSE matrix, the training set
%       B:       the N-by-M SPARSE matrix, specifying the observed entries
%       lrate:   the learning rate, say, lrate = 1e-3
%       Au:      the NxN SPARSE matrix specifying the affinity between users
% OUTPUT:
%       P, Q: the learned user and item factor
