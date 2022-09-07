require(pacman)
p_load(rio, # función import/export: permite leer/escribir archivos desde diferentes formatos. 
       skimr, # funcion skim: describe un conjunto de datos
       janitor, # función tabyl: frecuencias relativas
       dplyr) # contiene conjuntos de datos.
#importar datos

data_csv = import(file="input/datos_censo.csv" , skip=6 , encoding="UTF-8") 

data_xls = import(file="input/datos_excel.xlsx" , skip=9)

# Exportar 

export(x=data_csv, file="output/data_csv.csv")
export(x=data_xls , file="output/data_excel.xlsx")
export(x=data_xls , file="output/data_r.rds")
# cambiar formato 
convert(in_file = "input/datos_censo.csv" , out_file="output/datos_censo.xlsx")

#Explorar bases de datos 
data(package="dplyr")
##
db = as_tibble(x = starwars)
head(x = db , n = 5) ## pinta sobre la consola las primeras 5 observaciones de "db"
skim(data = db)

#Renombrar variables
db = rename(.data = db , weigth=mass , height_cm=height)
colnames(db)
colnames(db)[9]="genero"
select_all(.tbl=db , toupper) 
db = rename(.data = db , MASS=WEIGTH)
data_csv2=clean_names(data_csv)
