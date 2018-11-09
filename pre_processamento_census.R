# Leitura da base de dados
base <- read.csv('census.csv')

# Apagar a coluna X
base$X <- NULL

# Fazer a mudança de string para numérico, pois alg de machine learning não conseguem aprender comparando strings mas sim valores núméricos

# Trocando Female para 0 e Male para 1
base$sex <- factor(base$sex, levels = c(" Female", " Male"), labels = c(0, 1))
# Verificando se algum dado ficou como NA no dataframe
base[is.na(base$sex)]


# Outras mudanças necessárias para mudança de categoria dos atributos

base$workclass = factor(base$workclass, levels = c(' Federal-gov', ' Local-gov', ' Private', ' Self-emp-inc', ' Self-emp-not-inc', ' State-gov', ' Without-pay'), labels = c(1, 2, 3, 4, 5, 6, 7))
base$education = factor(base$education, levels = c(' 10th', ' 11th', ' 12th', ' 1st-4th', ' 5th-6th', ' 7th-8th', ' 9th', ' Assoc-acdm', ' Assoc-voc', ' Bachelors', ' Doctorate', ' HS-grad', ' Masters', ' Preschool', ' Prof-school', ' Some-college'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16))
base$marital.status = factor(base$marital.status, levels = c(' Divorced', ' Married-AF-spouse', ' Married-civ-spouse', ' Married-spouse-absent', ' Never-married', ' Separated', ' Widowed'), labels = c(1, 2, 3, 4, 5, 6, 7))
base$occupation = factor(base$occupation, levels = c(' Adm-clerical', ' Armed-Forces', ' Craft-repair', ' Exec-managerial', ' Farming-fishing', ' Handlers-cleaners', ' Machine-op-inspct', ' Other-service', ' Priv-house-serv', ' Prof-specialty', ' Protective-serv', ' Sales', ' Tech-support', ' Transport-moving'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14))
base$relationship = factor(base$relationship, levels = c(' Husband', ' Not-in-family', ' Other-relative', ' Own-child', ' Unmarried', ' Wife'), labels = c(1, 2, 3, 4, 5, 6))
base$race = factor(base$race, levels = c(' Amer-Indian-Eskimo', ' Asian-Pac-Islander', ' Black', ' Other', ' White'), labels = c(1, 2, 3, 4, 5))
base$native.country = factor(base$native.country, levels = c(' Cambodia', ' Canada', ' China', ' Columbia', ' Cuba', ' Dominican-Republic', ' Ecuador', ' El-Salvador', ' England', ' France', ' Germany', ' Greece', ' Guatemala', ' Haiti', ' Holand-Netherlands', ' Honduras', ' Hong', ' Hungary', ' India', ' Iran', ' Ireland', ' Italy', ' Jamaica', ' Japan', ' Laos', ' Mexico', ' Nicaragua', ' Outlying-US(Guam-USVI-etc)', ' Peru', ' Philippines', ' Poland', ' Portugal', ' Puerto-Rico', ' Scotland', ' South', ' Taiwan', ' Thailand', ' Trinadad&Tobago', ' United-States', ' Vietnam', ' Yugoslavia'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41))
base$income = factor(base$income, levels = c(' <=50K', ' >50K'), labels = c(0, 1))


# Agora fazendo o escalonamento de atributos numéricos
# É necessário ir fazendo o escalonamento das colunas numéricas, as que foram transformadas anteriormente são categóricas
# Assim as que eram categóricas não vão conseguir serem escalonadas 
# OBS: caso queira escalonar as colunas categóricas basta fazer base[ , numero da coluna escolhida] <- scale(as.numeric(base[ , numero da coluna escolhida]))
base[,1] <- scale(base[, 1])
base[,3] <- scale(base[, 3])
base[,5] <- scale(base[, 5])
base[,11:13] <- scale(base[, 11:13])

# Instalar o pacote caTools install.packages("caTools")
library(caTools)

# Porção da base de dados para fazer a divisão, gerando números aleatórios
set.seed(1)
# Cria a variável divisão para poder fazer a previsão na coluna default
divisao <- sample.split(base$income, SplitRatio = 0.85) # 1500 registros serão usados para o algorítmo aprender e 500 para teste
base_treinamento <- subset(base, divisao == TRUE) # Cria na base_treinamento um subconjunto da base que é a original onde divisao for igual a TRUE
base_teste <- subset(base, divisao == FALSE) # Cria na base_teste um subconjunto da base que é a original onde diviao dor igual a FALSE

