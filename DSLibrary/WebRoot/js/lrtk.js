var imglist=new Array(4);//ͼƬ����
imglist[0]="images/1.jpg";  //��һ��ͼƬ�ĵ�ַ
imglist[1]="images/3.jpg";
imglist[2]="images/4.jpg";
imglist[5]="images/2.jpg";
imglist[3]="images/5.jpg";


imglist[4]="images/7.jpg";


var i=0;
function changeimg()
{
 if(i==imglist.length)
 {
  i=0;
 }
  document.getElementById("tp").src=imglist[i];
 ++i;
}
window.setInterval("changeimg()",1500);//1000����1��

function menuFix() {
var sfEls = document.getElementById("nav").getElementsByTagName("li");
for (var i=0; i<sfEls.length; i++) {
sfEls[i].onmouseover=function() {
this.className+=(this.className.length>0? " ": "") + "show";
}
sfEls[i].onmouseout=function() {
this.className=this.className.replace(new RegExp("( ?|^)show\\b"), "");
}
}
}
window.onload=menuFix;