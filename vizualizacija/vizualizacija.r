# 3. faza: Vizualizacija podatkov

library(ggplot2)
library(dplyr)
library(readr)
library(tibble)

#-------------------------------------------------------------------

# Uvozimo zemljevid.

evropa <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                          "ne_50m_admin_0_countries", encoding = "UTF-8") %>%
  pretvori.zemljevid() %>% filter(continent == "Europe" | sovereignt %in% c("Turkey", "Cyprus"),
                                  long > -30, sovereignt != "Russia")
 
#prikaz praznega zemljevida

ggplot() + geom_polygon(data = evropa, aes(x = long, y = lat, group = group)) + 
  coord_map(xlim = c(-25, 45), ylim = c(32, 72))




#prikaz števila gostov na zemljevidu

## poračun prenočitev v državi

tabela2$drzava <- gsub("Germany.*$", "Germany", tabela2$drzava)
evropa$name_sort <- gsub("^Slovak Republic$", "Slovakia", evropa$name_sort) %>% factor()

nocitve <- tabela2 %>% group_by(drzava, leto) %>%
  summarise(noc = sum(stevilo_gostov)) %>%
  group_by(drzava) %>% summarise(noc = mean(noc, na.rm = TRUE))
  
evropa$name_sort <- gsub("^Slovak Republic$", "Slovakia", evropa$name_sort) %>% factor() #zemljevid

z <- ggplot() + geom_polygon(data = left_join(evropa, nocitve, by = c("name_sort" = "drzava")),
                             aes(x = long, y = lat, group = group, fill = noc/1e6)) +
  coord_map(xlim = c(-25, 40), ylim = c(32, 72)) +
  guides(fill = guide_colorbar(title = "Nočitve (milijoni)"))


#prikaz zaposljenih v turizmu v Sloveniji v letih





# Izračunamo povprečno velikost družine
povprecja <- druzine %>% group_by(obcina) %>%
  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))
