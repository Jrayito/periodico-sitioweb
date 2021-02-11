var loc = document.location.href;
var getString = loc.split('?')[1];
var GET = getString.split('&');
var get = {};

for( var i = 0, l = GET.length; i < 1; i++){
  var tmp = GET[i].split('=');
  get[tmp[0]] = unescape(decodeURI(tmp[1]));
}


if(get['nota']){
  //Hacer el proceso
  console.log(get);
}else{
  location.href = "../index.htm";
}