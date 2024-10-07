# Estudo de Salários na Indústria de Data Science

## Introdução

O projeto visa analisar dados salariais de profissionais de ciência de dados, fornecendo uma visão sobre como os salários variam de acordo com o cargo, experiência e localização. A base de dados inclui informações sobre o título do cargo, ano de trabalho, tipo de emprego, local de trabalho e experiência.

A motivação para essa análise é entender a distribuição dos cargos na ciência de dados e as diferenças salariais entre eles. Identificar cargos representativos e suas faixas salariais oferece insights úteis tanto para profissionais quanto para empresas que buscam contratar talentos.

O estudo foi conduzido explorando os dados com SQL para identificar padrões, e visualizando-os de forma interativa no Power BI, facilitando a comunicação dos insights extraídos dessas ferramentas.

A análise foi realizada em duas etapas principais: a exploração e manipulação dos dados com SQL, e a visualização interativa utilizando o Power BI. O processo começou com a exploração dos cargos mais presentes na base de dados e foi evoluindo conforme os insights surgiam.

## Metodologia

A análise foi dividida em duas partes principais: a exploração e manipulação dos dados com SQL, seguida da visualização interativa utilizando o Power BI. O processo começou explorando os cargos mais frequentes na base de dados e foi evoluindo conforme novos insights surgiam.

Além das consultas principais que orientaram o projeto, outras queries foram realizadas para investigar diferentes aspectos do conjunto de dados, como a distribuição salarial por níveis de experiência, análise por localização e variações salariais. Essas consultas adicionais estão disponíveis na pasta **queries** do repositório para consulta.

1. **Análise Exploratória com SQL**:
   - A exploração dos dados começou com SQL para entender a composição da base e analisar as distribuições salariais. À medida que novas questões surgiam, as consultas SQL evoluíram, permitindo aprofundar a análise. O foco final foi nos 4 cargos mais frequentes, que representavam 75% do total.
   
   - Abaixo estão as principais queries que guiaram essa evolução:

     - **1. Identificação dos cargos mais frequentes**: A primeira query foi voltada para descobrir quais cargos apareciam com mais frequência na base de dados.
       ```sql
       SELECT
         job_title,
         COUNT(*) AS job_count
       FROM
         `BaseSalaries.TbSalaries`
       GROUP BY
         job_title
       ORDER BY
         job_count DESC
       ```
       Essa consulta revelou que 4 cargos principais compunham a maior parte da base.
     
     - **2. Cálculo da porcentagem de cada cargo em relação ao total**: Em seguida, foi calculada a porcentagem que esses cargos representavam no total de registros.
       ```sql
       SELECT
         job_title,
         COUNT(*) AS job_count, 
         (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM `BaseSalaries.TbSalaries`) AS percentage_of_total
       FROM
         `BaseSalaries.TbSalaries`
       GROUP BY
         job_title
       ORDER BY
         job_count DESC
       ```
       Essa consulta mostrou que esses 4 cargos juntos representavam aproximadamente 75% da base.
       
     - **3. Cálculo da média salarial por cargo**: Após identificar os principais cargos, uma consulta foi feita para calcular a média salarial em dólares para cada um deles.
       ```sql
       SELECT
         job_title,
         COUNT(*) AS job_count,
         (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM `BaseSalaries.TbSalaries`) AS percentage_of_total,
         AVG(salary_in_usd) AS average_salary,
       FROM
         `BaseSalaries.TbSalaries`
       GROUP BY
         job_title
       ORDER BY
         job_count DESC
       ```
     
     - **4. Cálculo da mediana salarial por cargo**: Para verificar se havia outliers que pudessem distorcer a média, também foi calculada a mediana dos salários.
       ```sql
       SELECT
         job_title,
         COUNT(*) AS job_count,
         (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM `BaseSalaries.TbSalaries`) AS percentage_of_total,
         AVG(salary_in_usd) AS average_salary,
         APPROX_QUANTILES(salary_in_usd, 100)[OFFSET(50)] AS median_salary
       FROM
         `BaseSalaries.TbSalaries`
       GROUP BY
         job_title
       ```

   - **Decisão de usar a média**: Ao comparar os resultados da média e da mediana, observei que ambos eram bastante próximos para os cargos principais, indicando que não havia grandes outliers que pudessem distorcer a análise. Por isso, optei por usar a média como a principal métrica, já que representava bem a distribuição dos salários.

2. **Visualização com Power BI**:
   - Com os principais insights obtidos via SQL, a próxima etapa foi a visualização dos dados no Power BI. O foco foi criar dashboards interativos que facilitassem a compreensão dos salários dos 4 principais cargos, permitindo visualizar as variações salariais e as tendências ao longo dos anos.
   - O Power BI foi escolhido por sua facilidade em criar gráficos interativos e visuais dinâmicos, tornando a análise acessível e visualmente atraente para aqueles que desejam explorar os dados de forma mais profunda.

A combinação de SQL para análise exploratória e Power BI para visualização interativa permitiu uma abordagem completa, proporcionando tanto rigor técnico na análise dos dados quanto clareza na apresentação dos resultados.

## Análises e Insights

Durante a interpretação dos dados, alguns insights revelaram informações importantes sobre a distribuição dos cargos e os salários no campo de ciência de dados.

1. **Cargos Mais Representativos**: 
   - A análise inicial mostrou que 4 cargos principais representam aproximadamente 75% da base de dados: **Data Scientist, Data Engineer, Data Analyst e Machine Learning Engineer.**
   - Essa concentração sugere uma predominância significativa de certos cargos no mercado de ciência de dados, o que pode refletir uma maior demanda ou especialização nessas funções.

