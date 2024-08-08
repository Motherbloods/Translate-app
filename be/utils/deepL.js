const deepl = require("deepl-node");
const authKey = process.env.AUTH_KEY;
const translator = new deepl.Translator(authKey);

exports.translateText = async (text, targetLang) => {
  return await translator.translateText(text, null, targetLang);
};
