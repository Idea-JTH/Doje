$(function(){
	tinymce.init({
		selector:"#content",
		language : 'ko_KR',
		plugins: 'advlist autolink link image lists charmap print preview codesample emoticons textcolor',
		codesample_languages:[
			{text:'HTML/XML', value:'markup'},
			{text:'Javascript', value:'javascript'},
			{text:'CSS', value:'css'},
			{text:'PHP', value:'php'},
			{text:'Python', value:'python'},
			{text:'JAVA', value:'java'},
			{text:'C', value:'c'},
			{text:'C#', value:'csharp'},
			{text:'C++', value:'cpp'},
		],
		toolbar:[
			'undo redo | styleselect | bold italic | link imageupload codesample |' 
			+ ' alignleft aligncenter alignright | forecolor backcolor emoticons'
		],
		height:400,
		menubar:false,
		setup:function(editor){
			var inp 
			= $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
			$(editor.getElement()).parent().append(inp);
			
			editor.addButton('imageupload', {
				icon: 'image',
				onclick:function(e){
					inp.trigger('click');
				}
			});
			
			inp.on("change", function(e) {
				uploadFile($(this), editor);
			});
			
			function uploadFile(inp, editor){
				var input = inp.get(0);
				var data = new FormData();
				data.append("file", input.files[0]);
				
				$.ajax ({
					url:'/board/upload',
					type:'POST',
					data:data,
					enctype:'multipart/form-data',
					dataType:'json',
					processData:false, //데이터 처리끄기
					contentType:false, //전송 데이터 컨텐츠 타입 끄기
					success:function(data) {
						editor.insertContent(
							`<img class="content-img" src="${data.uploadImage}" data-mce-src="${data.uploadImage}"/>`);
					},
					error:function(jqXHR, textStatus, errorThrown){
						console.log(jqXHR);
						if(jqXHR.responseJSON) {
							var data = jqXHR.responseJSON;
							alert("이미지 업로드중 오류 발생 : " + data.msg);
						}
					}
				});
			}
		}
	});
});