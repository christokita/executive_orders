#' Probailistic Topic Coherence
#' @description Calculates the probabilistic coherence of a topic. This approximates semmantic coherence or human understandability.
#' @param topic A probability vector denoting a relationship between words and a topic. This may be p(word|topic) or p(topic|word)
#' @param dtm A document term matrix of class Matrix. Columns index words; rows index documents
#' @param M An integer for the number of words to be used in the calculation. Defaults to 5
#' @param pct Logical: Should the percent calculation be used? Defaults to FALSE (recommended)
#' @export
#' @examples
#' ProbCoherence(topic = phi[ 1 , ], dtm = mydtm, M = 6, pct = FALSE)

ProbCoherence <- function( topic, dtm, M=5, pct=FALSE){

## TODO: consider changing probability calculations from document frequency to term frequency
    
  require(Matrix)
  
  # ordered vector of most probable M terms given a topic
  terms <- names(topic)[ order(topic, decreasing=TRUE ) ][ 1:M ]
  
  # sparse subset of dtm for terms, columns ordered by decreasing probability
  dtm.t <- dtm[ , terms ]
  dtm.t[ dtm.t > 0 ] <- 1
  count.mat <- Matrix::t(dtm.t) %*% dtm.t
  
  num.docs <- nrow(dtm)
  
  p.mat <- count.mat / num.docs
  
  
  result <- sapply( 1:(ncol(count.mat) - 1), function(x){
    if(! pct){
        mean(p.mat[ x, (x + 1):ncol(p.mat) ]/p.mat[ x , x ] - Matrix::diag(p.mat)[ (x + 1):ncol(p.mat) ], na.rm=TRUE)
    }else{
        mean( (p.mat[ x, (x + 1):ncol(p.mat) ]/p.mat[ x , x ] - Matrix::diag(p.mat)[ (x + 1):ncol(p.mat) ])/Matrix::diag(p.mat)[ (x + 1):ncol(p.mat) ], na.rm=TRUE ) * 100
    }
    
  })
  
  return( mean(result, na.rm=TRUE) )
}
