const PASSWORD = "1234"
const ID = "dongyoung"

inputID = prompt("아이디","")
inputPassword = prompt("비밀번호", "");

if(ID === inputID && PASSWORD === inputPassword){
    alert("로그인 되었습니다!")
}
else if(ID === inputID){
    alert("로그인에 실패하였습니다, 비밀번호를 확인해주세요")
}
else if(PASSWORD === inputPassword){
    alert("로그인에 실패하였습니다, 아이디를 확인해주세요")
}
else{
    alert("로그인에 실패하였습니다")
}
