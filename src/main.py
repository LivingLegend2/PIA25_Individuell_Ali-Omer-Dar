from queries import (
    get_all_products,
    get_products_by_brand,
    get_customer_orders,
    get_pending_orders,
    get_products_costing_more_than,
    get_orders_from_year,
    get_products_with_brand_name,
    get_orders_with_customer,
    get_customer_purchased_products,
    get_products_per_brand,
    get_customer_total_spent,
    get_products_avg_rating,
)

def print_products(products):
    """Print details for a list of products."""
    for product in products:
        print(f"{product.id}: {product.name}, Brand ID {product.brand_id}, Category: {product.category}, Price: {product.price} kr")

def print_orders(orders):
    """Print details for a list of orders."""
    for order in orders:
        print(f"Order {order.id}: Customer ID {order.customer_id}, Date: {order.order_date}, Amount: {order.total_amount} kr, Status: {order.status}")

def print_tuple_list(items):
    """Prints tuple-list output (for group/aggregate queries)."""
    for item in items:
        print(", ".join([str(i) for i in item]))

def main():
    print("1. All products sorted by name:")
    all_products = get_all_products()
    print_products(all_products)

    print("\n2. All products costing more than 5000 kr:")
    expensive_products = get_products_costing_more_than(5000)
    print_products(expensive_products)

    print("\n3. All orders from year 2024:")
    orders_2024 = get_orders_from_year(2024)
    print_orders(orders_2024)

    print("\n4. All pending orders:")
    pending_orders = get_pending_orders()
    print_orders(pending_orders)

    print("\n5. Products with their brand name:")
    products_with_brand = get_products_with_brand_name()
    for product, brand_name in products_with_brand:
        print(f"{product.name}, Brand: {brand_name}, Price: {product.price} kr")

    print("\n6. Orders with customer name and total amount:")
    orders_with_customer = get_orders_with_customer()
    for order, first_name, last_name in orders_with_customer:
        print(f"Order {order.id}: {first_name} {last_name}, Amount: {order.total_amount} kr, Status: {order.status}")

    print("\n7. Products by brand 'Apple':")
    apple_products = get_products_by_brand("Apple")
    print_products(apple_products)

    print("\n8. Orders for customer ID 1:")
    customer_orders = get_customer_orders(1)
    print_orders(customer_orders)

    print("\n9. Products customer 1 has purchased:")
    customer_purchases = get_customer_purchased_products(1)
    for product_name, quantity, unit_price in customer_purchases:
        print(f"{product_name}: {quantity} units at {unit_price} kr each")

    print("\n10. Number of products per brand:")
    products_per_brand = get_products_per_brand()
    print_tuple_list(products_per_brand)

    print("\n11. Customers who have spent the most:")
    customer_spent = get_customer_total_spent()
    print_tuple_list(customer_spent)

    print("\n12. Products with average rating and review count:")
    products_avg_rating = get_products_avg_rating()
    print_tuple_list(products_avg_rating)

if __name__ == "__main__":
    main()
