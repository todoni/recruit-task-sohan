# TTS STT 3D 아바타 챗봇

## 🗂 목차

### 🔗 프로젝트 정보

| [바로가기](./docs/Project.md)

### 🔗 배포

| [바로가기](#🪐-배포)

### 🔗 개발 일정

| [바로가기](#🗓-개발-일정)

### 🔗 구현사항

| [바로가기](#구현사항)

### 🔗 퇴고

| [바로가기](#🔗-퇴고)

<br>

## 💡 배포 링크

[sohan.me](https://sohan.me)

<br>

## 🔍 로컬 실행 방법

### ❗️Prerequisites❗️

```
`npm` `yarn` `pm2` `.env`
```

```Bash
git clone --recursive https://github.com/todoni/recruit-task-sohan.git

cd recruit-task-sohan

make
```

### Makefile

```
`make`, `make all` : 전체 빌드

`make dev` :  front development모드 빌드

`make clean` : 전체 pm2 프로세스 종료

`make re` : clean 후 다시 전체 빌드

그 외는 파일 참조
```

<br>

## 🛠 구현 사항

- 채팅 메시지 인풋창 <span style="color:yellow">**자동 포커스**</span>
- 채팅창 overflow y 발생 시 <span style="color:yellow">**자동 스크롤**</span>
- ChatGPT API 요청시 이전 대화 맥락 기억으로 조금 더 <span style="color:yellow">**자연스러운 대화**</span> 기능
- 응답을 기다리는 동안은 <span style="color:yellow">**대기 컴포넌트 렌더링**</span> 및 상황에 맞게 사용자입력 비활성화
- TTS API <span style="color:yellow">**발화 상태를 이벤트로 관리**</span>하여 말하고 있는지 여부에 따라 아바타 애니메이션 적용
- Speech recognition시 컴포넌트에 <span style="color:yellow">**실시간으로 transcript 표시**</span>
- gltfjsx를 활용한 아바타 컴포넌트화 -> typescript로 변환
- API key 등의 노출을 막기위한 express.js <span style="color:yellow">**미들웨어 서버 직접 구현**</span>
- AWS ELB(Elastic Load Balancer)를 이용해 <span style="color:yellow">**HTTP to HTTPS 리다이렉션**</span> 기능 구현
- AWS ACM(Amazon Certificate Manager) SSL 인증서 발급 후 로드밸런서와 연동해 <span style="color:yellow">**보안 연결**</span> 사용
- Github action, Docker compose, S3 Bucket을 이용해 <span style="color:yellow">**배포서버 빌드 자동화**</span>
- 미디어쿼리를 이용한 반응형 웹 구현

[맨 위로 가기](#굳갱랩스-프론트엔드-개발자-채용과제)

<br>

## 🗓 개발 일정

- [2023-07-23 (일)](#2023-07-23-일)
- [2023-07-22 (토)](#2023-07-22-토)
- [2023-07-21 (금)](#2023-07-21-금)
- [2023-07-20 (목)](#2023-07-20-목)

<br>

### 2023-07-23 (일)

- [#8 UI 구현 마무리](https://github.com/todoni/goodganglabs-quest-frontend/issues/8)
  ### Todo
  - [x] 음성인식 버튼 + 메시지 제출폼 => 하나의 컴포넌트로 묶자
  - [x] 음성인식 버튼 한번 누르면 로딩아이콘 한번 더 누르면 다시 원래대로
  - [x] 음성인식 버튼 위에 transcript 뜨게 하기? 메시지 버블에 바로 넣기? -> 고민 해보자
  - [x] 레이아웃 정리
  - [x] 가능하면 styled 와 media query 이용한 반응형 웹으로 만들어보기
  - [x] 채팅 스크롤 자동으로 맨 아래로 포커스
  - [x] 응답 받아오는동안 스피너 표시
  - [x] 인풋창 자동포커스

### 2023-07-22 (토)

- [#7 프로젝트 구조 개선](https://github.com/todoni/goodganglabs-quest-frontend/issues/7)
- [#6 따로 떨어져있는 기능들 유기적으로 합치기](https://github.com/todoni/goodganglabs-quest-frontend/issues/6)
  ### Todo
  - [x] 음성인식 결과 텍스트 gpt api로 적절히 요청 보내기
  - [x] tts로 gpt 응답 읽고 있을 때만 아바타 애니메이션 설정하기

### 2023-07-21 (금)

- [#3 음성 도메인 제외하고 채팅부터 구현](https://github.com/todoni/goodganglabs-quest-frontend/issues/3)
- [#2 infrastructure 레이어 구현](https://github.com/todoni/goodganglabs-quest-frontend/issues/2)
  ### Todo
  - [x] ChatAI
  - [x] STT
  - [x] TTS

### 2023-07-20 (목)

- [#1 프로젝트 설계](https://github.com/todoni/goodganglabs-quest-frontend/issues/1)
  ### Todo
  - [x] 컴포넌트 설계
  - [x] figma 디자인
  - [x] 디자인 패턴 맞춰서 파일트리 구성
  - [x] 보일러플레이트 코드 작성

[맨 위로 가기](#굳갱랩스-프론트엔드-개발자-채용과제)

<br>

## 🪐 배포

### 사용 툴

- Docker, Docker Compose, Nginx, Github Action, AWS S3, Router53, EC2, ELB, ACM

### 파이프라인

- 로컬에서 main 브랜치에 푸쉬
- github action <br>
  -> 그 안에서 정적 파일 빌드 -> S3에 업로드 -> EC2 인스턴스에 ssh 접속 -> 파일을 Docker Voulum에 마운트 시켜 놓은 위치에 다운로드 -> 정적 파일을 가지고 다시 docker container 재구동 -> 새로운 정적 파일 serve!

### 왜 이렇게 했나?

- 문제상황
  1. 보안 연결이 아니면 음성 입력을 허용하기를 요청 할 수 없음.
  2. 빠른 배포를 위해 s3, vercel, netlify 등 다양한 툴을 활용하고자 했으나 미들웨어까지 포함해서 서로 다른 도메인이 통신하도록 설정을 커스텀 하는것에 어려움이 있음.
  3. AWS Free Tier 이슈로 컴퓨터 성능이 굉장히 열악한 상황. swap 메모리 활용해서 최대한 속도를 올려보려고 했지만 정적 페이지 빌드에 17분이 걸리는 결과 발생.
  4. HTTPS -> HTTP 요청은 브라우저에서 차단됨.
  5. S3 bucket은 정적 파일이 POST 요청을 보내는 것을 지원하지 않음. 하지만 body에 data를 포함해서 api 요청을 해야하고 GET 요청에 body를 포함시켜 보내는 것은 안전하지 않은 동작이 결과인 경우가 많음.

### 그래서!

- 설정에 드는 비용과 시간을 감안하더라도 nginx의 루트를 빌드된 정적 파일이 있는 곳을 바라보게 하고 docker network 설정으로 컨테이너끼리 통신을 하면 되겠다고 생각했습니다.
- static build 파일에서 발생하는 api 요청을 nginx 프록시 기능을 이용해 express 서버를 띄워놓은 컨테이너로 보내주었습니다.
- 코드에 수정사항이 있을 때 알아서 빌드를 해서 자동으로 다시 서빙을 해주면 편하겠다고 생각했습니다.

### 레포가 궁금하시다면

| [여기](https://github.com/todoni/goodgang-deploy.git)서 확인 가능합니다 :)

[맨 위로 가기](#굳갱랩스-프론트엔드-개발자-채용과제)

<br>

## 🙇‍♀️ 회고

- 기계공학부에서 로봇공학에 관심을 가지면서 월드 좌표계, 카메라 좌표계 등 3D와 관련된 것에 흥미를 느꼈는데 이번에 3D 에셋에 대해서는 집중을 못한 것 같습니다. 하지만 과제 덕분에 이런 세상이 있는 것도 알게 되었네요!
- 빠른 구현에 집중하고자 했고 마무리 하고나니 조금 더 많은 사람들을 고려하는 반응형 웹디자인, chat GPT처럼 텍스트 응답을 부분 부분 잘라서 프롬프트 시키는 효과, 아바타를 고를 수 있게 한다든지 마우스 입력으로 뷰 회전을 할 수 있게 한다든지 생각 나는게 많은데 이번 채용과제 통해서 며칠 안되는 시간임에도 하기 전보다 조금 더 많이 알고있는 내가 될 수 있었던 것 같아 정말 기분이 좋습니다.
- 며칠간 정말 즐거운 개발일정이었습니다 😆

[맨 위로 가기](#굳갱랩스-프론트엔드-개발자-채용과제)
