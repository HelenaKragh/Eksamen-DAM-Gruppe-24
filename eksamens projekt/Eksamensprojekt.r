#Først laver vi en mappe i vores diretory, der hedder "data"
dir.create("data")
#Vi installerer de nødvendige pakker
install.packages("tidyverse")
install.packages("here")
library(tidyverse)
library(here)
#Vi uploader datasættet 
aarhus_census <- read_csv(here("data", "dataset_clean.csv"))
aarhus_census
install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
install.packages("ggplot2")
library(ggplot2)
#For at få en ekstra kolonne med erhvervskategori
aarhus_data <- aarhus_census %>%
  mutate(Erhvervskategori = case_when(
    erhverv %in% c("Geheime Raadjnde af Woyda", "Arbeyder i litteratur", "provst", "geheimeråd og stiftamtmand", "Baron, kammerherre og amtmand", "Præste enke", "Baronesse", "Bestyrer", "Grevinde og har 400 Rdr i Enke Pension", "Biskop", "Rådmand", "Betjent", "Billeteur", "Branddirektør", "Hendes Mand har fast Tjeneste", "Skolelærer", "Hospitalsforstander", "Cancellirådinde, - lever af det, hun har", "Candedatus Theologies", "Cappelan", "Consumptionsbetjent", "Contoirbetjent", "Degn", "Dommer", "Informator", "Inspecteur", "Enke Degn", "Enke Provstinde", "Etatsraadinde", "Jurist", "Sognepræst", "Kammerherre", "Kammerråd", "Foged", "Kornmåler", "Formuende", "Forpagter", "Landmaaler", "Lever af Formue", "Lever af sin Formue", "Forvalter", "Fuldmægtig", "stiftsphysicus", "stiftsrevisor", "Student", "Lægdsmand", "Læge", "Ved Landvæsenet", "Marqueur", "Told", "toldkasserer", "Organist") ~ "Embedsmænd mm.",
    erhverv%in% c("Apoteker", "Postmester, Kiøb- og Værtshusmusmand, Gæstgiver og prokurator", "Handler", "Brændevinsmand", "Købmand", "Værtshusmand") ~ "Købmænd",
    erhverv %in% c("Gartner", "Baber", "Bager", "Bagerenke", "Glarmester", "Rebslager", "Skoflikker", "Skomager", "Skrædder", "Håndværksmager", "Slagter", "Smed", "Snedker", "Kok", "Mester", "Teglbrænder") ~ "Håndværksmestre",
    erhverv %in% c("Apotekerdreng", "Assistent", "Garver", "Skoleelev", "Giør Stoele", "Gjørtler", "Blegmand", "Blikkenslager", "Bogbinder", "Byens tambour", "Bødker", "Hugger", "I Lære", "Drejer", "Farver", "Favn Brænde Kiøer", "Mahler og Gartner", "Tømrer", "Svend") ~ "Svend eller i Lære",
    erhverv %in% c( "Gadekører", "Hjulmand", "klubvært", "Kromand", "Kudsk", "Forridder", "Vognmand", "Opvarterske for de syge") ~ "Avls-, vogn- og værtsmænd",
    erhverv %in% c("Skipper", "Fiskemester ved grevskabet Frijsenborg", "Fisker", "Lods", "Matros") ~ "Skippere, jægere, fiskere",
    erhverv %in% c("Graver", "Arbejder ved Canalen", "Går med bagerkurven", "Spinder", "Rådstuebud", "Baademand", "Skovridder", "Hyrde", "Høker", "Skærsliber", "Jordemoder", "Examineret Foster Moder", "Kalkslager", "Klokker", "Stadsmusikant", "Krambodsdreng", "Stenkløver og -hugger, beboer et Markhuus, er Landeværnsmand", "Lever af at stampe Vadmel", "Fostermoder", "Stenpikker", "Lever af sit Arbejde", "Faar Løn", "strømpevæver", "Væver", "Vægter", "Volunteur", "Læser for Børn i Byen", "strøekone ved Domkirken", "Vaskekone", "Substitut", "Syerske", "Mejerske", "Tærsker", "Træskomand", "Natmand", "Trykker", "Tobaksspinder", "Nærer sig ved Haandarbejde") ~ "Ufaglært arbejder",
    erhverv %in% c("General Krigs Commisair, Rigs-Greve", "Skytte", "Rytter", "Soldat", "fhv. militærmand med årlig pension", "Overordnet Soldat") ~ "Militært personel",
    erhverv %in% c("Afskediget", "Antagen til opdragelse", "Besvangret", "Enke", "Fattig", "formedels sin solgte gaard", "Ledig", "Lever af sine midler", "Opdrages i huset") ~ "Uden erhverv",
    erhverv %in% c("Rygter paa Gersdorrslund", "Huusholderske", "Stuekone", "Tyende", "Tjener Familie") ~ "Tyende",
    erhverv %in% c("Aftægtsfolk", "Pension", "Frit underholdt", "Logerende", "Understøtter Familiemedlem", "Understøttelse af Private", "Understøttelse af Familie", "nyder Ophold", "nyder Ophold af gaarden") ~ "Aftægtsfolk/pensionerede",
    erhverv %in% c("Proprietair", "Har en Mølle i Fæste", "Boelsmand", "Bonde og Gaardbeboer", "Huusmand", "Huusmand med Jord", "Huusmand og andet Erhverv", "Enke med Jord", "Stamherre", "Møller") ~ "Bonde med jord",
    erhverv %in% c("Daglejer", "Inderste", "Jordløs Huusmand") ~ "Bonde uden jord",
    erhverv %in% c("Hospitalslem", "Vanvittig") ~ "Syge og vanføre",
    erhverv %in% c("Tigger") ~ "Tiggere",
    erhverv %in% c("Nyder Almisse") ~ "Almissemodtager",
    
    famstand%in% c("Tyende") ~ "Tyende",
    grepl("opholds", famstand) ~ "Aftægtsfolk/pensionerede",
    grepl("Opholds", famstand) ~ "Aftægtsfolk/pensionerede",
    
    
    TRUE ~ "Ukendt"
    
  ))
