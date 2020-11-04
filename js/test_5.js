const BIG_SUGAR = 5;
const SMALL_SUGAR = 3;
let SUGAR = 16;

let bagCount = 0;

while(true){
    if(SUGAR % 5 === 0){
        bagCount += SUGAR / 5;
        break;
    } else if(SUGAR <= 0){
        bagCount= -1;
        break;
    }
    SUGAR -= 3;
    bagCount ++;
}