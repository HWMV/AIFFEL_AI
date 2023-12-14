review
# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 최현우
- 리뷰어 : 조세창


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
# 각 과정별로 보기 편하게 파일을 나누고 이미지를 2장으로 시각화하였습니다.
# 첫 번째 이미지 (포즈 추출 이미지)
plt.subplot(1, 3, 1)
plt.imshow(pose_image)
plt.title("Pose Image")
plt.axis("off")

# 두 번째 이미지 (배경 윤곽선 이미지)
plt.subplot(1, 3, 2)
plt.imshow(background_image)
plt.title("Background Image")
plt.axis("off")

plt.show()


```
```
# image를 추출할 때 각 인자별로 테스트를 하여 무엇이 변화하는지를 테스트하였습니다.
image = pipe(
    prompt,
    images,
    num_inference_steps=20,
    generator=generator,
    negative_prompt=negative_prompt,
    controlnet_conditioning_scale=[1.5, 0.4],
).images[0]


```
