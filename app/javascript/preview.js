function preview() {

  let clickImg = document.getElementById('article_image');

  clickImg.addEventListener('change', function(e){
    let Img = e.target.files[0]
    let blob = window.URL.createObjectURL(Img);
    let previewImg = document.createElement('img');
    let previewField = document.getElementById('preview');
    previewImg.setAttribute('src', blob);
    previewImg.setAttribute('id', 'previewImg');
    previewImg.style.width = "25%";

    let oldImg = document.getElementById('previewImg');
    if (oldImg) {
      oldImg.setAttribute('src', blob);
      return null;
    }

    previewField.appendChild(previewImg);
  })
}

window.addEventListener("load", preview);