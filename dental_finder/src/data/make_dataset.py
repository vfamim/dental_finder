# -*- coding: utf-8 -*-
from dotenv import find_dotenv, load_dotenv
from sqlalchemy import create_engine
from pathlib import Path
import pandas as pd
import zipfile
import logging
import re


def extract_data():
    """Runs data processing scripts to turn raw data from (../raw)"""
    raw_data_path = Path().resolve().parents[2] / 'data' / 'raw/'
    with zipfile.ZipFile(raw_data_path / 'Archive+2.zip') as zip_file:
        # removing the macos resources
        file_names = [
            f for f in zip_file.namelist() if not re.match('__MACOSX/', f)
        ]
        data = {}

        for file_name in file_names:
            with zip_file.open(file_name) as csv_file:
                data[file_name] = pd.read_csv(csv_file)

    return data


def ingest_data(user, password, host, port, db):
    eng = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')
    eng.connect()
    table = extract_data()
    for table_name in list(table):
        table[table_name].to_sql(name=table_name, con=eng, if_exists='append')
        logger = logging.getLogger(__name__)
        logger.info(f'making {table_name} set from raw data')


if __name__ == '__main__':
    log_fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    logging.basicConfig(level=logging.INFO, format=log_fmt)

    # find .env automagically by walking up directories until it's found, then
    # load up the .env entries as environment variables
    load_dotenv(find_dotenv())

    ingest_data()
