#Trabajando con plots sin instalar librerias
#plot(eje Y, eje X)
#Scatter Plot
plot(orangeec$Creat.Ind...GDP ~ orangeec$Unemployment,
     xlab= "PIB Economía Naranja", ylab= "Desempleo",
     main= "Relación Economía Naranja vs Desempleo")

#Histograma 
#qplot en la version anterior
hist(orangeec$Creat.Ind...GDP,
      geom="histogram",
      xlab="Economia Naranja",
      main="%PIB en Economia Naranja")

#Utilizando libreria ggplot2
ggplot(orangeec, aes(Creat.Ind...GDP))+
  geom_histogram(binwidth = 10)+
  labs(x='% PIB', y='Cantidad de Países',
       title='Inversión del PIB en OE')+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggplot()+geom_histogram(data = orangeec, aes(x=Creat.Ind...GDP),
                      fill="orange", color="blue", binwidth = 10)+
  labs(x='% PIB', y='Cantidad de Países',
       title='Inversión del PIB en OE')+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


ggplot()+geom_histogram(data=orangeec, 
                        aes (x=Internet.penetration...population), fill="purple", color="orange", 
                        binwidth= 5 )+
  scale_x_continuous(breaks = seq(40, max(100), 5))+
  labs(x="Penetración internet (%) de la población", y="Cantidad de paises",
       tittle="Penetración de internet en paises LATAM")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


#Boxplot
boxplot(orangeec$GDP.Growth..,
        ylab="Porcentaje",
        main="Crecimiento del PIB")

ggplot()+geom_boxplot(data = orangeec, aes(x=GDP.Growth.., 
                                           y=Creat.Ind...GDP),
                      fill='orange')+
  labs(x="Porcentaje",
       tittle="Crecimiento del PIB")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


economy <- mean(orangeec$GDP.PC)
economy

orangec <-orangeec %>%
  mutate(Strong_economy = ifelse(GDP.PC < economy,
                                 "Por debajo promedio pib per capita",
                                 "Sobre-Arriba promedio pib per capita"))
ggplot(orangec, aes(x=Strong_economy, y=Creat.Ind...GDP,
                    fill=Strong_economy))+
  geom_boxplot(alpha=0.4)+
  labs(c="Tipo de pais", y="Aporte economia naranja al pib",
       title="Aporte economia naranja en pib paises latam con
        alto y bajo pib per capita")+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


ggplot(orangec, aes(x=Strong_economy, y=Internet.penetration...population,
                    fill=Strong_economy))+
  geom_boxplot(alpha=0.4)+
  labs(c="Tipo de pais", y="Penetracion de internet (%)",
       title="Penetracion de internet latam con alto y bajo pib per capita")+
  theme(legend.position = "none")+{
}kl+  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) 


#Scatter con ggplot
ggplot(orangec, aes(Creat.Ind...GDP, Unemployment))+
  geom_point(aes(color=Country, size=Internet.penetration...population))+
  labs(x="PIB destinado a OE" , y = "Desempleo", title = "Relación PIPOE vs Unemployment")

my_graph <- ggplot(orangeec, aes(x=Education.invest...GDP, y=Unemployment, label=Country))+
  geom_point(aes(color=factor(Strong_economy), size=X..pop.below.poverty.line)) +
  labs(x="Inversion de la Edución PIB %", 
       y="Desempleo %", 
       title="Inversion en Educación y Desempleo según Economía y población por debajo de la linea de pobreza")

p = ggplotly(my_graph)

ggplot(orangeec, aes(Education.invest...GDP,Unemployment))+
  geom_point(aes(color=factor(Strong_economy), size=X..pop.below.poverty.line))+
  labs(x="Inversión en educación % PIB",
       y="Desempleo",
       title="Inversión en Educación y desempleo según economía y población por debajo de la línea de pobreza"
  )