from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Text, Date, Numeric, ForeignKey, TIMESTAMP
from datetime import datetime

Base = declarative_base()

class Brand(Base):
    """Represents a manufacturer (Tillverkare)."""
    __tablename__ = 'brands'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    country = Column(String)
    founded_year = Column(Integer)
    description = Column(Text)
    created_at = Column(TIMESTAMP, default=datetime.now)

class Product(Base):
    """Represents a product (Produkt)."""
    __tablename__ = 'products'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    brand_id = Column(Integer, ForeignKey('brands.id', ondelete='CASCADE'), nullable=False)
    sku = Column(String, unique=True)
    release_year = Column(Integer)
    price = Column(Numeric, nullable=False)
    warranty_months = Column(Integer)
    category = Column(String)
    stock_quantity = Column(Integer)
    created_at = Column(TIMESTAMP, default=datetime.now)

class Customer(Base):
    """Represents a customer (Kund)."""
    __tablename__ = 'customers'
    id = Column(Integer, primary_key=True)
    first_name = Column(String, nullable=False)
    last_name = Column(String, nullable=False)
    email = Column(String, unique=True, nullable=False)
    phone = Column(String)
    city = Column(String)
    registration_date = Column(Date)
    created_at = Column(TIMESTAMP, default=datetime.now)

class Order(Base):
    """Represents an order (Beställning)."""
    __tablename__ = 'orders'
    id = Column(Integer, primary_key=True)
    customer_id = Column(Integer, ForeignKey('customers.id', ondelete='CASCADE'), nullable=False)
    order_date = Column(Date)
    total_amount = Column(Numeric)
    status = Column(String)
    shipping_city = Column(String)
    created_at = Column(TIMESTAMP, default=datetime.now)

class OrderItem(Base):
    """Represents an order row (Beställningsrad)."""
    __tablename__ = 'order_items'
    id = Column(Integer, primary_key=True)
    order_id = Column(Integer, ForeignKey('orders.id', ondelete='CASCADE'), nullable=False)
    product_id = Column(Integer, ForeignKey('products.id', ondelete='CASCADE'), nullable=False)
    quantity = Column(Integer, nullable=False)
    unit_price = Column(Numeric, nullable=False)
    created_at = Column(TIMESTAMP, default=datetime.now)

class Review(Base):
    """Represents a product review (Recension)."""
    __tablename__ = 'reviews'
    id = Column(Integer, primary_key=True)
    product_id = Column(Integer, ForeignKey('products.id', ondelete='CASCADE'), nullable=False)
    customer_id = Column(Integer, ForeignKey('customers.id', ondelete='CASCADE'), nullable=False)
    rating = Column(Integer)
    comment = Column(Text)
    review_date = Column(Date)
    created_at = Column(TIMESTAMP, default=datetime.now)
