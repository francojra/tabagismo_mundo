
# Tabagismo no Mundo ----------------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ---------------------------------------------------------------------------
# Data: 29/08/22 --------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/smoking ------------------------------------------------------------

# Sobre os dados ---------------------------------------------------------------------------------------------------------------------------

#### Fumo de tabaco é um dos principais problemas de saúde no mundo.
#### Milhões de pessoas vivem em condições ruins de saúde devido ao
#### cigarro e pesquisadores estimam que a cada ano cerca de 8 milhões
#### de pessoas morrem precocemente devido ao tabagismo.

#### Tabagismo tem sido o principal problema de saúde por muitas
#### décadas. Por todo o século 20 estima-se que cerca de 100
#### milhões de pessoas morreram prematuramente por causa do tabagismo.
#### Maioria delas em países mais ricos.

#### A porcentagem de fumantes no mundo está reduzindo, e porque 
#### o fumo é uma das principais preocupações de saúde pública,
#### isso é um ponto positivo de desenvolvimento da saúde global.
#### É possíel que agora a população viva por um mais longo período
#### de vida e de forma mais saudável.

# Carregar pacotes necessários -------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(pals)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

tb <- read.csv("daily-smoking-prevalence-bounds.csv")
view(tb)
names(tb)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

tb1 <- tb %>%
  rename(smoking = Daily.smoking.prevalence...both..IHME..GHDx..2012..)
view(tb1)

tb1 <- tb1 %>%
  select(Entity, Year, smoking) 
view(tb1)

tb2 <- tb1 %>%
  filter(Entity %in% c("Canada", "United States", "Mexico",
                       "Brazil", "Venezuela", "Suriname",
                       "Paraguay", "Uruguay", "Argentina",
                       "Chile", "Bolivia", "Nicaragua",
                       "Peru", "Ecuador", "Panama",
                       "Guatemala", "Guyana")) %>%
  group_by(Entity) %>%
  summarise(media = mean(smoking), sd = sd(smoking),
            n = n(), se = sd/sqrt(n)) %>%
  view()

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

ggplot(tb2, aes(x = Entity, y = media, fill = Entity)) +
  geom_col() +
  geom_errorbar(aes(x = Entity, y = media,
                    ymin = media - se, ymax = media + se),
                width = 0.3, size = 0.8) +
  scale_fill_manual(values = as.vector(alphabet(17))) +
  labs(x = "Países", title = "Porcentagem média de pessoas que fumam todos os dias", subtitle = "Ano de 2012",
       y = "") +
  theme_minimal() +
  theme(legend.position = "none")
