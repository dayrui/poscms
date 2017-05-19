function jQuery(e) {return document.getElementById(e);}
document.getElementsByClassName = function(cl) {
    var retnode = [];
    var myclass = new RegExp('\\b'+cl+'\\b');
    var elem = this.getElementsByTagName('*');
    for (var i = 0; i < elem.length; i++) {
        var classes = elem[i].className;
        if (myclass.test(classes)) retnode.push(elem[i]);
    }
    return retnode;
}
var MyMar;
var speed = 1; //速度，越大越慢
var spec = 1; //每次滚动的间距, 越大滚动越快

var thumbs = document.getElementsByClassName('thumb_img');
for (var i=0; i<thumbs.length; i++) {
    thumbs[i].onmouseover = function () {jQuery('main_img').src=this.rel;};
}

function gotop() {jQuery('showArea').scrollLeft-=spec;}
function gobottom() {jQuery('showArea').scrollLeft+=spec;}