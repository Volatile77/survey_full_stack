from sqlmodel import text
from backend.database import engine, create_db_and_tables

def reset_db():
    # Ensure tables exist (just in case)
    create_db_and_tables()
    
    with engine.connect() as connection:
        # Disable foreign key checks if necessary (Postgres specific)
        connection.execute(text("TRUNCATE TABLE feedback, whatsappstate RESTART IDENTITY CASCADE;"))
        connection.commit()
        print("Database reset successfully: All data cleared from 'feedback' and 'whatsappstate' tables.")

if __name__ == "__main__":
    reset_db()
