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
      img.setAttribute('onclick', 'setValues(\'' + tracks[track].id + '\', \'' + tracks[track].artwork_url + '\');');
      img.setAttribute('class', 'img');
      img.setAttribute('id', '\'' + tracks[track].id + '\'');

      if (tracks[track].artwork_url !== null) {
        img.setAttribute('src', tracks[track].artwork_url);
      }else {
        img.setAttribute('src', 'http://tinyurl.com/n9lcatp');
      }
      catalog.appendChild(img);
    }
  });
}

function setValues(arg, arg2) {
  var post_artwork = document.getElementById("post_artwork");
  post_artwork.setAttribute('value', arg2);
}
