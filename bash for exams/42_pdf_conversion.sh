#!/bin/bash
# PDF Conversion
# Explanation: Converts a document to PDF using LibreOffice.

input_file="document.docx"
output_file="document.pdf"
libreoffice --headless --convert-to pdf "$input_file"
