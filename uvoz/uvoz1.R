link <- "https://en.wikipedia.org/wiki/World_Tourism_rankings"
stran <- html_session(link) %>% read_html()
tabela1 <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
  .[[6]] %>% html_table(dec = ".")
summary(tabela1)

colnames(tabela1) <- c("stevnik", "destinacija", "mednarodni turisti 2015", "mednarodni turisti 2014", "sprememba 2013-2014",
                      "sprememba 2014-2015")
sl <- locale("sl", decimal_mark = ".")

tabela1$`mednarodni turisti 2015` <- (tabela1$`mednarodni turisti 2015` %>% parse_number()) * 1000000
tabela1$`mednarodni turisti 2014` <- (tabela1$`mednarodni turisti 2014` %>% parse_number()) * 1000000

summary(tabela1)
#View(tabela1)


#=======================================================================================================

                              
tabela2 <- st_nocitev
colnames(tabela2) <- c("leto", "drzava", "domacini/tujci", "vrednost", "vrsta nocitve",
                       "stevilo gostov")

tabela2 <- tabela2[-c(1), ]
tabela2$vrednost <- NULL

summary(tabela2)
#View(tabela2)


#=======================================================================================================


tabela3 <- zaposljenost_v_turizmu
colnames(tabela3) <- c("leto", "drzava", "panoga turizma", "starost delavcev", "vrsta zaposlitve", "tisoc",
                       "stevilo zaposlenih")

tabela3 <- tabela3[-c(1), ]
tabela3$tisoc <- NULL

summary(tabela3)
#View(tabela3)

