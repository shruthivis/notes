#include <math.h>
#include <string.h>
#include <time.h>

#include "mex.h"

/* [P, Q] = simonfunkMFGL(maxiter, lambda, alpha, Pini, Qini, train, B, lrate, Uknn)     */
/* This code implements Simon Funk's methods in his blogs   */
/* Matrix Factorization through stochastic gradient descent */

const double epsilon = 0.0000000001; /* stoping criteria */
//const double initval = 0.01;     /* initial value */

double getMatlabScalar(const mxArray *ptr)
{
    if (!mxIsDouble(ptr) || mxGetNumberOfElements(ptr) != 1) {
        mexErrMsgTxt("The input argument must be a double-precision scalar");
    }
    return *mxGetPr(ptr);
}

static inline
double predict(const double p, const double q, mwSize nf,
                mwSize f, double cacheA, double cacheB, int bTrailing)
{
    double sum = cacheA + p*q;
    if (bTrailing)
        sum += cacheB;
    return sum;
}

void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
    mwIndex i, j, t, f, k, m, n;

    if (nrhs != 9) {
        mexErrMsgTxt("Nine inputs are required.");
    }
    if (nlhs != 2) {
        mexErrMsgTxt("Two outputs are required.");
    }

    //[P, Q] = simonfunkMFGL(maxiter, lambda, alpha, P, Q, train, B)
    
    mwSize maxiter = (mwSize) getMatlabScalar(prhs[0]);
    double lambda = getMatlabScalar(prhs[1]);
    double alpha  = getMatlabScalar(prhs[2]);
    
    mwSize nfacts  = mxGetM(prhs[3]);
    double *Px = mxGetPr(prhs[3]);
    double *Qx = mxGetPr(prhs[4]); 
    
    mwIndex *trainIr = mxGetIr(prhs[5]);
    mwIndex *trainJc = mxGetJc(prhs[5]);
    mwSize nrows   = mxGetM(prhs[5]);
    mwSize ncols  = mxGetN(prhs[5]);
    
    
    double *train  = mxGetPr(prhs[5]);
    mwSize nzTrain = mxGetNzmax(prhs[5]);
        
    mwIndex *BIr = mxGetIr(prhs[6]);
    mwIndex *BJc = mxGetJc(prhs[6]);
    
    double lrate  = getMatlabScalar(prhs[7]);
    
    mwIndex *ukNNIr = mxGetIr(prhs[8]);
    mwIndex *ukNNJc = mxGetJc(prhs[8]);
    double  *ukNN   = mxGetPr(prhs[8]);

    //-------------------------------------------------------    
		       
    plhs[0] = mxCreateDoubleMatrix(nfacts, nrows,  mxREAL);
    plhs[1] = mxCreateDoubleMatrix(nfacts, ncols,  mxREAL);
    
    
    double *P = mxGetPr(plhs[0]);
    double *Q = mxGetPr(plhs[1]);
    double *cacheA = (double *) malloc(nzTrain*sizeof(double));
    double *cacheB = (double *) malloc(nzTrain*sizeof(double));
    memset(cacheA, 0.0, sizeof(cacheA));
    memset(cacheB, 0.0, sizeof(cacheB));
    for (i=0; i<nzTrain; i++){cacheA[i] = 0;}
    for (i=0; i<nzTrain; i++){cacheB[i] = 0;}
    
    for (i = 0; i < nfacts*nrows; i++)  P[i] = Px[i];
    for (i = 0; i < nfacts*ncols; i++)  Q[i] = Qx[i];
    
    double ukNNsum[nrows];
    double mkNNsum[ncols];   
         
    //Estimating the frequency ...
    mwSize UC[nrows];   for(i=0; i<nrows;  i++){ UC[i]=0;}
    mwSize MC[ncols];   for(i=0; i<ncols;  i++){ MC[i]=0;}       
    mwSize UCB[nrows];  for(i=0; i<nrows;  i++){ UCB[i]=0;}
    mwSize MCB[ncols];  for(i=0; i<ncols;  i++){ MCB[i]=0;}       
    double UCBR[nrows];  //for(i=0; i<nrows;  i++){ UCB[i]=0;}
    double MCBR[ncols];  //for(i=0; i<ncols;  i++){ MCB[i]=0;}      
    double USRsum[nrows];  for(i=0; i<nrows;  i++){ USRsum[i]=0;}
    double MSRsum[ncols];  for(i=0; i<ncols;  i++){ MSRsum[i]=0;}       
    
  
     //estimate the frequency
    for (i = 0; i < ncols; i++) {    
	    for (j = trainJc[i]; j < trainJc[i+1]; j++) {UC[trainIr[j]] += 1; MC[i] += 1;}
    }
      
     
    for (i = 0; i < ncols; i++) {    
	    for (j = BJc[i]; j < BJc[i+1]; j++) {UCB[trainIr[j]] += 1; MCB[i] += 1;}
    }
    for (i = 0; i < nrows; i++){UCBR[i] = sqrt((double)UCB[i]);}
    for (i = 0; i < ncols; i++){MCBR[i] = sqrt((double)MCB[i]);}
   
    for (i = 0; i < ncols; i++) {    
	    for (j = BJc[i]; j < BJc[i+1]; j++) {USRsum[trainIr[j]] += 1/MCBR[i]; MSRsum[i] += 1/UCBR[trainIr[j]];}
    }
    //for (i = 0; i < nrows; i++){printf("USRsum[%d]=%4f\n",i,USRsum[i]);}
    //for (i = 0; i < ncols; i++){printf("MSRsum[%d]=%4f\n",i,MSRsum[i]);}
    
    double uwsum[nrows];
    for (i = 0; i < nrows; i++){uwsum[i] = 0;}
    for (i = 0; i < nrows; i++) {    
	    for (j = ukNNJc[i]; j < ukNNJc[i+1]; j++) {
		    uwsum[ukNNIr[j]] += ukNN[j]; 
			    //printf("colIndex = %d, rowIndex = %d \n",i,ukNNIr[j]);
	    }
    } 
	    //for (i = 0; i < nrows; i++){printf("idx = %d sum of weight = %4f\n",i,wsum[i]);}
	    //printf("here once");
	    //return;
	    
