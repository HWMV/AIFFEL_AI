# server_fastapi_vgg16.py
import uvicorn   # pip install uvicorn 
from fastapi import FastAPI   # pip install fastapi 
from fastapi.middleware.cors import CORSMiddleware # 추가된부분 cors 문제 해결을 위한

# 예측 모듈 가져오기
import mobilenetv2_prediction_model

# Create the FastAPI application
app = FastAPI()

# cors 이슈
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# A simple example of a GET request
@app.get("/")
async def read_root():
    print("url was requested")
    return "MobileNet2 모델을 사용하는 API를 만들업 봅시다."

@app.get('/sample')
async def sample_prediction():
    result = await mobilenetv2_prediction_model.prediction_model()
    print("prediction was requested and done")
    return result

# 새로운 엔드포인트: 예측된 클래스 반환
# 모바일넷 모델이 비동기 함수가 아니라서 await 삭제!!!
@app.get("/predict/class")
async def predict_class():
    result = mobilenetv2_prediction_model.prediction_model()
    return {"class": result["predicted_class"]}

# 새로운 엔드포인트: 예측 확률 반환
@app.get("/predict/probability")
async def predict_probability():
    result = mobilenetv2_prediction_model.prediction_model()
    return {"probability": result["confidence"]}

# Run the server
if __name__ == "__main__":
    uvicorn.run("server_fastapi:app",
            reload= True,   # Reload the server when code changes
            host="127.0.0.1",   # Listen on localhost 
            port=8004,   # Listen on port 8001부터 시작..
            log_level="info"   # Log level
            )