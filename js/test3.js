let inputNumber = prompt("숫자를 입력해주세요") * 1; 
let FirstNumber = 1;
let SecondNumber = 1;
let temp;
while(true){
    temp = FirstNumber + SecondNumber;
    console.log(temp);
    FirstNumber = SecondNumber;
    SecondNumber = temp;
    if(temp > inputNumber){
        break;
    }

}
