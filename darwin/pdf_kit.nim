import pdf_kit / [pdfdocument, pdfpage, pdfview, pdfannotation, pdfoutline, 
    pdfthumbnailview, pdfaction, pdfdestination]
export pdfdocument, pdfpage, pdfview, pdfannotation, pdfoutline, 
    pdfthumbnailview, pdfaction, pdfdestination

# Link against PDFKit framework
{.passL: "-framework PDFKit".}
