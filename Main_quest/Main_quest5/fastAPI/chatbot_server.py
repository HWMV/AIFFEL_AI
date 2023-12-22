import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import pickle
from pydantic import BaseModel
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity

# 챗봇 모델 로드
with open('/Users/hyunwoo/Desktop/dev/Chatbot/fastAPI/chatbot_model.pkl', 'rb') as file:
    model = pickle.load(file)

# 데이터셋 로드 (경로 변경 필요)
df = pd.read_csv('/Users/hyunwoo/Desktop/dev/Chatbot/fastAPI/wellness_dataset.csv', encoding='utf-8')

# FastAPI 애플리케이션 생성
app = FastAPI()

# 서버 응답이 JSON으로 잘 반환하는지 확인
# class ChatResponse(BaseModel):
#     answer: str

# @app.post("/chat/")
# async def chat():
#     response_data = {"answer": "안녕하세요"}
#     return response_data

# CORS 설정
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 사용자 입력을 위한 요청 모델
class UserInput(BaseModel):
    text: str

# 간단한 GET 요청 예시
@app.get("/")
async def read_root():
    return "챗봇 API 서비스입니다."

# 챗봇 응답 생성
@app.post("/chat/")
async def chat(input: UserInput):
    # 사용자 입력 처리
    embedding = model.encode(input.text)
    df['distance'] = df['유저'].apply(lambda x: cosine_similarity([embedding], [model.encode(x)]).squeeze())
    answer = df.loc[df['distance'].idxmax()]
    return {
        "question": answer['유저'],
        "answer": answer['챗봇'],
        "similarity": answer['distance']
    }

# 서버 실행
if __name__ == "__main__":
    uvicorn.run("chatbot_server:app",
                reload=True,
                host="127.0.0.1",
                port=8021,
                log_level="info")