#Vi laver kolonner med koordinater for de forskellige sogne i datasættet
library(ggplot2)
ggplot(aarhus_data,aes(Erhvervskategori))+
  geom_bar(aes(fill = koen))+
  theme(axis.text = element_text(angle = -90))

#Civilstand
ggplot(aarhus_data,aes(Erhvervskategori))+
  geom_bar(aes(fill=civilstand))+
theme(axis.text = element_text(angle = -90))

#Vi isolerer data fra Tyende i egen datasæt
Tyende_data <- filter(aarhus_data,Erhvervskategori=="Tyende")

#Graf over tyendes alder
ggplot(Tyende_data,aes(alder))+
  geom_bar(aes(fill = civilstand))

#Vi gør det samme med andre erhvervsgrupper fx syge og vanføre
Sygeogvanføre_data <- filter(aarhus_data,Erhvervskategori=="Syge og vanføre")

ggplot(Sygeogvanføre_data,aes(alder))+
  geom_bar(aes(fill = civilstand))+
  theme(axis.text = element_text(angle = -90))

#Jeg prøver også med jordløse bønder
Bonde_u_jord <- filter(aarhus_data,Erhvervskategori=="Bonde uden jord")

ggplot(Bonde_u_jord,aes(alder))+
  geom_bar(aes(fill = erhverv))+
theme(axis.text = element_text(angle = -90))

#Tiggere
Tigger_data <- filter(aarhus_data,Erhvervskategori=="Tiggere")
ggplot(Tigger_data,aes(alder))+
  geom_bar(aes(fill = civilstand))

#Almissemodtager
Almissemodtager_data <- filter(aarhus_data,Erhvervskategori=="Almissemodtager")
ggplot(Almissemodtager_data,aes(alder))+
  geom_bar(aes(fill=civilstand))+
  theme(axis.text = element_text(angle = -90))
  

#Aftægtsfolk/pensionerede
Aftægt_data <- filter(aarhus_data,Erhvervskategori=="Aftægtsfolk/pensionerede")
ggplot(Aftægt_data,aes(alder))+
  geom_bar(aes(fill = civilstand))+
  theme(axis.text = element_text(angle = -90))


#Arbejdsløse
Uden_erhverv_data <- filter(aarhus_data,Erhvervskategori=="Uden erhverv")
ggplot(Uden_erhverv_data,aes(alder))+
  geom_bar(aes(fill = civilstand))

#Ufaglært arbejder
Ufaglært_arbejder_data <- filter(aarhus_data,Erhvervskategori=="Ufaglært arbejder")
ggplot(Ufaglært_arbejder_data,aes(alder))+
  geom_bar(aes(fill=civilstand))+
  scale_fill_brewer()


#Svend eller i Lære
Svend_lære_data <- filter(aarhus_data,Erhvervskategori=="Svend eller i Lære")
ggplot(Svend_lære_data,aes(alder))+
  geom_bar(aes(fill = civilstand))

#Vi laver et kort over de forskellige sogne
install.packages("leaflet")
install.packages("googlesheets4")
install.packages("htmlwidgets")
library(leaflet)
library(googlesheets4)
library(htmlwidgets)
install.packages("reader")
library(reader)
library(here)
Koordinater <- readxl::read_excel(here("data","Sogn_koordinater.xlsx"))
aarhus_data_K <- aarhus_data
aarhus_data_K <- left_join(aarhus_data,Koordinater,by="sogn")

test1
