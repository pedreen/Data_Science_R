# Limpando dados - Base de Créditos

# Fazendo a leitura da base de dados
base <- read.csv('credit-data.csv')

# Retirando a coluna clienteid do data frame
base$clientid <- NULL

# Valores inconsistentes
base$age <- ifelse(base$age < 0, 40.92, base$age) # Subistitui por 40,92 que é a média


# Valores faltantes
base$age <- ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

# Escalonamento
base[, 1:3] <- scale(base[,1:3]) # Faz o escalonamento entre as 3 primeiras colunas para não ter problema de peso na hora de rodar o código


# Instalar o pacote caTools install.packages("caTools")
library(caTools)

# Divisão entre treinamento e teste

# Porção da base de dados para fazer a divisão, gerando números aleatórios
set.seed(1)

# Cria a variável divisão para poder fazer a previsão na coluna default
divisao <- sample.split(base$default, SplitRatio = 0.75) # Como a base hitórica possui 200 registros, 1500 registros serão usados para o algorítmo aprender e 500 para teste
base_treinamento <- subset(base, divisao == TRUE) # Cria na base_treinamento um subconjunto da base que é a original onde divisao for igual a TRUE
base_teste <- subset(base, divisao == FALSE) # Cria na base_teste um subconjunto da base que é a original onde divisao for igual a FALSE

# ZeroR 
table(base_teste$default)

# Técnicas de escalonamento dos dados ----
    # Padronização (Standardsation)
    # x = x - médria(x) / desvio padrão (x)
    # 
    # Normalização (Normalization)
    # 
    # x = x - mínimo(x) / máximo(x) - mínimo(x)
    # 
    # Obs : Para ter dados mais precisos é aconcelhavel utilizar o método de padronização

