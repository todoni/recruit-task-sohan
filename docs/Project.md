# 프로젝트 정보

프로젝트에 관한 정보입니다.

<br>

## 📝 목차

- [버전 명세](#-%EB%B2%84%EC%A0%84-%EB%AA%85%EC%84%B8)
- [프로젝트 구조](#-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EA%B5%AC%EC%A1%B0)
- [깃 컨벤션](#-%EA%B9%83-%EC%BB%A8%EB%B2%A4%EC%85%98)
- [코드 컨벤션](#-%EC%BD%94%EB%93%9C-%EC%BB%A8%EB%B2%A4%EC%85%98)

<br>

## 📌 버전 명세

프로젝트를 진행하며 필수로 설치되어야 하는 도구의 버전을 명세한 것입니다.<br>

라이브러리의 자세한 버전은 [package.json](../front/package.json)을 참고해주세요.<br>

| 이 프로젝트는 <span style="color:yellow">**yarn, npm**</span>를 이용해 빌드합니다.

```PLAIN
Node.js     : v18.17.0
npm         : 9.6.7
yarn        : 1.22.19

typescript  : 5.0.2
```

<br>

## 🎉 프로젝트 구조

DDD(Domain Driven Design)를 적용 하였습니다.
4개의 계층으로 이루어진 Layered Architechture로 구성하였습니다.
<img src="https://user-images.githubusercontent.com/80902663/232491124-4740512e-c8c7-47dc-a3e8-01906b3b0e43.png" width="60%" height="60%">

### 1. Presentation Layer

- 사용자에게 보여지는 화면으로 이루어져있습니다.
- 최대한 추상화 단계를 일관성 있게 하려고 노력했습니다
- 사용자와 상호작용 하는 요소들은 여기에 있습니다 (컴포넌트 등)

### 2. Application Layer

- 도메인마다 필요한 리포지토리 세부 구현체에 직접 의존하지 않고 추상인터페이스를 불러와서 데이터를 전달하는 데 필요한 일을 합니다.

### 3. Domain Layer

- 각 도메인의 Repository 추상화 interface 및 도메인 모델이 정의 되어있습니다.
- 메시지또한 하나의 도메인으로 구분하고 zustand를 이용해서 상태관리를 했습니다.

### 4. Infrasturcture Layer

- Domain Layer에서 정의한 Repository의 실제 구현체들로 구성되어 있습니다.
- 실질적으로 외부 API와 통신하는 레이어입니다.
- 전달받은 데이터를 이용해 API에 요청을 보내고, 응답을 Application Layer에 다시 전달합니다.

<br>

## 💬 깃 컨벤션

[Udacity Git Commit Message Style Guide](https://udacity.github.io/git-styleguide/)를 참고하여 컨벤션을 적용했습니다.<br>

<br>

아래는 Git commit 예시 입니다.

> Commit Type: Commit Message

- Feat : 새로운 기능이 추가 된 경우
- Fix : 버그를 고친 경우
- Refact : 코드 동작은 같지만 구조가 개선된 경우
- Remove : 코드를 삭제한 경우
- Chore : 코드 동작과 관련 없는 작업 (ex. 패키지 추가 등)
- Build : 패키지 버전 등 빌드 및 프로젝트 환경설정에 관한 것
- Design : css등의 디자인을 수정, 추가 했을 때
  <br>

```SHELL
# Commit example

git commit -m "Feat: ~~~ 기능을 추가"

git commit -m "Refact: ~~~ 비즈니스 로직에서 불필요한 ~~~를 제거"

git commit -m "Fix: 기존에 작성된 ~~~가 정상적인 기대 값을 주지 않는 문제를 해결"

```

<br>

## 🎨 코드 컨벤션

`Clean Code`를 지향하는 개발을 진행하며, 기본적인 컨벤션은 아래를 따릅니다.<br>

```PALIN
Identation    : space
Tab size      : 2
Max width     : 80
Quote         : double
End of line   : true
Semicolon     : true
```
