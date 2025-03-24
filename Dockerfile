FROM node:alpine
WORKDIR /app

# package.json 및 package-lock.json 복사 후 의존성 설치
COPY package*.json ./
RUN npm install

# 모든 소스 코드 복사
COPY ./ ./

# ✅ Next.js 프로젝트 빌드 (이 단계가 중요!)
RUN npm run build

# ✅ 빌드된 결과를 /app/out 디렉토리에 복사
RUN mkdir -p /app/out && cp -r /app/.next/static /app/out/ && cp -r /app/public /app/out/

# 개발 서버 실행
CMD ["npm", "run", "dev"]
