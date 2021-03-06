% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mst_from_trj.R
\name{mst_from_trj}
\alias{mst_from_trj}
\title{Create the minimum spanning tree from time series}
\usage{
mst_from_trj(trj, dump_to_netcdf = FALSE, mode = "fortran",
  distance_method = 5, clu_radius = NULL, clu_hardcut = NULL,
  normalize_d = TRUE, birch_clu = FALSE, min_span_tree = TRUE,
  rootmax_rad = NULL, tree_height = NULL, n_search_attempts = NULL,
  cores = NULL, mute_fortran = FALSE, ...)
}
\arguments{
\item{trj}{Input trajectory (variables on the columns and equal-time spaced snpashots on the row). It must be a \code{matrix} or a \code{data.frame} of numeric.}

\item{dump_to_netcdf}{If \code{FALSE} the netcdf support will be used. The minimum spanning tree will be dumped to file for further analysis.}

\item{mode}{It takes a string in input and can be either "fortran" (highly advised and default) or "R".}

\item{distance_method}{Distance metric between snapshots. This value can be set 1 (dihedral angles) or 5 (root mean square deviation) or 11 (balistic distance).}

\item{clu_radius}{This numeric argument is used in the clustering step in order to make clusters of the same radius at the base level.}

\item{clu_hardcut}{This option is used only with \code{birch_clu=F} and defines the inter-clusters distance threshold.}

\item{normalize_d}{A logical that indicates whether the distances must be normalized or not. Usually used with averaging.}

\item{birch_clu}{A logical that indicates whether the algorithm will use a birch-tree like clustering step (short spanning tree - fast) or it will be generated
using a simple leader clustering algorithm (minimum spanning tree).}

\item{min_span_tree}{This option is used only with \code{birch_clu=F} and defines if the returning adjacency list must be a minimum spanning tree.}

\item{rootmax_rad}{If \code{birch_clu=T} this option defines the maximum radius at the root level of the tree in the advanced clustering algorithm.}

\item{tree_height}{If \code{birch_clu=T} this option defines the height of the tree in the advanced clustering algorithm.}

\item{n_search_attempts}{If \code{birch_clu=T} a number of search attempts must be provided for the minimum spanning tree search.}

\item{cores}{If \code{mode="R"} a complete adjacency matrix can be created in parallel using multiple cores (anyhow slower than "fortran" mode).}

\item{mute_fortran}{If \code{mute_fortran=T} the function will silence the fortran code.}

\item{...}{Various variables not yet documented}
}
\value{
If no netcdf support is available the function will return a list with 3 arguments: node degrees, adjacency list and associated distances.
If netcdf support is activated the function will dump the mst in the file "DUMPLING.nc".
}
\description{
\code{mst_from_trj} creates a minimum spanning tree from a time series (e.g. a trajectory in molecular dynamics) using different distance metrics
     between pairwise snapshots.
}
\details{
For more details, please refer to the main documentation of the original campari software \url{http://campari.sourceforge.net/documentation.html}.
}
\examples{
adjl <- mst_from_trj(trj = matrix(rnorm(1000), nrow = 100, ncol = 10))

adjl <- mst_from_trj(trj = matrix(rnorm(1000),ncol=10,nrow=100),
distance_method = 5, clu_radius = 100, clu_hardcut = 100,
birch_clu = FALSE, mode = "fortran")
adjl <- mst_from_trj(trj = matrix(rnorm(1000),ncol=10,nrow=100),
distance_method = 5, clu_radius = 0.1,
birch_clu = TRUE, mode = "fortran", rootmax_rad = 1.3,
tree_height = 5, n_search_attempts = 50)


}
\seealso{
\code{\link{adjl_from_progindex}}, \code{\link{gen_progindex}}, \code{\link{gen_annotation}}.
}
