import ../darwin/natural_language
import ../darwin/foundation
import ../darwin/objc/blocks

# Test 1: Language recognition for English
block english_recognition:
  let text = NSString("Hello world, this is a test.")
  let lang = NLLanguageRecognizer.dominantLanguage(text)
  doAssert(lang == NLLanguageEnglish)

# Test 2: Language recognition for Chinese (Simplified)
block chinese_recognition:
  let text = NSString("你好世界，这是一个测试。")
  let lang = NLLanguageRecognizer.dominantLanguage(text)
  # Chinese text may be detected as either generic Chinese or Simplified Chinese
  doAssert(lang == NLLanguageChinese or lang == NLLanguageSimplifiedChinese)

# Test 3: Language recognition for Japanese
block japanese_recognition:
  let text = NSString("こんにちは、これはテストです。")
  let lang = NLLanguageRecognizer.dominantLanguage(text)
  doAssert(lang == NLLanguageJapanese)

# Test 4: Language recognition for French
block french_recognition:
  let text = NSString("Bonjour le monde, ceci est un test.")
  let lang = NLLanguageRecognizer.dominantLanguage(text)
  doAssert(lang == NLLanguageFrench)

# Test 5: Language recognition for German
block german_recognition:
  let text = NSString("Hallo Welt, das ist ein Test.")
  let lang = NLLanguageRecognizer.dominantLanguage(text)
  doAssert(lang == NLLanguageGerman)

# Test 6: Language recognition for Spanish
block spanish_recognition:
  let text = NSString("Hola mundo, esto es una prueba.")
  let lang = NLLanguageRecognizer.dominantLanguage(text)
  doAssert(lang == NLLanguageSpanish)

# Test 7: Using NLLanguageRecognizer instance
block recognizer_instance:
  let recognizer = NLLanguageRecognizer.alloc().init()
  let text = NSString("The quick brown fox jumps over the lazy dog.")
  recognizer.processString(text)
  let lang = recognizer.dominantLanguage()
  doAssert(lang == NLLanguageEnglish)

# Helper proc to count tokens using enumerateTokensInRange
proc countTokens(tokenizer: NLTokenizer, text: NSString): int =
  var count = 0
  let countRef = addr count
  let textRange = NSMakeRange(0, text.length)
  let bl = toBlock() do (tokenRange: NSRange, flags: NLTokenizerAttributes, stop: var bool):
    countRef[] += 1
  tokenizer.enumerateTokensInRange(textRange, bl)
  bl.release()
  result = count

# Test 8: NLTokenizer word tokenization with English
block tokenizer_english_words:
  let tokenizer = NLTokenizer.alloc().initWithUnit(nlTokenizerUnitWord)
  let text = NSString("Hello world test")
  tokenizer.setString(text)
  let tokenCount = countTokens(tokenizer, text)
  doAssert(tokenCount == 3, "Expected 3 tokens, got " & $tokenCount)

# Test 9: NLTokenizer sentence tokenization
block tokenizer_sentences:
  let tokenizer = NLTokenizer.alloc().initWithUnit(nlTokenizerUnitSentence)
  let text = NSString("First sentence. Second sentence.")
  tokenizer.setString(text)
  let textRange = NSMakeRange(0, text.length)
  let tokenRanges = tokenizer.tokensForRange(textRange)
  doAssert(tokenRanges.len == 2, "Expected 2 sentences, got " & $tokenRanges.len)
  # Verify first sentence range starts at location 0
  let firstSentenceRange = tokenRanges[0].rangeValue
  doAssert(firstSentenceRange.location == 0 and firstSentenceRange.length > 0, "Expected valid first sentence range")

