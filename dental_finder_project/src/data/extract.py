# -*- coding: utf-8 -*-
from sqlalchemy import create_engine
from decouple import config
from pathlib import Path
import pandas as pd
import zipfile
import logging
import re


class PostgresConnect:
    def __init__(self) -> None:
        self.__user = config('POSTGRES_USER')
        self.__pwd = config('POSTGRES_PASSWORD')
        self.__db = config('POSTGRES_DB')
        self.__port = config('POSTGRES_PORT')
        self.__host = config('POSTGRES_HOST')

    @staticmethod
    def extract_data() -> dict:
        """Runs data processing scripts to turn raw data from (../raw)"""
        raw_data_path = Path(__file__).absolute().parents[2] / 'data' / 'raw/'
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

    def to_postgres(self, dict_table: dict):
        user = self.__user
        password = self.__pwd
        port = self.__port
        db = self.__db
        host = self.__host
        eng = create_engine(
            f'postgresql://{user}:{password}@{host}:{port}/{db}'
        )
        eng.connect()
        table = dict_table
        for table_name in list(table):
            table[table_name].to_sql(
                name=table_name.split()[0], con=eng, if_exists='append'
            )
            logger = logging.getLogger(__name__)
            logger.info(f'making {table_name} set from raw data')
