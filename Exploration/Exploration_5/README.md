Report
# DiffusersControlNet
# Canny & Openpose 전처리기
# 이지 생성 모델
# 아이펠 온라인 6기 코어 최현우

---

## 1. 루브릭
평가문항
1. 프롬프트와 하이퍼파라미터를 변경하여 윤곽선 검출 조건을 준 이미지를 생성하였는가?	
2. 인체 자세 검출 전처리기를 이용하여 이미지를 생성하였는가?
3. 윤곽선 검출과 인체 자세 검출 전처리기를 사용하여 이미지를 생성하였는가?
   
## 2. test
* 프롬프트와 두 처리기의 스케일 조절로 원하는 그림에 수렴했습니다.
* 프롬프트 작성이 원하는 이미지 생성에 엄청난 영향을 주는 것을 확인했습니다.

## 3. 회고록
노드대로 진행 했을 때, 메모리 부족과 전처리기 합치는 과정에서 컨트롤넷이 인수를 못받아와 서 어려움을 겪었습니다.
