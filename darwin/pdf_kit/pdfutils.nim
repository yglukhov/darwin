import darwin/objc/runtime
import darwin/foundation/[nsstring, nsurl]
import pdfdocument

## PDF Utility functions

proc canModifyAnnotations*(doc: PDFDocument): bool =
  ## Check if document likely allows annotation modifications.
  ## Note: This is an approximation based on user permissions.
  ## Even if this returns true, PDFKit may still log warnings when
  ## trying to modify certain PDFs due to internal PDF engine behavior.
  not doc.isLocked() and doc.allowsCopying()

proc openDocumentReadOnly*(path: string): PDFDocument =
  ## Open a PDF document for viewing only.
  ## If the document has restrictive permissions, this may trigger
  ## PDFKit warnings but the document will still display.
  let url = NSURL.fileURLWithPath(path.NSString)
  result = PDFDocument.alloc().initWithURL(url)
  
  # If document is locked, we can't really do much
  if result.isLocked():
    echo "Warning: PDF is locked and requires password"

proc documentPermissionsDescription*(doc: PDFDocument): string =
  ## Get a human-readable description of document permissions
  if doc.isLocked():
    result = "Locked (password protected)"
  else:
    result = "Unlocked"
    if doc.allowsCopying():
      result &= ", Copying allowed"
    else:
      result &= ", Copying prohibited"
    if doc.allowsPrinting():
      result &= ", Printing allowed"
    else:
      result &= ", Printing prohibited"
