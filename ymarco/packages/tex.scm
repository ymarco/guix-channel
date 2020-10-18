(define-module (ymarco packages tex)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system texlive)
  #:use-module (gnu packages tex))

(define-public texlive-latex-bidi
  (package
    (name "texlive-latex-bidi")
    (version (number->string %texlive-revision))
    (source (origin
              (method svn-fetch)
              (uri (texlive-ref "latex" "bidi"))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "TODO"))))
    (build-system texlive-build-system)
    (arguments '(#:tex-directory "latex/bidi"))
    (home-page "https://www.ctan.org/pkg/bidi")
    (synopsis "A convenient interface for typesetting bidirectional texts")
    (description
     "TODO")
    (license license:lppl1.3c+)))
