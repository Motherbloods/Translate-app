const { translateText } = require("../utils/deepL");

exports.translate = async (req, res) => {
  try {
    const { text, targetLang } = req.body;
    if (!targetLang || !text) {
      return res
        .status(401)
        .send({ message: "Text and target language is required" });
    }
    const result = await translateText(text, targetLang);
    res.json({ translatedText: result.text });
  } catch (err) {
    console.error(err);
    res.status(500).send(err.message);
  }
};
