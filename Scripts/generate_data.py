import pandas as pd
import random
from faker import Faker

fake = Faker()

# -----------------------
# CUSTOMERS (10K)
# -----------------------
customers = []
for i in range(10000):
    customers.append([
        i,
        fake.name(),
        fake.email(),
        fake.city(),
        fake.country()
    ])

df_customers = pd.DataFrame(customers, columns=[
    "customer_id", "name", "email", "city", "country"
])

df_customers.to_csv("customers.csv", index=False)


# -----------------------
# PRODUCTS (1K)
# -----------------------
products = []
for i in range(1000):
    products.append([
        i,
        fake.word(),
        random.randint(10, 500)
    ])

df_products = pd.DataFrame(products, columns=[
    "product_id", "product_name", "price"
])

df_products.to_csv("products.csv", index=False)


# -----------------------
# ORDERS (100K)
# -----------------------
orders = []
for i in range(100000):
    orders.append([
        i,
        random.randint(0, 9999),   # customer_id
        random.randint(0, 999),    # product_id
        random.randint(1, 5),      # quantity
        fake.date_this_year()
    ])

df_orders = pd.DataFrame(orders, columns=[
    "order_id", "customer_id", "product_id", "quantity", "order_date"
])

df_orders.to_csv("orders.csv", index=False)

print("CSV files generated successfully!")