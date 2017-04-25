/*
Declare
* Declare Objects for elo rating
* Object Properties
    - id
    - name
    - R : currentRate
    - store : name of store
    - distance : min
* Declare function
    - getRatingDelta(myRating, opponentRating, myGameResult)
        - @param myRating : my currentRate
        - @param opponentRating : opponent's currentRate
        - @param myGameResult : 1 for win, 0 for lose, 0.5 for drew
        - return K(Sa - Ea)
    - getNewRating(myRating, opponentRating, myGameResult)
        - @param myRating : my currentRate
        - @param opponentRating : opponent's currentRate
        - @param myGameResult : 1 for win, 0 for lose, 0.5 for drew
        - return R' = R + K(Sa - Ea)

TEST
* 객체로 이루어진 배열을 생성한다.
    - type Restorant
* initial R value : 1500
* 대진을 결정하기 위해 random 값을 생성한다.
    - [?]토너먼트가 아니기 때문에 두개의 값만 지속적으로 뽑아주면 된다.
    - [?]대결하는 두팀은 완전 랜덤으로 할것인지? 아니면 property를 추가해서 
        최대 대결값을 제한하는 방법도 있다.
* 대진 진행되면서 실시간 결과를 표시한다.
*/
var currentState = {left: 1, right: 2};
var myArray = [];
myArray.push({id: 0, name: 'a', R: 1500, store: "대우식당", distance: 10});
myArray.push({id: 1, name: 'b', R: 1500, store: "호랑이식당", distance: 15});
myArray.push({id: 2, name: 'c', R: 1500, store: "무월식탁", distance: 8});
myArray.push({id: 3, name: 'd', R: 1500, store: "강남불백", distance: 3});
myArray.push({id: 4, name: 'e', R: 1500, store: "이자와", distance: 9});
myArray.push({id: 5, name: 'f', R: 1500, store: "딸부자네불백", distance: 20});
myArray.push({id: 6, name: 'g', R: 1500, store: "두부공작소", distance: 15});
myArray.push({id: 7, name: 'h', R: 1500, store: "스노우폭스 뱅뱅점", distance: 25});

setTable();
setStage();

function setTable() {
    for(var i=0; i < myArray.length; i++) {
        // 객체 정렬
        myArray.sort(function(a,b) {
            return a.R > b.R ? -1 : a.R < b.R ? 1 : 0;
        });
        
        document.getElementById("img0"+(i+1)).src = "images/"+myArray[i].name+".jpg"
        document.getElementById("r0"+(i+1)).innerHTML = myArray[i].R;
        document.getElementById("store0"+(i+1)).innerHTML = myArray[i].store;
        document.getElementById("distance0"+(i+1)).innerHTML = myArray[i].distance+" 분";
    }
}

function setStage() {
    var check;
    currentState.left = Math.floor((Math.random() * 7) + 1);

    while(1) {
        check = Math.floor((Math.random() * 7) + 1);
        if(check != currentState.left) {
            currentState.right = check;
            break;
        }
    }
    console.log(currentState.left + ', ' + currentState.right);

    document.getElementById("left").src = "images/"+myArray[currentState.left].name+".jpg";
    document.getElementById("right").src = "images/"+myArray[currentState.right].name+".jpg";
    document.getElementById("left").name = myArray[currentState.left].name;
    document.getElementById("right").name = myArray[currentState.left].name;
}

function chooseLeft(obj) {
    for(var i = 0; myArray.length; i++) {
        console.log(obj.name + ', ' + myArray[i].name + ', ' + (obj.name == myArray[i].name));
        
        if(obj.name == myArray[i].name) {
            // alert(getNewRating(myArray[currentState.left].R, myArray[currentState.right].R, 1));
            myArray[currentState.left].R =  getNewRating(myArray[currentState.left].R, myArray[currentState.right].R, 1);
            myArray[currentState.right].R = getNewRating(myArray[currentState.right].R, myArray[currentState.left].R, 0);
            break;
        }
    }
    setTable();
    setStage();
}

function chooseRight(obj) {
    for(var i = 0; myArray.length; i++) {
        console.log(obj.name + ', ' + myArray[i].name + ', ' + (obj.name == myArray[i].name));

        if(obj.name == myArray[i].name) {
            myArray[currentState.right].R =  getNewRating(myArray[currentState.right].R, myArray[currentState.left].R, 1);
            myArray[currentState.left].R = getNewRating(myArray[currentState.left].R, myArray[currentState.right].R, 0);

            break;
        }
    }
    setTable();
    setStage();
}

function getRatingDelta(myRating, opponentRating, myGameResult) {
    if ([0, 0.5, 1].indexOf(myGameResult) === -1) {
    return null;
    }
    
    var myChanceToWin = 1 / ( 1 + Math.pow(10, (opponentRating - myRating) / 400));

    return Math.round(32 * (myGameResult - myChanceToWin));
}

function getNewRating(myRating, opponentRating, myGameResult) {
    return myRating + getRatingDelta(myRating, opponentRating, myGameResult);
}

