
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

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

tb <- read.csv("daily-smoking-prevalence-bounds.csv")
view(tb)
names(tb)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

tb1 <- tb %>%
  rename(smoking = Daily.smoking.prevalence...both..IHME..GHDx..2012..)
view(tb1)

