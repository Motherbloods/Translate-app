const {
  dialogflow,
  SimpleResponse,
  LinkOutSuggestion,
} = require("actions-on-google");

const app = dialogflow();

// Pastikan nama intent di sini sama dengan yang ada di Dialogflow
app.intent("voice open app", (conv) => {
  conv.ask(
    new SimpleResponse({
      speech: "Certainly! I'm opening the Translate app for you now.",
      text: "Opening the Translate app...",
    })
  );

  conv.ask(
    new LinkOutSuggestion({
      name: "Open Translate App",
      url: "myapp://translate",
    })
  );
});

exports.handleGoogleAction = app;
