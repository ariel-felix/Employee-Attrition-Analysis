# Análisis Exploratorio de Datos: IBM HR Analytics Employee Attrition & Performance

## Introducción
  La retención de talento es un desafío crucial para las empresas, ya que la salida de empleados puede generar costos elevados e impactar la productividad. Este análisis exploratorio busca identificar patrones y variables asociadas al attrition, es decir, la disminución gradual del número de empleados sin una sustitución inmediata o planificada. Se utilizarán consultas SQL para extraer conocimientos relevantes que ayuden a la gestión de recursos humanos y optimicen el desempeño organizacional.
  
## Fuente de los Datos
El conjunto de datos utilizado en este análisis es IBM HR Analytics Employee Attrition & Performance, disponible en Kaggle. Se puede acceder aqui [Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

  Este dataset es ficticio, creado por científicos de datos de IBM, y contiene información sobre empleados, incluyendo atributos como edad, departamento, satisfacción laboral, salario, tiempo en la empresa, entre otros. La variable Attrition indica si el empleado ha dejado la empresa o no.
  El conjunto de datos está compuesto por 35 columnas y 1470 filas. A continuación, se presentan las descripciones de las variables utilizadas en el análisis:
  
•	Age (Edad): Edad del empleado.

•	Attrition (Rotación): Indica si el empleado dejó la empresa ("Sí" o "No").

•	BusinessTravel (Viaje de Negocios): Tipo de viaje de negocios que realiza frecuentemente el empleado ("Travel_rarely”, “Travel_Frequently”, “Non-Travel”).

•	Department (Departamento): Departamento en el que trabaja el empleado.

•	DistanceFromHome (Distancia desde Casa): Distancia entre la residencia del empleado y el lugar de trabajo.

•	Education (Educación): Nivel educativo del empleado (1 = "Below College", 2 = "College", 3 = "Bachelor", 4 = "Master", 5 = "Doctor").

•	EnvironmentSatisfaction (Satisfacción con el Entorno): Nivel de satisfacción del empleado con su entorno laboral (1 = "Low", 2 = "Medium", 3 = "High", 4 = "Very High").

•	Gender (Género): Género del empleado ("Masculino" o "Femenino").

•	JobInvolvement (Compromiso con el Trabajo): Nivel de compromiso del empleado con su trabajo (1 = “Low", 2 = "Medium", 3 = "High", 4 = "Very High").

•	JobLevel (Nivel de Cargo): Nivel del cargo del empleado (1 a 5, donde 1 es el más bajo).
•	JobRole (Puesto de Trabajo): Cargo que ocupa el empleado.

•	JobSatisfaction (Satisfacción Laboral): Nivel de satisfacción del empleado con su puesto de trabajo (1 = "Low", 2 = "Medium", 3 = "High", 4 = "Very High”).

•	MaritalStatus (Estado Civil): Estado civil del empleado ("Soltero", "Casado" o "Divorciado").

•	MonthlyIncome (Ingreso Mensual): Salario mensual del empleado.

•	OverTime (Horas Extras): Indica si el empleado realiza horas extras ("Sí" o "No").

•	PercentSalaryHike (Aumento Salarial en %): Incremento porcentual en el salario del empleado.

•	RelationshipSatisfaction (Satisfacción con las Relaciones): Nivel de satisfacción del empleado con sus relaciones laborales (1 = "Low", 2 = "Medium", 3 = "High", 4 = "Very High").

•	TrainingTimesLastYear (Número de Capacitaciones en el Último Año): Número de veces que el empleado recibió capacitación en el último año.

•	WorkLifeBalance (Equilibrio Trabajo-Vida Personal): Nivel de equilibrio entre el trabajo y la vida personal del empleado (1 = "Bad", 2 = "Good", 3 = "Better", 4 = "Best").

•	YearsAtCompany (Años en la Empresa): Número de años que el empleado ha trabajado en la empresa actual.

Después de importar los datos a MySQL, iniciaremos el análisis exploratorio para comprender el perfil de los empleados y los factores asociados a la rotación.

## Análisis
En este análisis, estudiaremos los diferentes aspectos del perfil de los empleados y cómo se relacionan con la tasa de attrition.

* Tasa general de attrition

![Total general de attrition. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/1-total-attrition.png)

#### La empresa presenta una tasa de rotación del 16.12%.

### Perfil Demográfico

•	Análisis por género

![Análisis de attrition por género. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/2-attrition-genre.png)

La mayoría de los empleados de la empresa son hombres, con un total de 882 colaboradores, mientras que las mujeres representan 588 empleadas. La tasa de rotación entre los hombres es del 17.01%, mientras que entre las mujeres es del 14.80%. Aunque hay una ligera diferencia, el género por sí solo no parece ser un factor determinante para la salida de empleados. Por lo tanto, es esencial analizar otros aspectos para identificar posibles asociaciones con la rotación.

•	Análisis por edad

Las edades se dividieron en grupos para facilitar la visualización.

![Análisis de attrition por edad. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/3-attrition-age.png)

**El grupo de edad con la mayor tasa de rotación fue el de 18 a 25 años**, lo que indica que la salida de empleados es más alta entre los más jóvenes. Por otro lado, los empleados entre 36 y 55 años presentaron una tasa significativamente menor, lo que sugiere una mayor estabilidad en este grupo. Esta diferencia puede estar asociada con factores como la experiencia profesional, el tiempo de carrera o incluso las prioridades individuales.


•	Análisis por nivel educativo

![Análisis de attrition por nível educativo.Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/4-attrition-educational.png)

Parece haber una relación inversa entre el nivel educativo y la rotación, es decir, a medida que aumenta el nivel de escolaridad, la tasa de salida de los empleados tiende a disminuir. Esto puede indicar que los empleados con mayor formación encuentran más oportunidades de crecimiento y estabilidad dentro de la empresa, reduciendo la necesidad de buscar nuevas oportunidades en el mercado.

•	Análisis por estado civil

![Análisis de attrition por estado civil.Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/5-attrition-marital.png)
 
Los empleados solteros tienen una tasa de rotación más alta (25.53%) en comparación con los divorciados y casados. Este factor puede estar relacionado con la edad, ya que los empleados jóvenes (18-25 años) presentan la mayor tasa de rotación. Los empleados casados o divorciados, al estar en una etapa más estable de la vida, tienden a valorar más la seguridad en el empleo, lo que resulta en una menor tasa de salida. En cambio, los solteros pueden estar más propensos a buscar nuevas oportunidades, experimentar diferentes carreras o aceptar ofertas más atractivas en el mercado.
________________________________________
### Cargo y Departamento

•	Análisis por departamento

 ![Análisis de attrition departamento.Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/6-attrition-department.png)

**El departamento de "Ventas" es el que tiene la mayor tasa de rotación (20.63%).**

•	Análisis por departamento, cargo y salario promedio

![Análisis de attrition departamento.Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/7-attrition-jobrole.png)

El puesto de "Sales Representative" presenta la mayor tasa de rotación y, al analizar el salario promedio de este cargo, observamos que es el más bajo entre todas las funciones, lo que puede estar directamente relacionado con el alto índice de rotación. Además, la elevada salida en este puesto puede contribuir a la alta tasa de rotación del departamento al que pertenece. En contraste, los cargos con salarios más altos presentan una tasa de salida significativamente menor, llegando incluso a 0 en algunos casos.

•	Análisis por nivel de cargo

 ![Análisis de attrition por nível de cargo.Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/8-attrition-joblevel.png)

En este análisis, los cargos se clasificaron del 1 al 5, siendo 1 el nivel más bajo. Observamos que los cargos de nivel 1 presentan la mayor tasa de salida, lo que puede estar asociado con salarios más bajos, un factor relevante en la decisión de permanencia de los empleados. Este patrón refuerza la correlación entre remuneración y rotación, como se observó anteriormente en el puesto de "Sales Representative", que tiene el salario promedio más bajo y registra una de las mayores tasas de salida.
________________________________________
### Equilibrio entre Vida y Trabajo

•	Análisis por horas extra (Overtime)

![Análisis de attrition por horas extra.Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/9-attrition-overtime.png)

**Los empleados que realizan horas extras presentan una tasa de rotación más alta en comparación con los que no las hacen.** Esto puede estar relacionado con un mayor nivel de estrés, una carga de trabajo excesiva o incluso una menor percepción del equilibrio entre la vida profesional y personal. Los empleados que frecuentemente hacen horas extras pueden estar más propensos a buscar nuevas oportunidades que ofrezcan mejores condiciones de trabajo y mayor calidad de vida.

•	Análisis por equilibrio entre vida personal y profesional

![Análisis de attrition por equilibrio entre vida personal y profesional. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/10-attrition-worklife.png)
 
El análisis del equilibrio entre la vida personal y profesional se categorizó para facilitar su visualización. **Observamos que los empleados que calificaron este equilibrio como "MALO" presentan la mayor tasa de rotación, alcanzando un 31.35%.** Este dato sugiere que la insatisfacción con la relación entre el trabajo y la vida personal puede ser un factor relevante en la salida de los empleados, lo que indica la importancia de políticas que promuevan un ambiente laboral más equilibrado y sostenible.

•	Análisis por frecuencia de viajes

![Análisis de attrition por frecuencia de viajes. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/11-attrition-travel.png)

**La tasa de rotación fue significativamente mayor (24.91%) entre los empleados que viajaban frecuentemente por trabajo**, en contraste con una tasa de solo el 8% entre aquellos que no necesitaban viajar. Este dato sugiere que los viajes frecuentes pueden estar asociados con un mayor desgaste profesional y un impacto en la calidad de vida.

•	Análisis por distancia al Trabajo

 ![Análisis de attrition por distancia al trabajo. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/12-attrition-distance.png)

La distancia entre el hogar y el trabajo se dividió en categorías. Como podemos observar, la tasa de rotación está directamente relacionada con la distancia: cuanto mayor es la distancia al trabajo, mayor es la tasa de salida. Los empleados que enfrentan largos desplazamientos pueden sufrir con retrasos, pérdida de calidad de vida, desgaste físico y mental, factores que contribuyen a una mayor insatisfacción y, en consecuencia, a una mayor tasa de rotación.
________________________________________
### Satisfacción y Compromiso

•	Análisis por nivel de satisfacción – Ambiente, Trabajo y Relaciones

![Análisis de attrition por nível de satisfacción. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/13-attrition-satisfaction.png)

El nivel promedio de satisfacción en todas las categorías fue ligeramente menor entre los empleados que dejaron la empresa, lo que puede indicar una relación entre la satisfacción y la tasa de rotación.

•	Análisis por nivel de compromiso

![Análisis de attrition por nível de compromiso. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/14-attrition-jobinvolvement.png)

Los empleados con un mayor nivel de compromiso en el trabajo presentan una menor tasa de rotación. Por otro lado, aquellos con bajo compromiso tienen una tasa significativamente mayor, alcanzando un 33.73%.

•	Análisis por aumento salarial

![Análisis de attrition por nível de compromiso. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/15-attrition-salaryhike.png)

El aumento salarial promedio para el grupo que salió fue del 15.10%, mientras que para el grupo que permaneció fue del 15.23%. La diferencia es mínima, lo que indica que el aumento salarial, por sí solo, puede no ser un factor determinante para la rotación. Otros aspectos, como el ambiente de trabajo, las oportunidades de crecimiento y la calidad de vida, pueden tener un mayor peso en la decisión de salida de los empleados.
________________________________________
### Tiempo en la Empresa y Desarrollo Profesional

•	Análisis por tiempo en la empresa

![Análisis de attrition por tiempo en la empresa. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/16-attrition-companytime.png)
 
**Los empleados con menos tiempo en la empresa (0-1 año) presentan una tasa de rotación del 34.88%**, la más alta entre los grupos analizados. En contraste, aquellos con más de 10 años en la empresa tienen una tasa significativamente menor, de solo 8.13%. Esto puede indicar que la fase inicial en el empleo es un período crítico para la retención de empleados, mientras que una permanencia prolongada puede estar asociada con una mayor estabilidad.

•	Análisis por entrenamientos

![Análisis de attrition por tiempo en la empresa. Fuente: Autor](https://github.com/ariel-felix/Employee-Attrition-Analysis/blob/main/images/17-attrition-training.png)

**El análisis revela que la tasa de rotación fue mayor entre los empleados que no recibieron entrenamientos a lo largo del año**, mientras que aquellos que participaron en 5 o 6 entrenamientos presentaron una tasa de salida menor. Este factor puede estar directamente relacionado con el nivel de compromiso, ya que los empleados con menor compromiso también muestran tasas más altas de rotación. Invertir en entrenamientos puede, por lo tanto, contribuir a la retención de empleados al aumentar su involucramiento y satisfacción en el trabajo.

## Consideraciones Finales

El presente análisis reveló hallazgos importantes sobre los factores que influyen en el attrition de los empleados. A continuación, destacamos los principales insights de este estudio:

•	La empresa tiene una tasa de attrition del 16,12%.

•	Los empleados más jóvenes (18-25 años) presentan una mayor tasa de salida en comparación con los empleados más experimentados.

•	El Departamento de Ventas presenta la mayor tasa de attrition (20,63%), seguido por Recursos Humanos (19,05%). Por otro lado, el departamento de Investigación y Desarrollo tiene la menor tasa (13,84%).

•	Los empleados en niveles iniciales de carrera, con un salario promedio bajo y un menor nivel educativo, muestran las tasas de salida más altas.

•	Entre los 426 empleados que realizaron horas extras, 127 renunciaron, lo que resultó en una tasa de attrition del 30,53%, significativamente superior a la de los empleados que no hicieron horas extras (10,44%).

•	El equilibrio entre la vida profesional y personal es un factor relevante, ya que los empleados que calificaron este equilibrio como "malo" ("Bad") presentaron las tasas de attrition más altas.

•	Los viajes frecuentes de trabajo pueden influir en la decisión de un colaborador de permanecer o dejar la empresa.

•	Los empleados que viven más lejos del lugar de trabajo tienden a presentar tasas de attrition más altas, lo que sugiere un impacto de la distancia en la permanencia.

•	La mayoría de los casos de attrition ocurre entre empleados que llevan menos de un año en la empresa (0-1 año).

•	Los empleados con poca capacitación y menor compromiso con la empresa presentan tasas de attrition más elevadas.

## Estrategias para reducir el attrition

Basándonos en estos insights, se pueden implementar algunas estrategias para reducir el attrition y mejorar la retención de talento:

### 1. Programas de Desarrollo y Crecimiento Profesional
Invertir en capacitaciones y oportunidades de desarrollo continuo para aumentar el compromiso de los empleados y ofrecer un plan de carrera estructurado, especialmente para puestos iniciales y de menor remuneración.

### 2. Mejora del Equilibrio entre Vida Profesional y Personal
Evaluar las políticas de horas extras, garantizando compensaciones justas y reduciéndolas siempre que sea posible. Además, considerar la implementación de modelos de trabajo remoto o híbrido, especialmente para empleados que enfrentan largos desplazamientos diarios.

### 3. Políticas de Retención para Jóvenes Talentos
Además de capacitaciones y planes de carrera, ofrecer beneficios específicos para atraer y retener profesionales más jóvenes, como incentivos educativos, programas de mentoría y oportunidades de crecimiento interno.

### 4. Ajustes en la Gestión de Viajes Corporativos
Revisar la necesidad de los viajes de trabajo, priorizando alternativas como videoconferencias siempre que sea posible. Para los casos en los que los viajes sean indispensables, considerar beneficios o incentivos que hagan esta experiencia menos desgastante para los empleados.

### 5. Revisión de Estructuras Salariales y Beneficios
Evaluar si los salarios de los puestos con alta tasa de salida son competitivos en el mercado y, cuando sea necesario, realizar ajustes. Además, revisar los paquetes de beneficios para hacerlos más atractivos y alineados con las necesidades de los empleados.

### 6. Encuestas de Satisfacción y Clima Organizacional
Implementar encuestas regulares para identificar áreas de mejora y comprender cómo los empleados perciben el ambiente de trabajo, sus funciones y la relación con sus colegas y gerentes. A partir de estos datos, desarrollar estrategias más acertadas para aumentar la satisfacción y reducir la rotación.

## Conclusión
El análisis mostró que factores como el salario, el tiempo en la empresa, el equilibrio entre la vida personal y profesional, y las oportunidades de crecimiento influyen en la tasa de salida de los empleados. Con base en estos insights, la implementación de estrategias enfocadas en la retención puede ayudar a reducir el attrition y crear un entorno más atractivo y estable para los colaboradores.


### Tecnologías Utilizadas

MySQL: Base de datos relacional utilizada para el análisis de datos.

### Contacto
* [Medium](https://medium.com/@arielfelixmv)
  
* [LinkedIn](http://www.linkedin.com/in/ariel-felix)

**Si ha llegado hasta aquí, le agradezco por leer el proyecto.**
