from tensorflow.keras.preprocessing import image
from tensorflow import keras
# from keras.preprocessing import image
import numpy as np

# 모델 파일 경로
MODEL_PATH = '/Users/hyunwoo/Desktop/dev/Jellyfish/fastAPI/jellyfish_mobilenet.h5'

# 모델 로드
model = keras.models.load_model(MODEL_PATH)

def prediction_model(img_path='/Users/hyunwoo/Desktop/dev/Jellyfish/fastAPI/jellyfish.jpg'):
    # 이미지 로드 및 전처리
    img = image.load_img(img_path, target_size=(224, 224))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array /= 255.0

    # 예측 수행
    predictions = model.predict(img_array)
    # 가장 높은 확률을 가진 클래스 반환
    predicted_class = np.argmax(predictions, axis=1)
    # 가장 높은 확률 값을 계산
    predicted_probability = np.max(predictions)

    # 결과 반환
    return {
    "predicted_class": int(predicted_class[0]),  # 예측된 클래스
    "confidence": float(predicted_probability)   # 예측 확률
}