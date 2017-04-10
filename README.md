# Turizem v Evropi

Analiza podatkov s programom R, 2016/17

## Tematika

Za temo mojega projekta sem izbrala turizem v Evropi. S pomočjo podatkov, pridobljenih preko Eurostata, Wikipedije ter drugih spletnih strani bom analiziral turizem glede na:
- nočitve v posameznih državah
- zaposlenost glede na panogo turizma
- starostna sestava zaposljenih v turizmu
- spreminjanje nočitev in zaposlenosti glede na leta
- medsebojni vpliv naštetih dejavnikov v turizmu

## Podatki in izgled

Tabele sem večinoma pridobila z Eurostata v obliki CSV, nekatere tudi s spletnih strani v obliki HTML. Pridobljene podatke nameravam prikazati v obliki tabel, ter za boljšo predstavo tudi na zelmjevidu Evrope. Podatki bodo predstavljeni za vsako državo posebaj v različnih leti, za posamezne države po različnih panogah v letu 2015 ali pa za EU28 po različnih letih za različne panoge. 

## Analiza

Pri analizi podatkov si nameravam ogledati, kako se spreminjajo količine skozi čas v različnih državah Evrope ter kakšna je sestava turizma po panogah v določeni državi.

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
