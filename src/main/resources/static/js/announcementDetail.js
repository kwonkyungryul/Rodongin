let principalId = $('#principalId').val();
      $('#applyBtn').click(()=>{
        if (principalId == 0) {
          alert('로그인 후 지원해주세요.');
          return;
        }
      })

function subscribe(isSubscribe, announcementId) {
    let principalId = $('#principalId').val();

    if (principalId == 0) {
        alert('로그인 후 이용해주세요.');
        return;
    }
    if (isSubscribe) {
        $.ajax({
            type: "delete",
            url: "/subscribe",
            data: JSON.stringify(announcementId),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done((res) => {
            isSubscribe = false;
            $('#starBox').empty();
            $('#starBox').append(`
                <button onclick="subscribe(${isSubscribe}, ${announcementId})" class="star_box text-center d-flex justify-content-center px-3 ms-5 me-3 btn btn-outline-primary text-center">
                <div class="">
                <i class="fa-regular fa-star fs-5"></i>
                <p class="m-0">${res.data}</p>
                </div>
                </button>
            `);
        }).fail((err) => {
            alert(err.responseJSON.msg);
        });
    } else {
        $.ajax({
            type: "post",
            url: "/subscribe",
            data: JSON.stringify(announcementId),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done((res) => {
            isSubscribe = true;
            $('#starBox').empty();
            $('#starBox').append(`
                <button onclick="subscribe(${isSubscribe}, ${announcementId})" class="star_box text-center d-flex justify-content-center px-3 ms-5 me-3 btn btn-outline-primary text-center">
                <div class="">
                <i class="fa-solid fa-star fs-5"></i>
                <p class="m-0">${res.data}</p>
                </div>
                </button>
            `);
        }).fail((err) => {
            alert(err.responseJSON.msg);
        });
    }
}