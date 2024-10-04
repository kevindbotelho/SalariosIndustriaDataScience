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
   
2. **Gráfico de barras (Cargos vs Média Salarial)**:
   - Exibe a média salarial para os 4 cargos principais, oferecendo uma comparação direta entre as funções mais representativas da base de dados.
   
3. **Gráfico de rosca (Modalidade vs Contagem de Cargos)**:
   - Representa a distribuição dos cargos conforme o nível de trabalho remoto (0%, 50% ou 100%), facilitando a compreensão de como a flexibilidade do trabalho remoto se distribui entre os cargos.

4. **Gráfico de rosca (Tipo de Contrato vs Contagem de Cargos)**:
   - Mostra a distribuição de tipos de emprego (tempo integral, meio período, contrato, etc.) entre os cargos, útil para entender como os diferentes tipos de contratos estão presentes na área de ciência de dados.

5. **Gráficos de Coluna**:
   - **Tipo de Contrato vs Média Salarial**: Compara os tipos de emprego e suas respectivas médias salariais.
   - **Local da Empresa vs Média Salarial**: Apresenta a distribuição dos salários médios com base na localização das empresas.
   - **Tamanho da Empresa vs Média Salarial**: Exibe a média salarial conforme o tamanho da empresa (pequena, média, grande).
   - **Nível de Experiência vs Média Salarial**: Mostra a média salarial de acordo com os níveis de experiência (Junior, Pleno, Sênior).

Esses gráficos oferecem uma visão ampla dos dados, ajudando a identificar padrões salariais e distribuições de cargos com base em fatores como tipo de emprego, nível de experiência e localização.

#### Link para o Painel:
Para interagir com o painel e explorar visualmente os dados, acesse-o através do seguinte link:

https://app.powerbi.com/view?r=eyJrIjoiZDM2MjlmNDYtNjM2Ni00MGFjLWFlOWItMmJjZmVmZTlmMmZlIiwidCI6IjBlZTA4MTNhLWVmNmYtNGEwNy05YmMzLWI3ZDFmZjg5ZmI1ZCJ9

#### Alterações no Power Query:
Durante a preparação dos dados no Power BI, foram feitas transformações no Power Query para melhorar a precisão e a visualização dos gráficos. [Detalhar as mudanças feitas no Power Query]

#### Capturas de Tela:
[Adicionar prrints]

