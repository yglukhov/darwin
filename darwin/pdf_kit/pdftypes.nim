# Forward declarations for all PDFKit types
# This module is imported by other pdf_kit modules to avoid circular dependencies

import darwin/objc/runtime
import darwin/app_kit/nsview

export NSView

type
  # Core types
  PDFDocument* = ptr object of NSObject
  PDFPage* = ptr object of NSObject
  PDFSelection* = ptr object of NSObject
  PDFOutline* = ptr object of NSObject
  
  # Annotation types
  PDFAnnotation* = ptr object of NSObject
  PDFBorder* = ptr object of NSObject
  
  # Action types
  PDFAction* = ptr object of NSObject
  PDFActionGoTo* = ptr object of PDFAction
  PDFActionURL* = ptr object of PDFAction
  PDFActionNamed* = ptr object of PDFAction
  PDFActionResetForm* = ptr object of PDFAction
  PDFActionJavaScript* = ptr object of PDFAction
  
  # Destination
  PDFDestination* = ptr object of NSObject
  
  # View types
  PDFView* = ptr object of NSView
  PDFThumbnailView* = ptr object of NSView

# Enums used across multiple modules
type
  PDFDisplayBox* {.size: sizeof(uint).} = enum
    kPDFDisplayBoxMediaBox = 0
    kPDFDisplayBoxCropBox = 1
    kPDFDisplayBoxBleedBox = 2
    kPDFDisplayBoxTrimBox = 3
    kPDFDisplayBoxArtBox = 4
