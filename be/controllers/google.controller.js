const {
  dialogflow,
  SimpleResponse,
  LinkOutSuggestion,
} = require("actions-on-google");

const app = dialogflow({ debug: true });

app.intent("voice open app", (conv) => {
  console.log("Received request to open Translate app");

  // Menggunakan fulfillment text dari Dialogflow jika tersedia
  const speechText =
    conv.intent.fulfillmentText || "Membuka aplikasi Translate untuk Anda.";

  conv.ask(
    new SimpleResponse({
      speech: speechText,
      text: "Membuka aplikasi Translate...",
    })
  );

  conv.ask(
    new LinkOutSuggestion({
      name: "Buka Aplikasi Translate",
      url: "myapp://translate",
    })
  );

  console.log("Sent response to open Translate app");
});

// Fallback intent untuk menangani permintaan yang tidak dikenali
app.fallback((conv) => {
  console.log("Fallback intent triggered");
  conv.ask(
    "Maaf, saya tidak mengerti permintaan tersebut. Bisakah Anda mengulanginya?"
  );
});

exports.handleGoogleAction = app;
