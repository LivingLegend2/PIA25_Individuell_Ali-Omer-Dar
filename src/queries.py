from database import get_session
from models import Product, Brand, Customer, Order, OrderItem, Review
from sqlalchemy import func

def get_all_products():
    """Returns all products sorted by name."""
    session = get_session()
    result = session.query(Product).order_by(Product.name).all()
    session.close()
    return result

def get_products_by_brand(brand_name):
    """Returns all products for a given brand name."""
    session = get_session()
    result = session.query(Product).join(Brand).filter(Brand.name == brand_name).all()
    session.close()
    return result

def get_customer_orders(customer_id):
    """Returns all orders for a customer."""
    session = get_session()
    result = session.query(Order).filter(Order.customer_id == customer_id).all()
    session.close()
    return result

def get_pending_orders():
    """Returns all orders with status 'pending'."""
    session = get_session()
    result = session.query(Order).filter(Order.status == 'pending').all()
    session.close()
    return result

def get_products_costing_more_than(min_price):
    """Returns products costing more than min_price."""
    session = get_session()
    result = session.query(Product).filter(Product.price > min_price).all()
    session.close()
    return result

def get_orders_from_year(year):
    """Returns all orders from a specific year."""
    session = get_session()
    result = session.query(Order).filter(func.extract('year', Order.order_date) == year).all()
    session.close()
    return result

def get_products_with_brand_name():
    """Shows all products with their brand's name."""
    session = get_session()
    result = session.query(Product, Brand.name).join(Brand).all()
    session.close()
    return result

def get_orders_with_customer():
    """Shows each order with customer name and total amount."""
    session = get_session()
    result = session.query(Order, Customer.first_name, Customer.last_name).join(Customer).all()
    session.close()
    return result

def get_customer_purchased_products(customer_id):
    """Shows all products a customer has purchased with quantities."""
    session = get_session()
    result = (session.query(Product.name, OrderItem.quantity, OrderItem.unit_price)
              .join(OrderItem, Product.id == OrderItem.product_id)
              .join(Order, OrderItem.order_id == Order.id)
              .filter(Order.customer_id == customer_id)
              .all())
    session.close()
    return result

def get_products_per_brand():
    """Counts products per brand."""
    session = get_session()
    result = session.query(Brand.name, func.count(Product.id)).join(Product).group_by(Brand.name).all()
    session.close()
    return result

def get_customer_total_spent():
    """Finds customers who have spent the most."""
    session = get_session()
    result = (session.query(Customer.id, Customer.first_name, Customer.last_name, func.sum(Order.total_amount))
              .join(Order)
              .group_by(Customer.id, Customer.first_name, Customer.last_name)
              .order_by(func.sum(Order.total_amount).desc())
              .all())
    session.close()
    return result

def get_products_avg_rating():
    """Shows products with their average rating and review count."""
    session = get_session()
    result = (session.query(Product.name, func.round(func.avg(Review.rating), 2), func.count(Review.id))
              .outerjoin(Review, Product.id == Review.product_id)
              .group_by(Product.name, Product.id)
              .order_by(func.avg(Review.rating).desc())
              .all())
    session.close()
    return result