2. **Distribuição Salarial**:
   - A análise da distribuição salarial para os cargos mais frequentes revelou que a média e a mediana dos salários são bastante próximas, o que indica uma distribuição uniforme, sem grandes variações ou outliers.
   - Isso levou à escolha da **média salarial** como a principal métrica de comparação, já que reflete bem a tendência salarial nesses cargos.

Esses insights oferecem uma visão clara sobre como o mercado de ciência de dados está estruturado, com foco em alguns cargos específicos e uma faixa salarial relativamente estável nesses papéis.

## Visualização dos Dados (Power BI)

Para facilitar a compreensão e visualização dos insights obtidos da análise SQL, foi criado um painel no Power BI que reúne diferentes visuais em uma única tela. Abaixo estão os principais gráficos utilizados no painel e suas respectivas funções:

1. **Gráfico de linha (Ano vs Média Salarial)**:
   - Esse gráfico mostra a evolução da média salarial ao longo dos anos, permitindo a identificação de possíveis tendências de crescimento ou estabilização salarial nos cargos analisados.


<img src="imagens/Média Salarial por Ano.png">

   
2. **Gráfico de barras (Cargos vs Média Salarial)**:
   - Exibe a média salarial para os 4 cargos principais, oferecendo uma comparação direta entre as funções mais representativas da base de dados.


<img src="imagens/Média Salarial por Cargo.png">

   
3. **Gráfico de rosca (Modalidade vs Contagem de Cargos)**:
   - Representa a distribuição dos cargos conforme o nível de trabalho remoto, facilitando a compreensão de como a flexibilidade do trabalho remoto se distribui entre os cargos.


<img src="imagens/% Colaborador por  Modalidade de Trabalho.png">


4. **Gráfico de rosca (Tipo de Contrato vs Contagem de Cargos)**:
   - Mostra a distribuição de tipos de emprego (tempo integral, meio período, contrato, etc.) entre os cargos, útil para entender como os diferentes tipos de contratos estão presentes na área de ciência de dados.


<img src="imagens/% Colaborador por Tipo de Contrato.png">


5. **Gráfico de Coluna (País do Colaborador vs Média Salarial)**:
   - Apresenta a distribuição dos salários médios com base na localização dos colaboradores, permitindo identificar possíveis variações salariais entre diferentes regiões.


<img src="imagens/Média Salarial por País do Colaborador.png">


6. **Gráfico de Coluna (País da Empresa vs Média Salarial)**:
   - Apresenta a distribuição dos salários médios com base na localização das empresas, permitindo identificar possíveis variações salariais entre diferentes regiões.


<img src="imagens/Média Salarial por País de Empresa.png">


7. **Gráfico de Coluna (Tamanho da Empresa vs Média Salarial)**:
   - Exibe a média salarial conforme o tamanho da empresa (pequena, média, grande), destacando como o porte da empresa pode influenciar as remunerações.


<img src="imagens/Média Salarial por Tamanho da Empresa.png">


8. **Gráfico de Coluna (Nível de Experiência vs Média Salarial)**:
   - Mostra a média salarial de acordo com os níveis de experiência dos profissionais (Junior, Pleno, Sênior), permitindo uma comparação clara entre como os salários evoluem com a experiência.


<img src="imagens/Média Salarial por Nível de Experiência.png">


Esses gráficos oferecem uma visão ampla dos dados, ajudando a identificar padrões salariais e distribuições de cargos com base em fatores como tipo de emprego, nível de experiência e localização.

#### Link para o Painel
Para interagir com o painel e explorar visualmente os dados, acesse-o através do seguinte link:

https://app.powerbi.com/view?r=eyJrIjoiZDM2MjlmNDYtNjM2Ni00MGFjLWFlOWItMmJjZmVmZTlmMmZlIiwidCI6IjBlZTA4MTNhLWVmNmYtNGEwNy05YmMzLWI3ZDFmZjg5ZmI1ZCJ9

#### Alterações no Power Query:
Durante a preparação dos dados no Power BI, foram feitas transformações no Power Query para melhorar a precisão e a visualização dos gráficos. [Detalhar as mudanças feitas no Power Query]

## Conclusão

A análise dos dados salariais de profissionais da área de ciência de dados revelou insights valiosos sobre a distribuição de cargos e salários. Focando nos 4 principais cargos, que representavam 75% da base, identificou-se uma distribuição salarial equilibrada, com pouca diferença entre a média e a mediana, o que indicou a ausência de outliers significativos.

Além disso, as visualizações interativas no Power BI proporcionaram uma compreensão mais profunda, facilitando comparações salariais por cargo, tipo de emprego, nível de experiência, localização e outros fatores. A escolha pela média salarial como métrica principal foi justificada pela análise da distribuição, e as ferramentas utilizadas no projeto auxiliaram na extração e comunicação dos insights de forma eficaz.

Este estudo pode ser expandido com uma análise mais detalhada por localização geográfica ou nível de experiência, trazendo ainda mais insights sobre o mercado de trabalho em ciência de dados.

## Ferramentas Utilizadas

1. **Google BigQuery**: A base de dados foi hospedada no Google BigQuery, permitindo consultas diretamente na nuvem e usá-lo como fonte de dados no Power Bi para eu me conectar aos dados.

2. **SQL**: Utilizado para a exploração inicial dos dados, identificação de padrões e geração de insights, como a distribuição de cargos e comparação entre média e mediana salarial.
   
3. **Power BI**: Ferramenta utilizada para criar dashboards interativos que facilitaram a visualização e comunicação dos dados e insights obtidos.

4. **Power Query (dentro do Power BI)**: Usado para transformar e preparar os dados antes de criar os visuais, garantindo uma análise precisa e clara. [citar as coisas que eu fiz no power query]


