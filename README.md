🧩 Proyecto - Cloud SQL con Réplicas y MERGE  
Este repositorio documenta la práctica de laboratorio realizada por estudiantes de la Universidad Técnica de Ambato, enfocada en la configuración de una instancia de Cloud SQL con alta disponibilidad y réplicas de lectura, además de la implementación de procesos de sincronización de datos mediante la instrucción MERGE en PostgreSQL.  

👨‍💻 Participantes  
- Carlos Sebastián Cholota Guamán  
- Diego Abraham Mazabanda Pilamunga  
- Kevin Alexander Tixilema Puaquiza  
- Danilo Alexander Tubon Chipantiza  

🎯 Objetivos  
- Configurar una instancia de Cloud SQL con Multi-AZ y réplicas de lectura.  
- Implementar procesos de sincronización de pacientes y consultas mediante MERGE.  
- Verificar la integridad y consistencia de los datos integrados desde tablas staging.  

🛠️ Requisitos  
- Google Cloud Platform (Cloud SQL - PostgreSQL 14)  
- pgAdmin 4 o cliente SQL compatible  
- Conexión segura con SSL habilitado  
- Tablas locales: paciente, consulta, paciente_staging, consulta_staging  

📂 Estructura del repositorio  
- 01_creacion_bd.sql: Crea las tablas principales y de staging.  
- 02_configuracion_cloudsql.md: Documenta la configuración de la instancia y réplicas de lectura.  
- 03_merge_pacientes.sql: Sincroniza datos de pacientes desde staging hacia la tabla principal.  
- 04_merge_consultas.sql: Sincroniza datos de consultas con validación de médicos y pacientes.  
- 05_verificacion.sql: Verifica los cambios aplicados y genera reportes de auditoría.  

📌 Notas  
- Las réplicas de lectura son de solo lectura y se utilizan para consultas pesadas.  
- Los procesos MERGE garantizan integridad referencial y evitan duplicaciones.  
- Se recomienda no modificar directamente las tablas staging, ya que son de uso temporal para integración.
