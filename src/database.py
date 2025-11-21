# database.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv
import os

# Loads environment variables from .env
load_dotenv()

# Gets connection info from environment
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_HOST = os.getenv('DB_HOST')
DB_PORT = os.getenv('DB_PORT')
DB_NAME = os.getenv('DB_NAME')

DATABASE_URL = f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

def get_engine():
    """Creates and returns a SQLAlchemy engine for the database."""
    try:
        engine = create_engine(DATABASE_URL)
        return engine
    except Exception as e:
        print("Failed to create engine:", e)
        return None

def get_session():
    """Creates and returns a new SQLAlchemy session."""
    engine = get_engine()
    if engine is None:
        return None
    Session = sessionmaker(bind=engine)
    try:
        session = Session()
        return session
    except Exception as e:
        print("Failed to create session:", e)
        return None