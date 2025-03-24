FROM node:alpine

WORKDIR /app

# 의존성 파일 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 소스 코드 복사
COPY ./ ./

# Next.js 빌드 수행
RUN npm run build

# 빌드된 결과물을 /app/out으로 복사
RUN mkdir -p /app/out && cp -r /app/.next/static /app/out/ && cp -r /app/public /app/out/

# dev 서버 시작
CMD npm run dev
