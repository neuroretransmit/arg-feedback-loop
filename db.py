from sqlalchemy import create_engine

import configparser

config = configparser.RawConfigParser()
config.read('conf/db.conf')
db = dict(config.items('db'))


def connect():
    engine = create_engine(f"postgresql+psycopg2://{db['user']}:{db['pass']}@{db['host']}/{db['db']}")
    engine.connect()
    print("Connected to DB:", engine)