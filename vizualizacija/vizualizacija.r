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


#-------------------------------------------------------------------


#prikaz števila gostov na zemljevidu
## poračun prenočitev v državi

tabela2$drzava <- gsub("Germany.*$", "Germany", tabela2$drzava)
evropa$name_sort <- gsub("^Slovak Republic$", "Slovakia", evropa$name_sort) %>% factor()

nocitve <- tabela2 %>% group_by(drzava, leto) %>%
  summarise(noc = sum(stevilo_gostov)) %>%
  group_by(drzava) %>% summarise(noc = mean(noc, na.rm = TRUE))
  
evropa$name_sort <- gsub("^Slovak Republic$", "Slovakia", evropa$name_sort) %>% factor() #zemljevid

#prikaz zemljevida

z <- ggplot() + geom_polygon(data = left_join(evropa, nocitve, by = c("name_sort" = "drzava")),
                             aes(x = long, y = lat, group = group, fill = noc/1e6)) +
  coord_map(xlim = c(-25, 40), ylim = c(32, 72)) +
  guides(fill = guide_colorbar(title = "Nočitve (milijoni)"))


#-------------------------------------------------------------------


#prikaz zaposljenih v turizmu v 10 najbolj obiskanih državah v letih - črtni

g2 = ggplot(tabela3 %>% filter(drzava %in% c("France", "Italy", "Spain", "Germany", "Austria", "United Kingdom", "Netherlands","Croatia","Greece","Poland")) %>% 
<<<<<<< HEAD
              group_by(leto, drzava) %>%
              summarise(zaposleni = sum(stevilo_zaposlenih, na.rm = TRUE)),
=======
              #filter(stevilo_zaposlenih != is.na()) %>%
              group_by(leto, drzava) %>%
              summarise(zaposleni = sum(stevilo_zaposlenih)) %>%
>>>>>>> b2a6b921de71f2edb0b169ec7c744dd136a39b81
           aes(x = leto, y = zaposleni, color = drzava)) + geom_line()


#-------------------------------------------------------------------


#število zaposljenih po starostnih skupinah skozi leta - črtni

g3 = ggplot(tabela3 %>% 
              group_by(leto, starost_delavcev) %>%
              summarise(zaposleni = sum(stevilo_zaposlenih, na.rm = TRUE)),
            aes(x = leto, y = zaposleni, color = starost_delavcev)) + geom_line()


#-------------------------------------------------------------------


# število zaposljenih v evropi v posamezni panogi turizma v letu 2015 - stolpični
g4 = ggplot(tabela3 %>% 
              group_by(drzava, panoga_turizma) %>%
              summarise(zaposleni = sum(stevilo_zaposlenih, na.rm = TRUE))%>%
              group_by(panoga_turizma),
            aes(x = panoga_turizma, y = zaposleni, color = stevilo_zaposlenih)) + geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

    
#-------------------------------------------------------------------


#število nstanitev v različnih območjih po evropi - primerjava domačini in tujci - stolpični