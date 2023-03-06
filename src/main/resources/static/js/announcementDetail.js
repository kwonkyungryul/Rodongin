let principalId = $('#principalId').val();
      $('#applyBtn').click(()=>{
        if (principalId == 0) {
          alert('로그인 후 지원해주세요.');
          return;
        }
      })

function subscribe(isSubscribe, announcementId) {
if (isSubscribe) {
    
} else {
    $.ajax({
        type: "post",
        url: "/subscribe",
        data: JSON.stringify(announcementId),
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done((res) => {
        $('#starBox').empty();
        $('#starBox').append(`
            <i class="fa-solid fa-regular fa-star fs-5"></i>
            <p class="m-0">${res.data}</p>
        `);
    }).fail((err) => {
        alert(err.responseJSON.msg);
    });
}
}