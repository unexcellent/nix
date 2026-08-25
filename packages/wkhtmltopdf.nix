# A library for creating PDFs based on HTML
{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.wkhtmltopdf
  ];
}