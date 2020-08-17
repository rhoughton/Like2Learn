/*
this is a great article to understand the ts compiler: https://medium.com/jspoint/typescript-hello-world-program-b0826ee3d87d
this example wants us to create 2 separate files: program.tx and utils.ts but I'm dumping both codes here
*/
import{ sayHello } from './lib/utils';
// declare result to be a string
var result: string;
//save the return value in result
result = sayHello('Ross');
console.log(result);

//here is where the other file code would be
export function sayHello( user: string ): string {
    return 'Hello, ${user}';
}