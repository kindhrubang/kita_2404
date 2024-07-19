import os
# 현재 파일의 절대 경로를 기반으로 basedir 변수를 설정, 이 변수는 프로젝트의 기본 디렉터리를 나타낸다.
# os.path.abspath(pat) : 주어진 경로 path의 절대 경로를 반환
# __file__의 디렉토리 부분만을 추출.
basedir = os.path.abspath(os.path.dirname('D:\kdt_240424\m4_웹 애플리케이션\TodoList_10'))
# flask configuration
# 세션 데이터 암호화, CSRF 보호 등을 위해 사용

class Config:
    SECRET_KEY = '099a14a72d1e92059d9cec8daeadf001b118d9ef2a58751a'
    SQLALCHEMY_DATABASE_URI = "mysql://kita:kita@localhost:3306/kita_db"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    UPLOADED_FILES_DEST = os.path.join(basedir, "uploads")


# Uploads configuration
# 파일 업로드 시 저장할 기본 경로를 설정