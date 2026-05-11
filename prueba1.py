import pandas as pd

df = pd.read_csv("ventas.csv")
print(df)
# filtrar ventas mayores a 500
ventas_altas = df[df["total"] > 500]
print(ventas_altas)

# resumen
print("==== RESUMEN DE VENTAS ALTAS ====")
print(f"Total de ventas filtradas: {len(ventas_altas)}")
print(f"Suma total: ${ventas_altas['total'].sum()}")
print(f"Venta mas alta: ${ventas_altas['total'].max()}")
print(f"Categoria más frecuente: {ventas_altas['categoria'].mode()[0]}")
("============================================")
