//�����ϸ�ҳ�洫�����Ĳ���
function queryString() {
	var name, value, i;
	var str = location.href;
	var num = str.indexOf("?")
	str = str.substr(num + 1);
	var arrtmp = str.split("&");
	for(i = 0; i < arrtmp.length; i++) {
		num = arrtmp[i].indexOf("=");
		if(num > 0) {
			name = arrtmp[i].substring(0, num);
			value = arrtmp[i].substr(num + 1);
			this[name] = value;
		}
	}
}

//UTF-8����ĺ���ת��Ϊ�ַ��������ַ�����
function fromUtf8ToChinese(strUtf8) {
	var bstr = "";
	var nOffset = 0;
	if(strUtf8 == "") {
		return "";
	}

	strUtf8 = strUtf8.toLowerCase();
	nOffset = strUtf8.indexOf("%e");
	if(nOffset == -1) {
		return strUtf8;
	}
	while(nOffset != -1) {
		bstr += strUtf8.substr(0, nOffset);
		strUtf8 = strUtf8.substr(nOffset, strUtf8.length - nOffset);
		if(strUtf8 == "" || strUtf8.length < 9) {
			return bstr;
		}
		bstr += utf8CodeToChineseChar(strUtf8.substr(0, 9));
		strUtf8 = strUtf8.substr(9, strUtf8.length - 9);
		nOffset = strUtf8.indexOf("%e");
	}
	return bstr + strUtf8;
}

function utf8CodeToChineseChar(strUtf8) {
	var iCode, iCode1, iCode2;
	iCode = parseInt("0x" + strUtf8.substr(1, 2));
	iCode1 = parseInt("0x" + strUtf8.substr(4, 2));
	iCode2 = parseInt("0x" + strUtf8.substr(7, 2));

	return String.fromCharCode(((iCode & 0x0F) << 12) |
		((iCode1 & 0x3F) << 6) |
		(iCode2 & 0x3F));
}
/**
 * �ҵ�ajax��ȡ��̨����
 * @param {Object} urlPath_parameter
 */
function myAjax(urlPath_parameter, need_data,fun) {
	var serverUrl = "http://120.76.190.223:8988/" + urlPath_parameter;
	var getdata_obj;
	$.ajax({
		type: "post",
		url: serverUrl,
		dataType: "json",
		contentType: "application/x-www-form-urlencoded; charset=GBK",
		data: need_data,
		async: true,
		success: function(res) {
			if(res.gda.msg_typ == "N") {
				getdata_obj = res;
				fun(res);
			} else {
				//alert(res.gda.msg_inf);
				return false;
			}
		},
		error: function(res) {
			alert("�쳣����="+res.gda.msg_inf);
			return false;
		}
	});
	return getdata_obj;
}

//���ط�ҳ��'.swiper-container'
function loadSwiper(classOne, classTwo) {
	new Swiper('.' + classOne + '', {
		direction: 'horizontal',
		loop: true,
		speed: 300,
		autoplay: 2000,
		//��ҳ��
		pagination: '.' + classTwo + '',
	})
}
/**
 * �����ֻ�������ʾΪ3+4+4�ĸ�ʽ
 * @param {Object} obj 
 */
function setPhoneNum(obj) {
	var value = obj.value;
	value = value.replace(/\s*/g, "");
	var result = [];
	for(var i = 0; i < value.length; i++) {
		if(i == 3 || i == 7) {
			result.push(" " + value.charAt(i));
		} else {
			result.push(value.charAt(i));
		}
	}
	obj.value = result.join("");
}
/**
 * ��ȡͼƬ���1x_��2x_��3x_��
 * @param {Object} 
 */
function getDifferencePic(picture_path, picture_style) {
	var a = picture_path.lastIndexOf("/");
	var file_path = picture_path.substring(0, a + 1);
	var file_name = picture_path.substring(a + 1, picture_path.length);
	var picture_size = file_path + picture_style + file_name;
	return picture_size;
}

/**
 * ��ȡ��ǰ���� ���磺2017-03-18
 * type(1-��ȡ���ڣ�2-��ȡʱ�䣬3-��ȡ���ں�ʱ��)
 * @param {Object} 
 */
function getNowFormatDate(type) {
	var currentdate = "";
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	month = addZero(month);
	var strDate = date.getDate();
	strDate = addZero(strDate);
	var hour = date.getHours();
	hour = addZero(hour);
	var minutes = date.getMinutes();
	minutes = addZero(minutes);
	var seconds = date.getSeconds();
	seconds = addZero(seconds);
	switch(type) {
		case "1":
			currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
			break;
		case "2":
			currentdate = hour + seperator2 + minutes + seperator2 + seconds;
			break;
		case "3":
			currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate +
				" " + hour + seperator2 + minutes + seperator2 + seconds;
			break;
		default:
			break;
	}
	return currentdate;
}
/**
 * ������Ĳ���С��10ʱ����ǰ�����0
 * @param {Object} 
 */
function addZero(initString) {
	if(initString >= 0 && initString <= 9) {
		initString = "0" + initString;
	}
	return initString;
}

/**
 * ת������
 * @param {Object} str
 */
