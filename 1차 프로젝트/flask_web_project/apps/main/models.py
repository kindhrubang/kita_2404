import pandas as pd
from datetime import datetime
from apps.app import db
import uuid


class Product(db.Model):
    __tablename__ = 'product'
    PID= db.Column(db.Integer, primary_key=True)
    NAME = db.Column(db.String, nullable=False)
    PRICE = db.Column(db.Float, nullable=False)
    PRODUCT_IMAGE = db.Column(db.String, nullable=True)
    LOCATION = db.Column(db.String, nullable=False)
    DELTA_TIME = db.Column(db.String, nullable=True)

    def __repr__(self):
        return f'<Product {self.NAME}>'

    @staticmethod
    def load_csv_to_db(file_path):
        data = pd.read_csv(file_path)
        for index, row in data.iterrows():
            product = Product(
                PID=row['PID'],
                NAME=row['NAME'],
                PRICE=row['PRICE'],
                PRODUCT_IMAGE=row['PRODUCT_IMAGE'] if 'PRODUCT_IMAGE' in row and pd.notna(
                    row['PRODUCT_IMAGE']) else None,
                LOCATION=row['LOCATION'],
                DELTA_TIME=row['DELTA_TIME'] if 'DELTA_TIME' in row and pd.notna(row['DELTA_TIME']) else None
                # 변경: datetime에서 문자열로
            )
            db.session.add(product)
        db.session.commit()

# flask shell 을 이용한 csv 파일 로드
# >>>flask shell
# >>>from apps.app import db
# >>>from apps.main.models import Product
# csv파일경로
# >>>file_path = 'iphone1.csv'
# csv파일을 db에 로드
# >>>Product.load_csv_to_db(file_path)
# 변경사항 커밋
# >>>db.session.commit()
