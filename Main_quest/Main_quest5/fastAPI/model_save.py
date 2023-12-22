from sentence_transformers import SentenceTransformer
import pickle

# 모델 로드 또는 생성
model = SentenceTransformer('jhgan/ko-sroberta-multitask')

# 모델 저장
with open('/Users/hyunwoo/Desktop/dev/Chatbot/fastAPI/chatbot_model.pkl', 'wb') as file:
    pickle.dump(model, file)
