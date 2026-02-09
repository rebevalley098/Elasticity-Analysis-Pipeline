# 🚀 Análisis de Elasticidad de Precios: Pipeline End-to-End

Este proyecto documenta la transición de datos crudos hacia **decisiones estratégicas de negocio**, integrando un flujo de trabajo (pipeline) profesional desde la base de datos hasta la visualización.

---

### 1. 🏗️ Ingeniería de Datos (MySQL)
El éxito del análisis dependió de establecer una base de datos íntegra. El sistema original presentaba obstáculos críticos como **datos huérfanos** y **duplicados** en los códigos de geolocalización.

* **Acción:** Diseñé una **tabla maestra de referencia** basada en la entidad `geolocation`.
* **Resultado:** Logré sanear el modelo, garantizando la **integridad referencial** necesaria para que los cálculos posteriores fueran exactos.

### 2. 🐍 Automatización y Limpieza (Python / Jupyter)
Utilicé Python para manejar el volumen masivo de datos (más de **112,000 registros**), optimizando procesos que superan la capacidad de Excel.

* **Proceso:** Creé un script en **Jupyter Notebook** (`ImportSQL.ipynb`) que conecta directamente a SQL usando `sqlalchemy`.
* **Optimización:** Implementé el parámetro `chunksize=1000` para asegurar una carga de datos fluida y eficiente en la memoria.
* **Valor Obtenido:** Un coeficiente de **-19.57**, que representa la sensibilidad estadística pura tras la limpieza técnica.

### 3. 📊 Dashboard e Insights (Power BI)
Aterricé la estadística en una herramienta de visualización estratégica para la toma de decisiones.

* **Modelado DAX:** Creé una medida de **"Elasticidad Real"** que filtra el ruido estacional.
* **Resultado:** Un valor de **-3.93**, que es la métrica más refinada y cercana a la **realidad operativa** del negocio.

---

### 💡 Conclusión Estratégica
Al comparar las herramientas, la conclusión es contundente:
1. **Excel (-28.71):** Identifica la **volatilidad máxima** debido a picos extremos en datos crudos.
2. **Power BI (-3.93):** Provee el número para **proyecciones financieras reales**.

**Diagnóstico Final:** La categoría es **altamente elástica**. Esto significa que la demanda es extremadamente sensible al precio; cualquier aumento debe ser estratégico y acompañado de promociones para mitigar la caída en el volumen.
