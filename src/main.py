# Import all query functions from queries.py
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
    """Displays product information in a readable format."""
    for product in products:
        print(f"  [{product.id}] {product.name} ({product.category}) - {product.price} kr")

def print_orders(orders):
    """Displays order information in a readable format."""
    for order in orders:
        print(f"  Order #{order.id}: {order.order_date} - {order.total_amount} kr ({order.status})")

def print_data_rows(items):
    """Displays aggregated data results in a readable format."""
    for item in items:
        print(f"  {', '.join([str(i) for i in item])}")

def main():
    """Runs all database queries and displays results."""
    # Query 1: All products sorted alphabetically by name
    print("\n" + "="*60)
    print("ALL PRODUCTS SORTED BY NAME")
    print("="*60)
    all_products = get_all_products()
    print_products(all_products)

    # Query 2: Products above price threshold
    print("\n" + "="*60)
    print("ALL PRODUCTS COSTING MORE THAN 5000 KR")
    print("="*60)
    expensive_products = get_products_costing_more_than(5000)
    print_products(expensive_products)

    # Query 3: Filter orders by year
    print("\n" + "="*60)
    print("ALL ORDERS FROM YEAR 2024")
    print("="*60)
    orders_2024 = get_orders_from_year(2024)
    print_orders(orders_2024)

    # Query 4: Filter orders by status
    print("\n" + "="*60)
    print("ALL PENDING ORDERS")
    print("="*60)
    pending_orders = get_pending_orders()
    print_orders(pending_orders)

    # Query 5: JOIN products with brands
    print("\n" + "="*60)
    print("PRODUCTS WITH THEIR BRAND NAME")
    print("="*60)
    products_with_brand = get_products_with_brand_name()
    for product, brand_name in products_with_brand:
        print(f"  [{product.id}] {product.name} by {brand_name} - {product.price} kr")

    # Query 6: JOIN orders with customers
    print("\n" + "="*60)
    print("ORDERS WITH CUSTOMER NAME AND TOTAL AMOUNT")
    print("="*60)
    orders_with_customer = get_orders_with_customer()
    for order, first_name, last_name in orders_with_customer:
        print(f"  Order #{order.id}: {first_name} {last_name} - {order.total_amount} kr ({order.status})")

    # Query 7: Filter products by specific brand
    print("\n" + "="*60)
    print("PRODUCTS BY BRAND 'APPLE'")
    print("="*60)
    apple_products = get_products_by_brand("Apple")
    print_products(apple_products)

    # Query 8: Get orders for specific customer
    print("\n" + "="*60)
    print("ORDERS FOR CUSTOMER ID 1")
    print("="*60)
    customer_orders = get_customer_orders(1)
    print_orders(customer_orders)

    # Query 9: Customer purchase history with quantities
    print("\n" + "="*60)
    print("PRODUCTS CUSTOMER 1 HAS PURCHASED")
    print("="*60)
    customer_purchases = get_customer_purchased_products(1)
    for product_name, quantity, unit_price in customer_purchases:
        print(f"  {product_name}: {quantity} x {unit_price} kr")

    # Query 10: Aggregation - COUNT products by brand
    print("\n" + "="*60)
    print("NUMBER OF PRODUCTS PER BRAND")
    print("="*60)
    products_per_brand = get_products_per_brand()
    print_data_rows(products_per_brand)

    # Query 11: Aggregation - SUM customer spending
    print("\n" + "="*60)
    print("CUSTOMERS WHO HAVE SPENT THE MOST")
    print("="*60)
    customer_spent = get_customer_total_spent()
    print_data_rows(customer_spent)

    # Query 12: Aggregation - AVG product ratings
    print("\n" + "="*60)
    print("PRODUCTS WITH AVERAGE RATING AND REVIEW COUNT")
    print("="*60)
    products_avg_rating = get_products_avg_rating()
    print_data_rows(products_avg_rating)

# Run main function when script is executed directly
if __name__ == "__main__":
    main()