

document.addEventListener('turbolinks:load', function () {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin],
    events: [
      {
        id: 123,
        title: 'サンプルイベント',
        start: new Date()
      }
    ]
  });

  calendar.render();
});