function changeEmoji(str) {
	var emojArray = ["[smiley_0]", "[smiley_1]", "[smiley_2]", "[smiley_3]", "[smiley_4]", "[smiley_5]", "[smiley_6]", "[smiley_7]", "[smiley_8]", "[smiley_9]",
		"[smiley_10]", "[smiley_11]", "[smiley_12]", "[smiley_13]", "[smiley_14]", "[smiley_15]", "[smiley_16]", "[smiley_17]", "[smiley_18]", "[smiley_19]",
		"[smiley_20]", "[smiley_21]", "[smiley_22]", "[smiley_23]", "[smiley_24]", "[smiley_25]", "[smiley_26]", "[smiley_27]", "[smiley_28]", "[smiley_29]",
		"[smiley_30]", "[smiley_31]", "[smiley_32]", "[smiley_33]", "[smiley_34]", "[smiley_35]", "[smiley_36]", "[smiley_37]", "[smiley_38]", "[smiley_39]",
		"[smiley_40]", "[smiley_41]", "[smiley_42]", "[smiley_43]", "[smiley_44]", "[smiley_45]", "[smiley_46]", "[smiley_47]", "[smiley_48]", "[smiley_49]",
		"[smiley_50]", "[smiley_51]", "[smiley_52]", "[smiley_53]", "[smiley_54]", "[smiley_55]", "[smiley_56]", "[smiley_57]", "[smiley_58]", "[smiley_59]",
		"[smiley_60]", "[smiley_61]", "[smiley_62]", "[smiley_63]", "[smiley_64]", "[smiley_65]", "[smiley_66]", "[smiley_67]", "[smiley_68]", "[smiley_69]",
		"[smiley_70]", "[smiley_71]", "[smiley_72]", "[smiley_73]", "[smiley_74]", "[smiley_75]", "[smiley_76]", "[smiley_77]", "[smiley_78]", "[smiley_79]",
		"[smiley_80]", "[smiley_81]", "[smiley_82]", "[smiley_83]", "[smiley_84]", "[smiley_85]", "[smiley_86]", "[smiley_87]", "[smiley_88]", "[smiley_89]",
	];
	for(var i = 0; i < emojArray.length; i++) {
		//if (str.indexOf(emojArray[i])>0) {
		var reg = new RegExp(emojArray[i], "g");
		//str=str.replace(reg,'<img class="emoji_style" src="img/����/�����/'+emojArray[i].substring(1,emojArray[i].length-1)+'.png">');
		str = str.replace(reg, "ni");
		console.log(str);
		//}
	}
	return str;
}

/**
 * У���ֻ�����
 * @param {Object} tel
 */
function isMobile(tel) {
	var reg = /^0?1[3|4|5|7|8|9][0-9]\d{8}$/;
	if(reg.test(tel)) {
		return true;
	} else {
		return false;
	}
}

function callByAndroid() {
	console.log("callByAndroid");
	alert("Js�յ���Ϣ");
	//showElement("Js�յ���Ϣ-->�޲η���callByAndroid������");
}

function callByAndroidParam(msg1) {
	console.log("callByAndroid_param");
	alert("Js�յ���Ϣ��" + msg1);
	//showElement("Js�յ���Ϣ-->����callByAndroidParam������,����:" + msg1);

}

function callByAndroidMoreParams(objs, msg2, msg3) {
	alert("objs="+objs.toJSONString());
	alert("Js�յ���Ϣ��" + "id:" + objs.id.toString() + " name:" + objs.name + " age:" + objs.age.toString() + msg2 + msg3);
	//showElement("Js�յ���Ϣ-->����callByAndroidMoreParam������ , ����1:" + objs + "  ����2:" + msg2 + "  ����3:" + msg3);
	return "ok";
}

function callByAndroidInteraction(msg) {
	showElement(msg);
	window.setTimeout(sendHelloToAndroid, 3000);
}

/*H5��ԭ����ֵ*/
function sendHelloToNative() {
	// body...
	//console.log("call android")

	alert("1")
	if(window.native!=null && typeof(window.native)!="undefined"){
		native.callNative("��ã�native! ");
	}else{
		alert(typeof(window.native));
	}

}

/*ԭ��������Ͻ�*/
function callByNative(){
		alert("2")
		var Persion ={
		title : "ƻ��",	
		text : "text",	
		imageUrl : "http://tva4.sinaimg.cn/crop.1.0.638.638.1024/a026df41jw8ea72uxthh7j20hs0hqaat.jpg",
		url : "http://www.baidu.com"
		}
		alert("333")
		console.log("callByNative")
		alert("Js�յ���Ϣ");
		native.doShare(JSON.stringify(Persion));
}

/*ԭ����H5��ֵ*/
function callByNativeMoreParams(objs,msg2,msg3){
	alert("3")
	alert("Js�յ���Ϣ��"+"id:"+objs.id

			.toString()+" name:"+objs.name

		+" age:"+objs.age.toString()+msg2+msg3);
	 showElement("Js�յ���Ϣ-->����callByNativeMoreParams������ , ����1:"+objs+"����2:"+msg2+"  ����3:"+msg3);
	return "ok";
}