# Test 10: NLTokenizer word tokenization with Chinese (CJK)
block tokenizer_chinese:
  let tokenizer = NLTokenizer.alloc().initWithUnit(nlTokenizerUnitWord)
  # Use a meaningful Chinese sentence: "今天天气很好" (The weather is good today)
  let text = NSString("今天天气很好")
  tokenizer.setString(text)
  tokenizer.setLanguage(NLLanguageChinese)
  let textRange = NSMakeRange(0, text.length)
  let tokenRanges = tokenizer.tokensForRange(textRange)
  # Actual tokenization: 今天/天气/很/好 or 今天/天/气/很好 etc.
  doAssert(tokenRanges.len == 4, "Expected 4 tokens for Chinese text '今天天气很好', got " & $tokenRanges.len)

# Test 11: NLTokenizer word tokenization with Japanese (CJK)
block tokenizer_japanese:
  let tokenizer = NLTokenizer.alloc().initWithUnit(nlTokenizerUnitWord)
  # Use a meaningful Japanese sentence: "私は学生です" (I am a student)
  let text = NSString("私は学生です")
  tokenizer.setString(text)
  tokenizer.setLanguage(NLLanguageJapanese)
  let textRange = NSMakeRange(0, text.length)
  let tokenRanges = tokenizer.tokensForRange(textRange)
  # Actual tokenization: 私/は/学生/です
  doAssert(tokenRanges.len == 4, "Expected 4 tokens for Japanese text '私は学生です', got " & $tokenRanges.len)

# Test 12: NLTokenizer word tokenization with Korean (CJK)
block tokenizer_korean:
  let tokenizer = NLTokenizer.alloc().initWithUnit(nlTokenizerUnitWord)
  # Use a meaningful Korean sentence: "저는 학생입니다" (I am a student)
  let text = NSString("저는 학생입니다")
  tokenizer.setString(text)
  tokenizer.setLanguage(NLLanguageKorean)
  let textRange = NSMakeRange(0, text.length)
  let tokenRanges = tokenizer.tokensForRange(textRange)
  # Actual tokenization: 저는/학생입니다
  doAssert(tokenRanges.len == 2, "Expected 2 tokens for Korean text '저는 학생입니다', got " & $tokenRanges.len)

# Helper proc to collect all tags from tagger
proc collectTags(tagger: NLTagger, text: NSString, scheme: NSString): seq[string] =
  result = @[]
  let textRange = NSMakeRange(0, text.length)
  let resultRef = addr result
  let bl = toBlock() do (tag: NLTag, tokenRange: NSRange, stop: var bool):
    if tag != nil:
      resultRef[].add($tag)
  tagger.enumerateTagsInRange(textRange, nlTokenizerUnitWord, scheme, 0, bl)
  bl.release()

# Test 13: NLTagger part-of-speech tagging - verify exact tags are returned
block tagger_pos:
  let schemes = arrayWithObjects(NLTagSchemeLexicalClass)
  let tagger = NLTagger.alloc().initWithTagSchemes(schemes)
  let text = NSString("The cat runs fast")
  tagger.setString(text)
  let tags = collectTags(tagger, text, NLTagSchemeLexicalClass)
  # Expected tags: Determiner, Whitespace, Noun, Whitespace, Verb, Whitespace, Adverb
  doAssert(tags == @["Determiner", "Whitespace", "Noun", "Whitespace", "Verb", "Whitespace", "Adverb"])

# Test 14: NLTagger named entity recognition - verify NER recognizes person names and places
block tagger_ner:
  let schemes = arrayWithObjects(NLTagSchemeNameType)
  let tagger = NLTagger.alloc().initWithTagSchemes(schemes)
  # Text contains: Steve Jobs (person), California (place)
  let text = NSString("Steve Jobs lives in California")
  tagger.setString(text)
  let tags = collectTags(tagger, text, NLTagSchemeNameType)
  # Expected NER tags: PersonalName, Whitespace, PersonalName, Whitespace, OtherWord, Whitespace, OtherWord, Whitespace, PlaceName
  doAssert(tags[0] == "PersonalName")
  doAssert(tags[2] == "PersonalName")
  doAssert(tags[8] == "PlaceName")
