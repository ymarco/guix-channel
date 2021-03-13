(define-module (ymarco packages dragon-drop)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config))


(define-public dragon-drop
  (package
   (name "dragon-drop")
   (version "1.1.1")
   (source
    (origin
     (method git-fetch)
     (uri
      (git-reference
       (url "https://github.com/mwh/dragon.git")
       (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fgzz39007fdjwq72scp0qygp2v3zc5f1xkm0sxaa8zxm25g1bra"))))
   (build-system gnu-build-system)
   (inputs `(("gtk+" ,gtk+)))
   (native-inputs `(("pkg-config" ,pkg-config)))
   (arguments
    `(#:tests? #f                       ; no check
      #:make-flags
      (list (string-append "CC=" ,(cc-for-target))
            ;; makefile uses PREFIX for the binary location
            (string-append "PREFIX="
                           (assoc-ref %outputs "out")
                           "/bin"))
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure)))) ; no configure script
   (synopsis "Drag and drop source/target for X")
   (description
    "dragon is a lightweight drag-and-drop source for X where you can run:
  dragon file.tar.gz
to get a window with just that file in it, ready to be dragged where you need it.
What if you need to drag into something? Using:
  dragon --target
you get a window you can drag files and text into.  Dropped items are
printed to standard output.")
   (home-page "https://github.com/mwh/dragon")
   (license gpl3)))

dragon-drop
