import os
from pymongo import MongoClient
import dotenv
dotenv.load_dotenv()

DB_NAME = os.getenv('DB_NAME')
COLLECTION_NAME = os.getenv('COLLECTION_NAME')

def inserir_link(list_link):
    try:
        client = MongoClient()
        db = client[DB_NAME]

        for iterator in list_link:
            fetch_record = list(db[COLLECTION_NAME].find({"link":iterator}))
            
            if len(fetch_record) == 0:
                db[COLLECTION_NAME].insert_one({"link":iterator})

    except Exception as e:
        return (False, e)
    
    return (True, 'record inserted successfully')