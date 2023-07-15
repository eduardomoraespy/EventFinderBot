import os
from pathlib import Path
import dotenv
dotenv.load_dotenv()


ROOT = Path(os.path.dirname(os.path.abspath(__file__))).parent
USER_LOGIN = os.getenv('EMAIL')
PWD_LOGIN = os.getenv('PWD')
DB_NAME = os.getenv('DB_NAME')
COLLECTION_NAME = os.getenv('COLLECTION_NAME')
