# Exerc�cio 3 - Felipe Lira Paiva

install.packages("scales")
install.packages("ggbeeswarm")


library(tidyverse)
library(poliscidata)
library (scales)
library (ggbeeswarm)

# Utilizando o banco world do pacote poliscidata, fa�a um  
# histograma que tamb�m indique a m�dia e um boxplot 
# da vari�vel gini10
# Descreva o que voc� pode observar a partir deles.

      questao1 <- world

    # Histograma:
      
      ggplot (questao1, aes(gini10))+
        geom_histogram()+
        geom_vline(aes(xintercept = mean(gini10, na.rm = T)))
      
    # A m�dia est� por volta do valor 0,40 mas a moda est� mais pr�xima do 0,35 (com 15 casos);
    # N�o existem muitos casos ap�s o 0,60 mas existe um em quase 0,75 (que ser� o outlier do boxplot).
      
    # Boxplot:
      ggplot (questao1, aes(gini10))+
        geom_boxplot()

    # Existe um caso desviante (outlier), representado pelo pontinho preto;
    # H� menos varia��o entre o valor m�nimo e o primeiro quartil
    # em rela��o ao valor m�ximo e o terceiro quartil;
    # A mediana (ou segundo quartil) est� levemente abaixo de 40

            
# Utilizando as fun��es de manipula��o de dados da aula passada,
# fa�a uma tabela que sumarize a media (fun��o mean), 
# mediana (funcao median) e o desvio padr�o (fundao sd) da 
# renda per capta (vari�vel gdppcap08), agrupada por tipo de regime 
# (vari�vel democ).
# Explique a diferen�a entre valores das m�dias e medianas.
# Ilustre com a explica��o com gr�fico de boxplot.
# Os dados corroboram a hip�tese da rela��o entre democracia
# e desempenho economico?


      questao2 <- world

      questao2 %>%
        group_by(democ) %>%
        summarise (media = mean(gdppcap08, na.rm = TRUE),
                   mediana = median(gdppcap08, na.rm = TRUE),
                   desvio_padrao = sd(gdppcap08, na.rm = TRUE))
    # A m�dia significa somar todos os valores e dividir pelo n�mero de casos.
    # No nosso caso: somar todos o pib per capita de uma democracia e divir pelo n de democracias;
    # e o mesmo para as n�o democracias.
    # A mediana, por sua vez, � o valor que divide o n�mero de casos;
    # Ou seja, metade das democracias tem um pibpcap maior 11660 e a outra metade, menor.

      ggplot (questao1, aes(x = democ, y = gdppcap08))+
        geom_boxplot()
    
    # Sim. Ainda que existam outliers (especialmente para n�o democracia),
    # A m�dia dos pa�ses democr�ticos � consideravelmente maior que as do n�o democr�ticos,
    # Inclusive, o boxplot permite algo interessante: a mediana da democracia � aproximadamente
    # o valor do terceiro quartil da n�o democracia. Enquanto o primeiro quartil democr�tico
    # est� pr�ximo da mediana n�o democr�tica.
      
# Carregue o banco states que est� no pacote poliscidata 
# Mantenha apenas as vari�veis obama2012, conpct_m, hs_or_more,
# prcapinc, blkpct10, south, religiosity3, state

    questao3 <- states %>%
      select (obama2012, conpct_m, hs_or_more, prcapinc, blkpct10, south, religiosity3, state)
    
    # Percent mass public Conservative
    
# Carregue o banco nes que est� no pacote poliscidata
# Mantenha apenas as vari�veis obama_vote, ftgr_cons, dem_educ3,
# income5, black, south, relig_imp, sample_state

    questao4 <- nes %>%
      select(obama_vote, ftgr_cons, dem_educ3, income5, black, south, relig_imp, sample_state)

# As vari�veis medem os mesmos conceitos, voto no obama em 2012, 
# conservadorismo, educa��o, renda, cor, norte-sul, 
# religiosidade e estado. A diferen�a � que o nes � um banco de
# dados com surveys individuais e o states � um banco de dados
# com informa��es por estado
#
# Fa�a um gr�fico para cada banco representando o n�vel de
# conservadorismo. Comente as conclus�es que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.
# Para ajudar, voc�s podem ter mais informa��es sobre os bancos
# de dados digitando ?states e ?nes, para ter uma descri��o das
# vari�veis (conpct_m e ftgr_cons)

# Gr�ficos de densidade
    ggplot(questao3, aes(conpct_m))+
      geom_density()
    
    ggplot(questao4, aes(ftgr_cons))+
      geom_density(adjust = 2)
    
      
