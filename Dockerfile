FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./session .

# 개발 환경 전용. 배포할때는 compose에서 cmd override 해서 사용
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]