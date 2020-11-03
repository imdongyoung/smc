const NUMBER = 21;
let totalNumber = 0;

while(true){
    let inputNumber = prompt("숫자를 입력해주세요") * 1;
    totalNumber += inputNumber;

    if(totalNumber === NUMBER){
        alert("승리하였습니다.");
        break;
    }
    else if(totalNumber > NUMBER){
        alert("실패하였습니다");
        break;
    }
    
}