# Histogramas com curva de densidade e m�dia   
    ggplot (questao3, aes(conpct_m))+
      geom_histogram(aes(y = ..density..),
                     binwidth = 2)+
      geom_density()+
      geom_vline(aes(xintercept = mean(conpct_m, na.rm = T)))
    
    
    ggplot (questao4, aes(ftgr_cons))+
      geom_histogram(aes(y = ..density..),
                     binwidth = 10)+
      geom_density()+
      geom_vline(aes(xintercept = mean(ftgr_cons, na.rm = T)))
    
    
  # N�o entendi se era para fazer algum gr�fico espec�fico,
  # ent�o fui testando e deixei os pq achei melhores; especialmente o histograma.

    
# Qual � o tipo de gr�fico apropriado para descrever a vari�vel
# de voto em obama nos dois bancos de dados?
# Justifique e elabore os gr�ficos
# obama2012 (%) e obama_vote (sim/nao)
  
  # No states, o melhor mesmo seria um mapa com o percentual dentro;
  # mas do que sei fazer, achei o geom_point no livro (achei um pouco + visual que barra)
  # mas ainda assim n�o � t�o agrad�vel aos olhos.
  
    ggplot(questao3, aes(obama2012, state))+
      geom_point()
    
  # Usei isso que encontrei no html. Fiz com estado e ficou igual a de cima.
  # Ent�o coloquei sem estado mesmo. D� pra ver os pontos e a porcentagem aprx de cada,
  # Mas n�o � t�o �til por n�o ter o estado.
    ggplot(questao3, aes(obama2012,"")) +
      geom_beeswarm()
    
  # Vi no grupo que era para fazer s� com uma vari�vel, ent�o fiz tamb�m
  # um gr�fico de barras com o density, j� que o normal fica muito "estranho"
  # por cada porcentagem diferir at� nos decimais.
    
    ggplot(questao3, aes(obama2012))+
      geom_histogram(aes(y = ..density..),
                      binwidth = 10)+
      geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))
        
    
  # No nes, um gr�fico de barras:
    ggplot(questao4, aes(obama_vote))+
      geom_bar()
      

# Crie dois bancos de dados a partir do banco nes, um apenas com
# respondentes negros e outro com n�o-negros. A partir disso, fa�a
# dois gr�ficos com a propor��o de votos no obama.
# O que voc� pode afirmar a partir dos gr�ficos?
# Voc� diria que existe uma rela��o entre voto em Obama e cor?

    ?nes
    bnegros <- nes %>%
      transmute(obama_vote, ftgr_cons, dem_educ3, income5, south, relig_imp, sample_state, black) %>%
      filter(black == "Yes")
            
    ggplot(bnegros, aes(obama_vote, ..count../sum(..count..)))+
      geom_bar()+
      scale_y_continuous(labels = percent)
    
    
    bbrancos <- nes %>%
      transmute(obama_vote, ftgr_cons, dem_educ3, income5, south, relig_imp, sample_state, black) %>%
      filter(black == "No")  

    ggplot(bbrancos, aes(obama_vote, ..count../sum(..count..)))+
      geom_bar()+
      scale_y_continuous(labels = percent)
    
    
  # Com os gr�ficos, podemos afirmar que existe uma rela��o entre
  # votar no Obama e a cor da pele. As pessoas negras votaram, majoritariamente, nele;
  # enquanto os votos das pessoas brancas foi muito mais dividido entre Obama e Romney, 
  # ainda que o Obama tenha tido um pouco mais de votos.
  # Ou seja, se negro, o voto no Obama � muito prov�vel;
  # Se branco, a distribui��o entre os dois cadidatos � mais pr�xima.
      
    
# A partir do banco de dados states, fa�a uma compara��o semelhante.
# Fa�a um gr�fico com as porcentagens de votos em Obama para estados
# que est�o acima da mediana da porcentagem de popula��o negra nos estados,
# e outro gr�fico com as porcentagens de votos em Obama para os estados
# que est�o abaixo da mediana de popula��o negra.
# O que voc� pode afirmar a partir dos gr�ficos?
# Podemos chegar a mesma conclus�o anterior?

      questao5 <- states %>%
        select (obama2012, conpct_m, hs_or_more, prcapinc, blkpct10, 
              south, religiosity3, state)
      
  # Passo 1: descobrir a mediana do percentual de negros (Resposta: 8.25)
      questao5 %>% 
       summarise (mediana = median(blkpct10, na.rm = TRUE))
  
  # Passo 2: gr�fico c/ % de votos em Obama para estados > mediana da pop negra.
      
      questao5A <- questao5 %>%
        select (obama2012, conpct_m, hs_or_more, prcapinc, blkpct10, 
                south, religiosity3, state) %>%
        filter (blkpct10 > 8.25)
      
      #Pontos    
      ggplot (questao5A, aes (obama2012,state))+
        geom_point()
     
       #Histograma
      ggplot(questao5A, aes(obama2012))+
        geom_histogram(aes(y = ..density..),
                           binwidth = 10)+
        geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))
   
  # Passo 3: gr�fico c/ % de votos em Obama para estados < mediana da pop negra.
      
      questao5B <- questao5 %>%
        select (obama2012, conpct_m, hs_or_more, prcapinc, blkpct10, 
                south, religiosity3, state) %>%
        filter (blkpct10 < 8.25)
      
      #Pontos
      ggplot (questao5B, aes (obama2012,state))+
        geom_point()
      
      #Histograma
      ggplot(questao5B, aes(obama2012))+
        geom_histogram(aes(y = ..density..),
                       binwidth = 10)+
        geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))
    

    # A partir do gr�fico, podemos observar algumas coisas interessantes:
    # 1. Os estados abaixo da mediana variam mais (mais colunas; menor densidade);
    # 2. A m�dia, em ambos, est� pr�xima do valor 50;
    # 3. A maioria dos estados do primeiro gr�fico tem uma grande concentra��o
    # nos valores 40, 50 e 60; enquanto que o segundo tamb�m tem 20, 30 (mas tamb�m 70).
    # Eu diria que � mais dif�cil chegar a mesma conclus�o anterior,
    # J� que o gr�fico anterior permite comparar melhor negros e n�o negros, al�m da
    # varia��o do par anterior ser muito mais acentuada.
      
      
