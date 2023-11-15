# Project Report
* Review file은 따로 생성 했습니다
* News_summary_more_final 파일 보시면 됩니다!

---
# 6. 회고록

# 하면서 배우고 찾아봤던 점
1. 문장의 길이에 따라서 적절한 ratio 값을 설정해주지 않으면 요약이 안됩니다(Summa summarize)
2. 문장의 길이 때문에 Summa 요약이 안된다 판단하여 여러 비교
(원본, 전처리 데이터 비교 및 새로운 텍스트 요약, 같은 문장 길이 감소 등)

* 결론 : Summa summarize 는 TextRank 알고리즘을 사용, 대소문자/특수기호 등으로 단어를 추출해서 유사성을 계산하지만 전처리 된 데이터는 단어의 불확실성, 소문자화, 특수기호 삭제 등으로 요약이 안되었습니다.
* **raito** 값도 적절히 조절하지 않으면 출력이 안되었습니다.

# 추출/추상적 요약 비교

|요약 타입|문장 완성도|설명|
|:---|---:|:---:|
|Extractive summary|완전함|확실히 원본에서 단어를 가져다 사용해서 그런지 요약하는 속도나 완성도가 상대적으로 높았습니다.|
|Abstractive summary|부족함|엉뚱한 단어가 튀어 나오기도 하고, 일부만 요약하는 모습을 보였습니다. 그러나 다양한 표현을 하려는 모습 확인 했습니다.|

# 추출/추상 요약 예시
1. Extractive summary

원본 : New Zealand defeated India by 8 wickets in the fourth ODI at Hamilton on Thursday to win their first match of the five-match ODI series. India lost an international match under Rohit Sharma's captaincy after 12 consecutive victories dating back to March 2018. The match witnessed India getting all out for 92, their seventh lowest total in ODI cricket history.

* 추출적 요약: The match witnessed India getting all out for 92, their seventh lowest total in ODI cricket history.

번역 : 뉴질랜드는 목요일 해밀턴에서 열린 네 번째 ODI에서 인도를 8위켓으로 꺾고 5경기 ODI 시리즈의 첫 경기에서 승리했습니다. 인도는 2018년 3월부터 12연승을 거둔 후 Rohit Sharma의 주장 아래 국제 경기에서 패했습니다. 이 경기에서 인도는 ODI 크리켓 역사상 7번째로 낮은 합계인 92점을 기록했습니다.

* 추출적 요약: 이 경기에서는 인도가 ODI 크리켓 역사상 7번째로 낮은 합계인 92점을 기록했습니다.
---
2. Abstractive summary

원문 : shiv sena leader sunil booked culpable homicide collapse four storey building people killed mumbai ghatkopar tuesday owned building ground floor reportedly carried illegal renovations weakened building interestingly building mumbai civic body list unsafe buildings year
* 실제 요약 : shivsenaleaderarrestedovermumbaibuildingcollapse
* 예측 요약 : shiv sena leader shifted to fire in stampede

번역 : hiv sena 리더 수닐은 과실치사 붕괴 4층 건물 사람들이 사망했습니다 뭄바이 가트코파르 화요일 소유 건물 1층은 불법 개조 공사를 진행한 것으로 알려졌습니다 약화된 건물 흥미롭게도 뭄바이 시민 단체 목록 안전하지 않은 건물 연도
* 실제 요약 : 시브세날리더, 뭄바이 건물 붕괴로 체포
* 예측 요약 : 시브 세나 리더가 휩쓸려 불타올랐다