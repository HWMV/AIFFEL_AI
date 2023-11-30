review
# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 최현우
- 리뷰어 : 김영진


# PRT(Peer Review Template)
- [V]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
  네 완성된 코드가 제출되었습니다.
  
- [V]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
  네. train_step 함수의 설명을 주석으로 잘 설명하신 것 같습니다.
        
- [V]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나”, ”새로운 시도 또는 추가 실험을 수행”해봤나요?**
  네. 회고 부분에 잘 드러나 있습니다.

- [V]  **4. 회고를 잘 작성했나요?**
  네. 회고를 잘 작성하신 것 같습니다.

- [V]  **5. 코드가 간결하고 효율적인가요?**
    네. 개선한 부분을 봐도 간결하고 효율적인 것 같습니다.

# 참고 링크 및 코드 개선

5번 질문 참조 코드
```
# 노드와 다르게 Loss function 변경 (LSGAN)
# Least Squares LF
# 생성자의 Least Squares Loss Function
# def generator_loss(fake_output):
#     return tf.reduce_mean((fake_output - 1) ** 2)

def generator_loss(fake_output):
    return tf.reduce_mean(tf.square(fake_output - 1))
```

```
# 판별자의 Least Squares Loss Function
def discriminator_loss(real_output, fake_output):
    real_loss = tf.reduce_mean((real_output - 1) ** 2)
    fake_loss = tf.reduce_mean(fake_output ** 2)
    total_loss = (real_loss + fake_loss) * 0.5  # 평균을 내서 손실을 계산합니다.
    return total_loss
```
