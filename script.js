alert("Welcome to JS");

 console type
console.log("Welcome!");
console.log([45,78,29]);
console.log({name: 'Jana', age:25});
console.table({name: 'Jana', age:25});
console.error("Custom sample error");
console.warn("Custom sample error");
console.clear();

//we can find the efficiency of evaluating the code using timer.
console.time("Timer");
for(i=0; i<=10;i++){
    console.log(i);
}
console.timeEnd("Timer")

/*var,let and const */

//1)Scope:
//var=> global and block scope which means it can work both inside and outside block.
if(true){
    var msg="welcomee!";
    console.log(msg);
    
}
console.log(msg);

//let and const=> block scope which means it can work only within a block.
if(true){
    let msg="welcomee!";
    console.log(msg);
}
if(true){
    const msg="welcomee!";
    console.log(msg);
}

//2)variable declaration:
//var can change the values of a same variable.
var a=5;
console.log(a);
 a=10;
 console.log(a);

//let and const both arenot a change the values of a same variable.
let a=5;
console.log(a);
let a=10;

const a=5;
console.log(a);
const a=10;

//3)values assignment:
//var=> var can allows to change the values
var a=10;
console .log(a);
a=20;
console.log(a);
 
// let=> let cannot allow to change the values.
let a=10;
console .log(a);

//const=> const is smiliar to let but if we assigning the values in object it can change it.
const details={'name':"Jana",'age':12};
console.log(details.name);
details.name="Goma";
console.log(details.name);
console.table(details);

//JS Datatypes:(dynamic programming is js and python):
/* 
1)primitive datatype:
string=> jana
number=> 123
boolen=> true or false
null
undefined


2)reference datatype:
array=>
object=>
date=>

*/

var a = 12;
var a = 12.4;
var a = "Jana";
var a = true;
var a = null;//(null => object when it executes using typeof a)
var a;//(undefined)

let a={fname:'jana',age:21};//(object)
let a=[1, 'jana'];//(object)
const a = new Date();
console.time(a);
console.timeEnd(a);
const s1 = Symbol();
console.log(s1);
const s2= Symbol();
console.log(s2);
if(s1==s2)
{
    console.log('true');
}else{
    console.log('false');
}



//TOPIC:Type conversion
//Type conversion is used to change the datatype if we want.
// Using this two method we can change the datatype.
//This type conversion can support date,boolean, nummber, array,etc.
//Type conversion of converting number, other to string.
// type1
var a = 25;
console.log(a, typeof a);
var a = String(a);
console.log(a, typeof a);

//type2
var a = 25;
console.log(a, typeof a);
var a = a.toString();
console.log(a, typeof a);

//Type conversion of string to number
var a = '25';
console.log(a, typeof a);
var a = Number(a);
console.log(a, typeof a);

var a = '25.5';
console.log(a, typeof a);
var a = parseInt(a);//parseInt is used to print the values only before the point like 25.(25.5)
console.log(a, typeof a);

var a = '25.5';
console.log(a, typeof a);
var a = parseFloat(a);
console.log(a, typeof a);

//Topic:Type coercion:
var a = '10';
var b= 5;
console.log(a+b);
c=Number(a);
console.log(c+b);

//Topic:operators
//Arithmetic=> +, -, *, /

//Assignment=>=,+=,-=,*=,/=
var a = 5;
a += 10;
console.log(a);

//Comparision=> 
//==,===(only used for when number as a string like"10"),!=.

//Relational=>
//>,<,>=,<=

//logical=>
//&& and, || or,! not.

//strict equality or identity operator:
//This operator only used for when you are strictly following the condition.
let a=10;
let b='10';
console.log(a==b);
console.log(a===b);

 //ternary or conditional operator(?:)
 //example
 const age=22;
 const result = age>=18? "Eligible":"NotEligible";
 console.log(result);

//example2(1.handling null values)
//function is a group of code which is enclosed({}) and also we can call it many times by function name. 
function welcome(name){
    const result = name?name:"No name";
    console.log("Welcome"  +result);
}
welcome("Jana");
welcome(null);

//2.handling null values in object:
const user={names:'mouli',age:21};

const greeting = (user)=>{
    const result=user?user.names:"No Name";
    return "Hello" + result;
}
console.log(greeting(user));

problem(conditional chains)

const avg=90;
const grade=avg>=90?"A Grade":"B Grade";
console.log(grade);