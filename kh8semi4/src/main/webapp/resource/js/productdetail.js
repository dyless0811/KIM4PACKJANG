$(function () {
    var itemIndex = 0;
	var productNo = $("#product-no").text();
    var productName = $("#product-name").text();
    var productPrice = $("#product-price").text();

	
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    var conPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

    
    function calcTotal () { 
      var totalPrice = 0;
      $.each($("#selected-item .item-price"), function (index, item) { 
        totalPrice += Number(item.value);
      });
      $("#totalPrice").text(totalPrice);
    }
    
    $("#select-btn").on("click", function () {

      itemIndex += 1;
      var sizeNo = $("#select-size option:selected").val();
      var sizeName = $("#select-size option:selected").text();
      var colorNo = $("#select-color option:selected").val();
      var colorName = $("#select-color option:selected").text();
	  var stock = 0;	  

      $(".RkRNd").show();

 	  if (sizeNo == "" || colorNo == "") {
        alert("색상과 사이즈를 선택해주세요!");
        return;
      }
	  $.ajax({
      url : `${conPath}/product/stock-colorsize.kj`,
		type : "post",
		data : {//전송 시 첨부할 파라미터 정보
				  productNo : productNo,
				  colorNo : colorNo,
				  sizeNo : sizeNo
				},
		async: false,
		success : function(resp) {
					stock = resp;
				},
		error : function(err) {//통신이 실패했다.
					alert("로그인해주세요!");
				}
	  });
      var content = `<tr id="item-${itemIndex}">`;
      content += `<td><input type="hidden" name="productNo" value="${productNo}">${productName}</td>`;
      content += `<td><input type="hidden" name="color" value="${colorNo}" />${colorName}</td>`;
      content += `<td><input type="hidden" name="size" value="${sizeNo}" />${sizeName}</td>`;
      content += `<td><input class="item-count" type="number" name="count" min="0" max="${stock}" value="1" /></td>`;
      content += `<td><h4>${productPrice}</h4><input class="item-price" type="hidden" name="price" value="${productPrice}" readonly /></td>`;
      content += `<td><span class="item-stock">${stock}</span>개</td>`;
      content += `<td><button type="button">X</button></td>`;
      content += `</tr>`;
      $("#selected-item").append(content);

      calcTotal();

      $(`#item-${itemIndex} button`).on("click", function () {
        $(this).parent().parent().remove();
        itemIndex -= 1;
        calcTotal();
      });

      $(`#item-${itemIndex} .item-count`).on("input", function () {
        var count = $(this).val();
        $(this).parent().next().find(".item-price").val(count*productPrice);
        $(this).parent().next().find("h4").text(count*productPrice);
        calcTotal();
      })
    });
});