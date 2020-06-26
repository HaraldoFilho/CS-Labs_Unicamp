;;; MC336 - PARADIGMAS DE PROGRAMACAO - 1s2008
;;; Prof. Jacques Wainer
;;; ------------------------------------------
;;; PROJETO LISP
;;; Aluno: Haraldo Sergio A. Pereira Filho
;;; RA: 003059


;;; Parte 1:

(defun hull (pontos)
  (let ((inicio (ponto-inicial pontos)))
    (if (< (length pontos) 3) nil (wrap inicio inicio inicio pontos nil))))

(defun wrap (inicio anterior atual pontos resultado)
  (let ((proximo (proximo-ponto (list atual anterior) (remove atual pontos :test #'equal))))
    (cond
     ((equal (first (last resultado)) inicio) resultado)
     (t (wrap inicio atual proximo (remove proximo pontos :test #'equal) (append resultado (list proximo)))))))

(defun ponto-inicial (lista &optional ponto)
  (cond
   ((null lista) ponto)
   ((null ponto) (ponto-inicial (rest lista) (first lista)))
   ((< (second (first lista)) (second ponto)) (ponto-inicial (rest lista) (first lista)))
   ((and (= (second (first lista)) (second ponto)) (> (first (first lista)) (first ponto))) (ponto-inicial (rest lista) (first lista)))
   (t (ponto-inicial (rest lista) ponto))))

(defun proximo-ponto (ref pontos &optional prox)
  (cond
   ((null pontos) prox)
   ((and (null prox) (null (rest pontos))) (first pontos))
   ((null prox) (proximo-ponto ref (rest (rest pontos)) (menor-angulo (first ref) (second ref) (first pontos) (second pontos))))
   (t (proximo-ponto ref (rest pontos) (menor-angulo (first ref) (second ref) prox (first pontos))))))

(defun menor-angulo (coord0 coord1 coord2 coord3)
  (let ((ang1 (angulo coord1 coord0)) (ang2 (angulo coord0 coord2)) (ang3 (angulo coord0 coord3)))
    (cond
     ((< (abs (- ang2 ang1)) (abs (- ang3 ang1))) coord2)
     ((< (abs (- ang3 ang1)) (abs (- ang2 ang1))) coord3)
     (t (menor-distancia coord0 coord2 coord3)))))

(defun menor-distancia (coord0 coord1 coord2)
  (let ((d1 (dist coord0 coord1)) (d2 (dist coord0 coord2)))
    (if (< d1 d2) coord1 coord2)))

(defun dist (coord0 coord1)
  (sqrt (+ (expt (- (first coord0) (first coord1)) 2) (expt (- (second coord0) (second coord1)) 2))))

(defun angulo (coord0 coord1)
  (cond 
   ((= (quadrante coord0 coord1) 0) 0)
   ((= (quadrante coord0 coord1) 1) (atan (abs (/ (- (second coord1) (second coord0)) (- (first coord1) (first coord0))))))
   ((= (quadrante coord0 coord1) 2) (- pi (atan (abs (/ (- (second coord1) (second coord0)) (- (first coord1) (first coord0)))))))
   ((= (quadrante coord0 coord1) 3) (+ pi (atan (abs (/ (- (second coord1) (second coord0)) (- (first coord1) (first coord0)))))))
   ((= (quadrante coord0 coord1) 4) (- (* 2 pi) (atan (abs (/ (- (second coord1) (second coord0)) (- (first coord1) (first coord0)))))))
   ((= (quadrante coord0 coord1) 1.2) (/ pi 2))
   ((= (quadrante coord0 coord1) 2.3) pi)
   ((= (quadrante coord0 coord1) 3.4) (/ (* 3 pi) 2))
   ((= (quadrante coord0 coord1) 4.1) (* 2 pi))))

(defun quadrante (coord0 coord1)
  (cond
   ((and (= (- (first coord1) (first coord0)) 0) (= (- (second coord1) (second coord0)) 0)) 0)
   ((and (> (- (first coord1) (first coord0)) 0) (> (- (second coord1) (second coord0)) 0)) 1)
   ((and (< (- (first coord1) (first coord0)) 0) (> (- (second coord1) (second coord0)) 0)) 2)
   ((and (< (- (first coord1) (first coord0)) 0) (< (- (second coord1) (second coord0)) 0)) 3)
   ((and (> (- (first coord1) (first coord0)) 0) (< (- (second coord1) (second coord0)) 0)) 4)
   ((and (= (- (first coord1) (first coord0)) 0) (> (- (second coord1) (second coord0)) 0)) 1.2)
   ((and (< (- (first coord1) (first coord0)) 0) (= (- (second coord1) (second coord0)) 0)) 2.3)
   ((and (= (- (first coord1) (first coord0)) 0) (< (- (second coord1) (second coord0)) 0)) 3.4)
   ((and (> (- (first coord1) (first coord0)) 0) (= (- (second coord1) (second coord0)) 0)) 4.1)))


;;; Parte 2:

(defun camadas (pontos)
  (conta-camadas pontos 0))

(defun conta-camadas (pontos count)
    (if (< (length pontos) 3) count (conta-camadas (retira (hull pontos) pontos) (1+ count))))

(defun retira (lista1 lista2)
  (if (null lista1) lista2 (retira (rest lista1) (remove (first lista1) lista2 :test #'equal))))

