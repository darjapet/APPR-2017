link <- "https://en.wikipedia.org/wiki/World_Tourism_rankings"
stran <- html_session(link) %>% read_html()
tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
  .[[6]] %>% html_table(dec = ".")
summary(tabela)

colnames(tabela) <- c("stevnik", "destinacija", "mednarodni turisti 2015", "mednarodni turisti 2014", "sprememba 2013-2014",
                      "sprememba 2014-2015")
sl <- locale("sl", decimal_mark = ".")
