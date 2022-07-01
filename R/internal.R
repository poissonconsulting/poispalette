make_palette_subsetter <- function (pal) {
  function(n) {
    if(n > length(pal)) err(n, " colours needed, but only ", length(pal), " in chosen colour palette.")
    pal[1:n]
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
