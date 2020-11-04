const FIXED_FRICE = 1000;
const MANUPACTURE_PRICE_PER_ONE = 70;
const LIST_PRICE_PER_ONE = 100;

let ManupactureECount = 0;

while(true){
    if(FIXED_FRICE + MANUPACTURE_PRICE_PER_ONE * ManupactureECount < LIST_PRICE_PER_ONE * ManupactureECount){
    break;
    }
    ManupactureECount++;
}
alert(ManupactureECount);

// alert(parseInt(FIXED_FRICE / (LIST_PRICE_PER_ONE - MANUPACTURE_PRICE_PER_ONE)))
// WHILE 없이 푸는 법*