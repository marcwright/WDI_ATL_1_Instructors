$(function(){
  var sites = new SiteCollection();
  var sitesView = new ListView({collection: sites});
  sites.fetch();
  var formView = new FormView({collection: sites});
});
