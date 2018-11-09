# Lendo base de dados

base <- read.csv('/home/giovanni/Área de Trabalho/Pedro/Curso R/udemy/Anexos/risco-credito.csv')

#instalando o pacote e1071 que contem o algoritmo  naive bayes
#install.packages('e1071')

library(e1071)

# Dentro da function naiveBayes o argumento x são os atributos previsores (aceitam variáveis categóricas ou numéricas)
# no parametro y o atributo é a classe
classificador <- naiveBayes()