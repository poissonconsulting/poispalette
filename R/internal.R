subset_palette <- function (pal, ...) {
  function(n) {
    if(n > length(pal)) err(n, " colours needed, but only ", length(pal), " in chosen colour palette.")
    as.vector(pal[1:n])
  }
}