# A partir da var�avel X do banco df abaixo
    df <- data.frame(x = cos(seq(-50,50,0.5)))
# Fa�a os tipos de gr�ficos que representem esse tipo de vari�vel
# comentando as diferen�as entre elas e qual seria a mais adequada

    # Densidade (eu acho que esse seria o mais indicado porque
    # foi o que eu achei quando procurei por cosseno)
      ggplot (df, aes(x))+
        geom_density()
  
    # Histograma
      ggplot (df, aes(x))+
        geom_histogram()
      
    # Barra (o pior)
      ggplot (df, aes(x))+
        geom_bar()
      
    # O de barra � o pior, por n�o permitir uma boa visualiza��o dos dados.
    # Tanto o histograma quanto a curva de densidade s�o mais vis�veis que o anterior,
    # mas acredito que a melhor escolha seria a de densidade.
      
      
# responsa as quest�es te�ricas abaixo
      
# 1. Observar a figura 1.2 do livro Fundamentals of Political Research e
# fazer o mesmo esquema para o trabalho final de voc�s.
#      
#   VI (+ Fragmenta��o Partid�ria) ------------------------> VD (+ cargos no executivo)
#
#   VI (+ N�mero Efetivo de Partidos Parlamentares) -------> VD (+ secretarias estaduais)
# 
#      
#
# 2. Qual � a disponibilidade de dados para sua pesquisa? J� existem
# bancos de dados prontos? Voc� tem acesso a eles? Caso a �ltima
# pergunta seja positiva, responda o exer�cio 4 do cap�tulo 5.
#
#       H� dados dispon�vel. Sim, existem. Sim, tenho eles.
# 2a) Describe the data set and the purpose for which it was assembled.
#     O objetivo do banco de dados era disponibilizar informa��es sobre os
#     secret�rios estaduais. Por�m, eu n�o o utilizo para isso. Para mim, �
#     necess�rio apenas o n�mero de secretarias; sem informa��o sobre quem as ocupa.
#
# 2b) What are the time and space dimensions of the data set?
#     Todos os estados do Brasil + DF. de 1995 a 2018.
#     Por�m, alguns estados (4) t�m apenas at� 2014.
#
# Read the details of how one of the variables in which you are interested was
#   coded. Write your answers to the following questions:
# 
# !!! Estou respondendo a 3. aqui tamb�m !!!
# 2c) Does this seem like a reliable method of operationalizing this variable?
#  How might the reliability of this operationalization be improved?
#     Sim, parece-me confi�vel por se basear em dados oficiais (nomea��es) que
#     s�o disponibilizados atrav�s dos di�rios oficiais dos estados.
#     
# 2d) Assess the various elements of the validity for this variable operationalization.
#   How might the validity of this operationalization be improved?
#     A validade tamb�m me parece sem problemas. Entretanto, talvez secretarias
#     n�o sejam a �nica forma de cargo que a teoria fala. Ent�o isso significa que
#     o ideal seria acesso a outros dados (subsecret�rios, por exemplo). Entretanto,
#     n�o me proponho a fazer isso em raz�o de querer trabalhar com 24 estados em 20 anos,
#     ent�o � um trabalho que est� fora da minha capacidade de tempo/recursos.
#
#      
# 3.A partir dos exerc�cios anteriores, escreva sobre a confiabilidade e
#   validade de suas vari�veis.
# 
# 4. Qual seria a forma ideal e mais adequada de operacionalizar suas
#  vari�veis para testar sua hip�tese?
#     Fragmenta��o partid�ria -> NEPP (Laakso e Taagepera, 1979) por ser
#     o mais consagrado e aceito na literatura, al�m de haver dados (TSE)
#     N�mero de cargos no executivo: n�mero de secretarias estaduais.
