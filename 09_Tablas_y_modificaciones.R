#Generando tablas, filtrando y seleccionando datos - dplyr-Parte 2

orangeec <- orangeec %>%
  mutate(Crecimiento_GDP = ifelse(GDP.Growth.. >=2.5,
                                  "2.5% o mas",
                                  "menos de 2.5%"))

orangeec <- orangeec %>%
  mutate(Anaranjados=ifelse(Creat.Ind...GDP >= 2.5,
                            "Mas anaranjados",
                            "Menos anaranjados"))

#ranking

orangeec %>%
  arrange(desc(Creat.Ind...GDP))

TopNaranjas <- orangeec %>%
  filter(Country %in% c("Mexico","Panama","Argentina",
                        "Colombia","Brazil"))

TopNaranjas %>%
  arrange(desc(Creat.Ind...GDP))


## Viendo más información con facet wrap - Parte 2

ggplot(TopNaranjas, aes(x=Internet.penetration...population,
                        y=Services...GDP, size=GDP.PC))+
  geom_point()+
  facet_wrap(~Country)


ggplot(TopNaranjas, aes(x=Education.invest...GDP,
                        y=Creat.Ind...GDP, size=Unemployment))+
  geom_point()+
  facet_wrap(~Country)

myColors <- brewer.pal(9,"Reds")

ggplot(TopNaranjas, aes(x=Internet.penetration...population,
                        y=GDP.PC, fill=Creat.Ind...GDP))+
  geom_tile()+
  facet_wrap(~Country)+
  scale_fill_gradientn(colors=myColors)
