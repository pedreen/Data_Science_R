# Lendo base de dados

base <- read.csv('data/risco-credito.csv')

#instalando o pacote e1071 que contem o algoritmo  naive bayes
#install.packages('e1071')

library(e1071)

# Dentro da function naiveBayes o argumento x é o atributo previsor (aceita variáveis categóricas ou numéricas)
# no parametro y o atributo é a classe

# classificador usa o algoritmo naive bbayes para gerar uma tabela de probabilidade das amostras e faz o treinamento
classificador <- naiveBayes(x = base[-5], y = base$risco)
print(classificador)

# historia: boa, divida : alta, garantia : nenhuma, renda: >35
# historia: ruim, divida : alta, garantia : adequada, renda: <15
historia <- c('boa')
divida <- c('alta')
garantias <- c('nenhuma')
renda <- c('acima_35')

# Criando um data frame com as variaveis setadas acima
df <- data.frame(historia, divida, garantias, renda)

# Gera uma previsão sobre os dados referenciados
previsao <- predict(classificador, newdata = df, 'raw')

# printa o resultado da previsão
print(previsao)
