// indicates when in internal anchor is not found!
$(function(){
  var links = $('a').map(function(_, elem){
    return $(elem).attr('href');
  }).toArray();

  links = links.filter(function(link){
    return link.match(/^#/) && link !== '#';
  });

  var uniqueLinks = links.filter(function(link, idx, links){
    return idx == links.indexOf(link);
  });

  uniqueLinks.forEach(function(link){
    if ($(link).length === 0){
      console.log("Internal link with anchor " + link + " was not found!");
    }
  });
});
