try {

    alert('try 블록 시작');  // (1) <--
  
    // ...에러가 없습니다.
    kjjjjsjs
  
    alert('try 블록 끝');   // (2) <--
  
  } catch(err) {
  
    alert(`${err.name} ${err.message}`); // (3)
  
  }