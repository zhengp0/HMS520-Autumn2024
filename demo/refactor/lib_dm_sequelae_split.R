library("data.table")
library("masked/get_draws.R")


get_dm_prev <- function(
  ...,
  gbd_id_dm_parent = 24632,
  gbd_id_dm_t1 = 24633,
) {
  gbd_id <- list(
    dm_parent = gbd_id_dm_parent,
    dm_t1 = gbd_id_dm_t1
  )
  
  default_get_draws_args <- modifyList(
    list(
      gbd_id_type = "modelable_entity_id",
      random_epi = "epi",
      measure_id = 5,
      gbd_round = 7,
      decomp_step = "iterative"
    ),
    list(...)
  )
  
  draws <- lapply(
    gbd_id,
    function(x) .get_draws(gbd_id = x, default_args = default_get_draws_args)
  )
  
}


.get_draws <- function(..., default_args) {
  args <- modifyList(default_args, list(...))
  setDT(do.call(get_draws, args))
}

.get_under_15_age_group_ids <- function() {
  c(2, 3, 388, 389, 238, 34, 6, 7)
}