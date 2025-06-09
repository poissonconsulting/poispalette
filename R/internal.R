make_palette_subsetter <- function (pal, ...) {
  function(n) {
    if(n > length(pal)) err(n, " colours needed, but only ", length(pal), " in chosen colour palette.")
    pal[1:n] |> as.vector()
  }
}

vld_hex <- function(x) {
  grepl("^#([A-Fa-f0-9]{6})$", x)
}

chk_hex <- function(x) {
  chk_character(x)
  vld <- vld_hex(x)
  
  if(!all(vld)) err("Ivalid hex codes detected: ", paste(x[!vld], collapse = ", "))
  
  invisible(x)
}

get_formals <- function(fun, negate = NULL) {
  chk::chk_function(fun)
  formals <- fun |> formals(fun) |> names()
  formals[!formals %in% c("scale_name", negate)]

}

assign_dot_args <- function(dot_args_user, function_def, args_negate) {
  chk::chk_list(dot_args_user)
  chk::chk_vector(args_negate)
  
  dot_args <- get_formals(function_def, negate = args_negate)
  dot_args <- dot_args[!dot_args %in% names(dot_args_user)]
  if(is.null(names(dot_args_user))) names(dot_args_user) <- rep("", length(dot_args_user))
  names(dot_args_user)[names(dot_args_user) == ""] <- dot_args[1:sum(names(dot_args_user) == "")]
  
  dot_args_user
}
