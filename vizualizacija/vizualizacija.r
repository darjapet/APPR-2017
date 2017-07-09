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

ggplot() + geom_polygon(data = evropa, aes(x = long, y = lat, group = group)) + xlab(".") + ylab(".") + coord_map(xlim = c(-25, 45), ylim = c(32, 72)) 

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

zemljevid <- ggplot() + geom_polygon(data = left_join(evropa, nocitve, by = c("name_sort" = "drzava")),
                             aes(x = long, y = lat, group = group, fill = noc/1e6)) +
  coord_map(xlim = c(-25, 40), ylim = c(32, 72)) +
  guides(fill = guide_colorbar(title = "Nočitve (milijoni)"))


#-------------------------------------------------------------------


#prikaz zaposljenih v turizmu v 10 najbolj obiskanih državah v letih - črtni

slovar2 <- c(
  "France" = "Francija", 
  "Italy" = "Italija", 
  "Spain" = "Španija", 
  "Germany" = "Nemčija", 
  "Austria" = "Avstrija", 
  "United Kingdom" = "Velika Brtanija", 
  "Netherlands" = "Nizozemska",
  "Croatia" = "Hrvaška",
  "Greece" = "Grčija",
  "Poland" = "Poljska",
  "drzava" = "Država"
)

g2 = ggplot(tabela3 %>% filter(drzava %in% c("France", "Italy", "Spain", "Germany", "Austria", "United Kingdom", "Netherlands","Croatia","Greece","Poland")) %>% 
              group_by(leto, drzava) %>%
              summarise(zaposleni = sum(stevilo_zaposlenih, na.rm = TRUE)),
           aes(x = leto, y = zaposleni, color = slovar2[drzava])) + geom_line() +
          guides(color = guide_legend(title = "Država"))


#-------------------------------------------------------------------


#število zaposljenih po starostnih skupinah skozi leta - črtni

slovar3 <- c(
  "From 15 to 24 years" = "15-24 let",
  "From 25 to 34 years" = "25-34 let",
  "From 35 to 44 years" = "35-44 let",
  "From 45 to 54 years" = "45-54 let"
)

g3 = ggplot(tabela3 %>% 
              group_by(leto, starost_delavcev) %>%
              summarise(zaposleni = sum(stevilo_zaposlenih, na.rm = TRUE)),
            aes(x = leto, y = zaposleni, color = slovar3[starost_delavcev])) + geom_line() +
  guides(color = guide_legend(title = "Starost"))



#-------------------------------------------------------------------


# število zaposljenih v evropi v posamezni panogi turizma v letu 2015 - stolpični

slovar4 <- c(
  "Accommodation" = "Nastanitev",
  "Accommodation and food service activities" = "Hrana in nastanitev",
  "Air transport" = "Zračni prevoz",
  "Travel agency, tour operator reservation service and related activities" = "Turistične storitve"
)

g4 = ggplot(tabela3 %>% filter(leto %in% c("2015"))%>%
               group_by(panoga_turizma) %>%
               summarise(zaposleni = sum(stevilo_zaposlenih, na.rm = TRUE)),
             aes(x = slovar4[panoga_turizma], y = zaposleni)) + geom_col() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5))

    
#-------------------------------------------------------------------


#število nstanitev v različnih območjih po evropi - primerjava domačini in tujci - stolpični

slovar5 <- c(
  "Camping grounds, recreational vehicle parks and trailer parks" = "Kampiranje",
  "Holiday and other short-stay accommodation" = "Počitnice",
  "Hotels and similar accommodation" = "Hoteli",
  "Total nights spent by non-residents" = "Tujci",
  "Total nights spent by residents" = "Domačini")

domacini_tujci <- tabela2 %>%
  filter(vrsta_nocitve %in% c("Hotels and similar accommodation", "Holiday and other short-stay accommodation", "Camping grounds, recreational vehicle parks and trailer parks"))%>%
group_by(vrsta_nocitve, domacini_tujci) %>%
  summarise(gosti = sum(stevilo_gostov, na.rm = TRUE))

g5 = ggplot(domacini_tujci, aes(x = slovar5[vrsta_nocitve], y = gosti / 1e9, fill = slovar5[domacini_tujci])) + geom_bar(stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5)) + labs(x="Vrsta nočitve", y="število gostov") + 
  guides(fill = guide_legend(title = "Tip gostov"))
