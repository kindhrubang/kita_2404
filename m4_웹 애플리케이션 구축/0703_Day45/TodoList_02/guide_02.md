## TodoList_01 대비 추가한 내용

필드 수

- 기존 코드에서는 Task 모델에 id와 title 필드만 있음.
- 수정된 코드에서는 title, contents, input_date, due_date 필드가 추가되어 있음.

데이터베이스 마이그레이션 - Flask-Migrate를 사용하여 새로운 컬럼을 추가하는 방법
- Flask-Migrate 설치: pip install Flask-Migrate
- Flask-Migrate 초기 설정: Flask-Migrate를 초기화하려면 애플리케이션 파일을 업데이트하여 Migrate 객체를 생성
    ```
    from flask_migrate import Migrate

    app = Flask(__name__)
    app.config['SECRET_KEY'] = ''
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///example.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db = SQLAlchemy(app)
    migrate = Migrate(app, db)
    ```
- 마이그레이션 초기화: flask db init
- 모델 변경 시 마이그레이션
    - 마이그레이션 생성: flask db migrate -m "Add columns to Task"
    - 마이그레이션 적용: flask db upgrade

한국 시간으로 등록일 설정

- 수정된 코드에서는 pytz를 사용하여 input_date를 한국 시간으로 설정함.

CSRF 보호

- 기존 방식은 FlaskForm 객체를 통해 CSRF 토큰을 관리하며, 수정된 방식은 CSRF 토큰을 별도로 템플릿에 전달합니다.
- 두 방식 모두 CSRF 보호를 제공하지만, 수정된 방식은 폼 객체를 사용하지 않는 경우에도 CSRF 토큰을 쉽게 추가할 수 있는 유연성을 제공합니다.

템플릿 수정

- index.html과 edit_task.html 템플릿에 CSRF 토큰을 추가함.
- 작업 목록을 JavaScript로 더 상세히 표시하도록 수정됨.

폼 렌더링과 폼 제출을 각각 다른 라우트에서 처리

- 수정된 코드에서 GET 요청만 처리하도록 변경된 이유는, 폼 제출을 별도의 라우트에서 처리하도록 분리하기 위함일 수 있습니다.
- 이는 코드의 가독성을 높이고, 각 라우트가 하나의 역할만 담당하게 하여 유지보수를 쉽게 하기 위한 방법입니다.

