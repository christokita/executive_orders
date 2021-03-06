// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// CalcLikelihoodC
double CalcLikelihoodC(arma::sp_mat dtm, NumericMatrix phi, NumericMatrix theta);
RcppExport SEXP idaTopicModels_CalcLikelihoodC(SEXP dtmSEXP, SEXP phiSEXP, SEXP thetaSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< arma::sp_mat >::type dtm(dtmSEXP );
        Rcpp::traits::input_parameter< NumericMatrix >::type phi(phiSEXP );
        Rcpp::traits::input_parameter< NumericMatrix >::type theta(thetaSEXP );
        double __result = CalcLikelihoodC(dtm, phi, theta);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
// CalcSumSquares
NumericVector CalcSumSquares(arma::sp_mat dtm, NumericMatrix phi, NumericMatrix theta, NumericVector ybar);
RcppExport SEXP idaTopicModels_CalcSumSquares(SEXP dtmSEXP, SEXP phiSEXP, SEXP thetaSEXP, SEXP ybarSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< arma::sp_mat >::type dtm(dtmSEXP );
        Rcpp::traits::input_parameter< NumericMatrix >::type phi(phiSEXP );
        Rcpp::traits::input_parameter< NumericMatrix >::type theta(thetaSEXP );
        Rcpp::traits::input_parameter< NumericVector >::type ybar(ybarSEXP );
        NumericVector __result = CalcSumSquares(dtm, phi, theta, ybar);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
