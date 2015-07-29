SC.initialize({
  client_id: '22ae92fb8e2edda82c07401206b392d3'
});

function doSearch() {
  var searchTerm = document.getElementById('search').value;
  return searchTerm.replace(" ", "+");
}

function doRender() {
  SC.get('/tracks', { q: doSearch(), license: 'cc-by-sa' }, function(tracks) {
    for(track in tracks) {

      var catalog = document.getElementById('catalog');
      var img = document.createElement('img');
      img.setAttribute('onclick', 'showInfo(\'' + tracks[track].id + '\');');
      img.setAttribute('class', 'img');

      if (tracks[track].artwork_url !== null) {
        img.setAttribute('src', tracks[track].artwork_url);
      }else {
        img.setAttribute('src', 'http://tinyurl.com/n9lcatp');
      }
      catalog.appendChild(img);

      var body  = document.getElementsByTagName("BODY")[0];
      var popup_div = document.createElement('div');

      popup_div.setAttribute('class', 'popup ' + tracks[track].id);
      popup_div.setAttribute('onclick', 'hideInfo(\'' + tracks[track].id + '\');');
      popup_div.style.display= "none";
      body.appendChild(popup_div);

      var info_div = document.createElement('div');
      info_div.setAttribute('class', 'info ' + tracks[track].id);
      info_div.style.display= "none";
      popup_div.appendChild(info_div);

      var p = document.createElement("p");
      var title = document.createTextNode(tracks[track].title);
      p.appendChild(title);
      info_div.appendChild(p);
    }
  });
}

function showInfo(arg) {
  var popup = document.getElementsByClassName('popup ' + arg)[0];
  popup.style.display = "block";
  var info= document.getElementsByClassName('info ' + arg)[0];
  info.style.display = 'block';

  var src = 'https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/'+arg+'&amp;auto_play=true&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true';

  var iframe = document.createElement('iframe');
  iframe.setAttribute('class', 'iframe ' + arg);
  iframe.setAttribute('frameborder', 'no');
  iframe.setAttribute('src', src);
  info.appendChild(iframe);
}

function hideInfo(arg) {
  var popup = document.getElementsByClassName('popup '+ arg)[0];
  var info = document.getElementsByClassName('info '+ arg)[0];
  var iframe = document.getElementsByClassName('iframe '+ arg)[0];
  info.removeChild(iframe);
  info.style.display = 'none';
  popup.style.display = 'none';
}
