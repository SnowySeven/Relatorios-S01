(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo) :initial-value 0))

(defun purifica (g quantidade)
  (let ((nova-escuridao (if (>= quantidade (garota-magica-escuridao g))
                            0
                            (- (garota-magica-escuridao g) quantidade))))
    (make-garota-magica :nome (garota-magica-nome g)
                         :escuridao nova-escuridao
                         :bruxas (garota-magica-bruxas g))))

(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 15 :bruxas 1))
         (homura (make-garota-magica :nome "Homura" :escuridao 68 :bruxas 12))
         (mami   (make-garota-magica :nome "Mami"   :escuridao 30 :bruxas 8))
         (grupo  (list madoka homura mami)))

    (format t "Escuridao total do grupo: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (let* ((sayaka (make-garota-magica :nome "Sayaka" :escuridao 52 :bruxas 3))
           (novo-grupo (cons sayaka grupo)))
      (format t "Escuridao total (grupo original): ~a~%" (escuridao-total grupo))
      (format t "Escuridao total (novo grupo com Sayaka): ~a~%"
              (escuridao-total novo-grupo)))

    (let ((homura-purificada (purifica homura 80)))
      (format t "Escuridao de ~a (original): ~a~%"
              (garota-magica-nome homura)
              (garota-magica-escuridao homura))
      (format t "Escuridao de ~a (purificada): ~a~%"
              (garota-magica-nome homura-purificada)
              (garota-magica-escuridao homura-purificada)))))

(main)
