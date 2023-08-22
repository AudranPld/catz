// app/javascript/packs/calendar.js
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('DOMContentLoaded', function () {
  const calendarEl = document.getElementById('calendar');

  const calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin],
    defaultView: 'dayGridMonth',
    events: [
      // Définir les événements (plages de jours) ici
      // Chaque événement doit avoir un "start" et "end" définissant la plage de jours
      // Vous pouvez également définir des propriétés pour personnaliser l'apparence des événements
      {
        title: 'Plage 1',
        start: '2023-08-01',
        end: '2023-08-04',
        backgroundColor: 'gray',
      },
      {
        title: 'Plage 2',
        start: '2023-08-10',
        end: '2023-08-13',
        backgroundColor: 'gray',
      },
    ],
  });

  calendar.render();
});
