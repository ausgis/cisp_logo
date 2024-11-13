
``` r
library(showtext)
showtext_auto(enable = TRUE)
font_add("ShineTypewriter", regular = "./ShineTypewriter-lgwzd.ttf")
library(hexSticker)
library(magick)

sticker(
  subplot = "./fig_cisp1.png",
  s_x = 1.005,
  s_y = 0.955,
  s_width = .5,
  s_height = .5,
  package = "Spatial Pattern Correlation",
  p_family = "ShineTypewriter",
  p_size = 6.25,
  p_x = 1.00,
  p_y = 1.65,
  p_color = ggplot2::alpha("#aa3322",1),
  dpi = 300,
  asp = 1,
  h_size = 1.75,
  h_color = ggplot2::alpha("#aa3322",1),
  h_fill = '#f4f1eb',
  white_around_sticker = F,
  url = "https://ausgis.github.io/cisp",
  u_color = ggplot2::alpha("#aa3322",.75),
  u_size = 5.55,
  filename = "cisp_logo.png"
)

image_read('./cisp_logo.png') |> 
  image_resize("240x278")|> 
  image_write('./cisp_logo.png')
```

![](./cisp_logo.png)

**I would like to extend my sincere gratitude to [my
friend](https://github.com/layeyo) for her invaluable assistance in
designing the foundational cisp figure.**
