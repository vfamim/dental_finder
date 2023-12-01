from src.data.extract import PostgresConnect
import logging


def ingest_data():
    con = PostgresConnect()
    it_data = con.extract_data()
    print(it_data)
    print(type(it_data))
    con.to_postgres(it_data)


if __name__ == '__main__':
    log_fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    logging.basicConfig(level=logging.INFO, format=log_fmt)
    ingest_data()
