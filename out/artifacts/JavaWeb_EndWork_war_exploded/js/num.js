// JavaScript Document
function addUpdate(jia){
	var c = jia.parent().find(".car_ipt").val();
	var price = jia.parent().find(".price").text();
	alert(price);
	c=parseInt(c)+1;
	jia.parent().find(".car_ipt").val(c);
	jia.parent().find(".sum").val(price*c);
}

function jianUpdate(jian){
	var c = jian.parent().find(".car_ipt").val();
	var price = jian.parent().find(".price").text();
	if(c<=1){
		c=1;
	}else{
		c=parseInt(c)-1;
		jian.parent().find(".car_ipt").val(c);
		jian.parent().find(".sum").val(price*c);
	}
}    




function addUpdate1(jia){

}

function jianUpdate1(jian){

}
