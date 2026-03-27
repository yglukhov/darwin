import ../objc/runtime
import ../foundation/nsstring

export NSString

type
  NLTag* = NSString

# NLTag constants - part of speech tags
proc nLTagNoun*(): NLTag {.inline.} =
  result = NSString("Noun")
proc nLTagVerb*(): NLTag {.inline.} =
  result = NSString("Verb")
proc nLTagAdjective*(): NLTag {.inline.} =
  result = NSString("Adjective")
proc nLTagAdverb*(): NLTag {.inline.} =
  result = NSString("Adverb")
proc nLTagPronoun*(): NLTag {.inline.} =
  result = NSString("Pronoun")
proc nLTagDeterminer*(): NLTag {.inline.} =
  result = NSString("Determiner")
proc nLTagParticle*(): NLTag {.inline.} =
  result = NSString("Particle")
proc nLTagPreposition*(): NLTag {.inline.} =
  result = NSString("Preposition")
proc nLTagConjunction*(): NLTag {.inline.} =
  result = NSString("Conjunction")
proc nLTagInterjection*(): NLTag {.inline.} =
  result = NSString("Interjection")
proc nLTagClassifier*(): NLTag {.inline.} =
  result = NSString("Classifier")
proc nLTagIdiom*(): NLTag {.inline.} =
  result = NSString("Idiom")
proc nLTagOtherWord*(): NLTag {.inline.} =
  result = NSString("OtherWord")
proc nLTagSentenceTerminator*(): NLTag {.inline.} =
  result = NSString("SentenceTerminator")
proc nLTagOpenQuote*(): NLTag {.inline.} =
  result = NSString("OpenQuote")
proc nLTagCloseQuote*(): NLTag {.inline.} =
  result = NSString("CloseQuote")
proc nLTagOpenParenthesis*(): NLTag {.inline.} =
  result = NSString("OpenParenthesis")
proc nLTagCloseParenthesis*(): NLTag {.inline.} =
  result = NSString("CloseParenthesis")
proc nLTagWordJoiner*(): NLTag {.inline.} =
  result = NSString("WordJoiner")
proc nLTagDash*(): NLTag {.inline.} =
  result = NSString("Dash")
proc nLTagOtherPunctuation*(): NLTag {.inline.} =
  result = NSString("OtherPunctuation")
proc nLTagParagraphBreak*(): NLTag {.inline.} =
  result = NSString("ParagraphBreak")
proc nLTagOtherWhitespace*(): NLTag {.inline.} =
  result = NSString("OtherWhitespace")

# Named entity tags
proc nLTagPersonalName*(): NLTag {.inline.} =
  result = NSString("PersonalName")
proc nLTagPlaceName*(): NLTag {.inline.} =
  result = NSString("PlaceName")
proc nLTagOrganizationName*(): NLTag {.inline.} =
  result = NSString("OrganizationName")

# Convenience templates
template NLTagNoun*: NLTag = nLTagNoun()
template NLTagVerb*: NLTag = nLTagVerb()
template NLTagAdjective*: NLTag = nLTagAdjective()
template NLTagAdverb*: NLTag = nLTagAdverb()
template NLTagPronoun*: NLTag = nLTagPronoun()
template NLTagDeterminer*: NLTag = nLTagDeterminer()
template NLTagParticle*: NLTag = nLTagParticle()
template NLTagPreposition*: NLTag = nLTagPreposition()
template NLTagConjunction*: NLTag = nLTagConjunction()
template NLTagInterjection*: NLTag = nLTagInterjection()
template NLTagClassifier*: NLTag = nLTagClassifier()
template NLTagIdiom*: NLTag = nLTagIdiom()
template NLTagOtherWord*: NLTag = nLTagOtherWord()
template NLTagSentenceTerminator*: NLTag = nLTagSentenceTerminator()
template NLTagOpenQuote*: NLTag = nLTagOpenQuote()
template NLTagCloseQuote*: NLTag = nLTagCloseQuote()
template NLTagOpenParenthesis*: NLTag = nLTagOpenParenthesis()
template NLTagCloseParenthesis*: NLTag = nLTagCloseParenthesis()
template NLTagWordJoiner*: NLTag = nLTagWordJoiner()
template NLTagDash*: NLTag = nLTagDash()
template NLTagOtherPunctuation*: NLTag = nLTagOtherPunctuation()
template NLTagParagraphBreak*: NLTag = nLTagParagraphBreak()
template NLTagOtherWhitespace*: NLTag = nLTagOtherWhitespace()
template NLTagPersonalName*: NLTag = nLTagPersonalName()
template NLTagPlaceName*: NLTag = nLTagPlaceName()
template NLTagOrganizationName*: NLTag = nLTagOrganizationName()
