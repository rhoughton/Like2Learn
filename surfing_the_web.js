//tested on Edge, success.
var timer=100;document.querySelectorAll(
"div > input[type='checkbox']:checked"
).forEach((interest) => {
setTimeout(function(){interest.click()},timer);timer+=2000;}); 

//heres another one tested on chrome, success.
await async function() {
   const checked = document.querySelectorAll("div > input[type='checkbox']:checked");
   for (c of checked) {
      await new Promise(r => setTimeout(r, 500));
      c.scrollIntoView(true);
      c.click();
   } 
}();

//my fav, short and sweet, tested on ffox, success 
$$("input:checked").forEach( (w) => { w.click() } );  

//like or unlike a page full of stuff 
setInterval(() => {
  for (const d of document.querySelectorAll('div[data-testid="like"]')) {
    d.scrollIntoView(true);
    d.click()
  }
  window.scrollTo(0, document.body.scrollHeight)
}, 1000)

//stackoverflow one
for (var j = 1; j < 11; j++) {
  var input = document.querySelectorAll('[data-testid="like"]');
  for (var i = 0; i < 11; i++) {
   input.click();
   window.scrollBy(0, 600); 
}}

for(var j = 1; j < 4; j++) {
for (const d of document.querySelectorAll('div[data-testid="like"]')) {
    d.scrollIntoView(true);
    d.click()
  }}
