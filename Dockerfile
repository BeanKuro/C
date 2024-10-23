FROM python:3.9 

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 시스템 패키지 업데이트 및 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    ffmpeg && \
    pip install --no-cache-dir PyNaCl  # ffmpeg 설치

# 요구 사항 파일 복사
COPY requirements.txt ./

# 요구 사항 설치
RUN pip install --no-cache-dir -r requirements.txt

# 애플리케이션 파일 복사
COPY . .

# 컨테이너 시작 시 실행될 명령어
CMD ["python", "ChulBot.py"]
