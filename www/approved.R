approved_pkgs <- list(base  ="library",
                      dplyr = "%>%" ,
                      dplyr = "group_by",
                      dplyr = "summarize",
                      base  = "mean",
                      tidyr = "pivot_wider",
                      admiral = "convert_blanks_to_na",
                      admiral = "derive_var_trtsdtm",
                      admiral = "derive_var_trtedtm",
                      admiral =  "derive_vars_dtm_to_dt",
                      admiral =  "derive_var_trtdurd",
                      admiral = "derive_var_disposition_dt",
                      admiral = "derive_var_disposition_status",
                      admiral = "derive_vars_dt",
                      admiral = "derive_vars_duration",
                      admiral = "lstalvdt_source",
                      admiral = "derive_var_lstalvdt")

build_approved <- function(.x, .y){

  all <- tibble::tibble(function_name = getNamespaceExports(.x),
                        library = paste0("package:", .x))
  if (.y[1] %in% c("All", "all")){
    all
  } else{
    all[all$function_name %in% .y,]
  }

}
approved <- purrr::map2_df(names(approved_pkgs), approved_pkgs, build_approved)
approved

dir <- getwd()

saveRDS(approved, file.path(dir, "approved.rds"))