//    double mwsum[nrows];
//    for (i = 0; i < ncols; i++){mwsum[i] = 0;}
//    for (i = 0; i < ncols; i++) {    
//	    for (j = mkNNJc[i]; j < mkNNJc[i+1]; j++) {	    
//		    mwsum[mkNNIr[j]] += mkNN[j]; 
//	    }
//    } 
    
   
    time_t start, end, tstart, tend;
    time(&tstart);
    
    //Initialize cache B
    for (i = 0; i < ncols; i++) {    
	    for (j = trainJc[i]; j < trainJc[i+1]; j++) {
		    for (f = 0; f<nfacts; f++){
			    double p = P[trainIr[j]*nfacts+f];
			    double q = Q[i*nfacts+f];
			    cacheB[j] += p*q;
		    }
	    }
    } 
    

    
      
    double psum, qsum;
    for (f = 0; f < nfacts; f++) {
        //printf(" Calculating feature (%d): \n", f+1);
        double rmse = 1000.0, old_rmse=rmse+2*epsilon;
	
	//Updateing CacheB
	for (i = 0; i < ncols; i++) {    
		for (j = trainJc[i]; j < trainJc[i+1]; j++) {
			double p = P[trainIr[j]*nfacts+f];
			double q = Q[i*nfacts+f];		    
			cacheB[j] -= p*q;	
		}
	}	
	//End Updating CacheB
	

	
	//Updating PP and QQ usng stochastic Gradient dedscent
        for (t = 0; ((t<maxiter)&&(rmse<=old_rmse-epsilon)); t++) {
            old_rmse = rmse;
            double trainerr = 0.0;
            time(&start);
	    mwSize cnt = 0;
	       
	    
	    //Updating the means ...
	    for (i = 0; i < nrows; i++){ukNNsum[i] = 0;}
	    for (i = 0; i < ncols; i++){mkNNsum[i] = 0;}
	    
	    for (i = 0; i < nrows; i++) {    
		    for (j = ukNNJc[i]; j < ukNNJc[i+1]; j++) {
			    ukNNsum[ukNNIr[j]] += P[i*nfacts+f]*ukNN[j];
		    }
	    } 
	    //for (i = 0; i < nrows; i++){printf("idx = %d sum of weight = %4f\n",i,wsum[i]);}
	    //printf("here once");
	    //return;
	    
	    //for (i = 0; i < ncols; i++) {    
		//    for (j = mkNNJc[i]; j < mkNNJc[i+1]; j++) {	    
		//	    mkNNsum[mkNNIr[j]] += Q[i*nfacts+f]*mkNN[j]; 
		//    }
	    //} 
	    
	    //printf("I am here once\n");

	    //Updating P and Q
	    for (i = 0; i < ncols; i++) {    
		    for (j = trainJc[i]; j < trainJc[i+1]; j++) {
		    
		    double p = P[trainIr[j]*nfacts+f];
		    double q = Q[i*nfacts+f];		    
		    double pred = predict(p, q, nfacts, f, cacheA[j],cacheB[j], 1);
		    
		    
		    qsum = mkNNsum[i]; 
		    //psum = ukNNsum[trainIr[j]];
		    
		    
		    double gradP, gradQ;
		    gradP  = (train[j]-pred)*q;
		    gradP -= (lambda*p+alpha*(uwsum[trainIr[j]]*p-psum))/UC[trainIr[j]];
		    //printf("movie IDX = %d, user IDX = %d\n", i,trainIr[j]);
		    //printf("p = %4f, wsum = %4f, weight = %4f, diff = %4f\n", p, psum, MSRsum[i],p*MSRsum[i]-psum);    
		  
		    gradQ  = (train[j]-pred)*p;
		    //gradQ -= (lambda*q+alpha*(mwsum[i]*q-qsum))/MC[i];
		    //printf("diff q = %4f\n",q*USRsum[trainIr[j]]-qsum);
		    		    
		    
		   		    
		    P[trainIr[j]*nfacts+f] += gradP*lrate;
		    Q[i*nfacts+f] += gradQ*lrate; 
		    
		    
		    trainerr += (train[j]-pred)*(train[j]-pred);
                }
		
           } //end (1 iteration)
	   
            time(&end); 
	    rmse = sqrt(trainerr/(double)nzTrain);
	    
	} 
	//End updating PP and QQ (all iterationgs)
	
	//UPdating CacheA
        for (i = 0; i < ncols; i++) {
            for (j = trainJc[i]; j < trainJc[i+1]; j++) {		      	
		double p = P[trainIr[j]*nfacts+f];
	        double q = Q[i*nfacts+f];			   
		cacheA[j] = predict(p, q, nfacts, f, cacheA[j], cacheB[j], 0);
            }
        }
	//End updating CacheA
	printf("rmse(train) = %.4f\n", rmse);	
    } //for(f)
    time(&tend);
    free(cacheA);
    free(cacheB);
} //for(main)

