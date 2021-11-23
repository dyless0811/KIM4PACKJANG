$(function () {
    var itemIndex = 0;
	var productNo = $("#product-no").text();
    var productName = $("#product-name").text();
    var productPrice = $("#product-price").text();
	console.log(productName);
	console.log(productPrice);
    
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

      if (sizeNo == "" || colorNo == "") {
        alert("색상과 사이즈를 선택해주세요!");
        return;
      }

      var content = `<tr id="item-${itemIndex}">`;
      content += `<td><input type="hidden" name="productNo" value="${productNo}">${productName}</td>`;
      content += `<td><input type="hidden" name="color" value="${colorNo}" />${colorName}</td>`;
      content += `<td><input type="hidden" name="size" value="${sizeNo}" />${sizeName}</td>`;
      content += `<td><input class="item-count" type="number" name="count" min="1" value="1" /></td>`;
      content += `<td><h4>${productPrice}</h4><input class="item-price" type="hidden" name="price" value="${productPrice}" readonly /></td>`;
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