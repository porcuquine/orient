#!/usr/local/bin/cl -Q -s orient -p demo -E main
(deftransformation my-transf ((height width depth) -> (volume)) (values (* height width depth)))

(defun main(&rest argv) 
  (let* ((transformation (load-transformation "json/volumeOfBox.json"))
	 (tuple (tuple (height 1) (width 2) (depth 10.25) (density 0.9995)))
	 (pipeline (load-pipeline "json/boxMassPipeline.json"))
	 (system (make-instance 'system :components (mapcar (lambda (transformation)
							      (make-instance 'component :transformations (list transformation)))
							    pipeline)))
	 (problem (make-signature '(height width depth density) '(mass)))
	 (plan (plan system problem)))
    (format t "~&~%Evaluating tuple with transformationation: ")
    (encode-json (apply-transformation 'my-transf tuple))

    (format t "~&~%Evaluating tuple with pipeline: ")
    (encode-json (apply-transformation  pipeline tuple))

    (format t "~&~%Solve for box mass. Problem signature: ~S~%"  problem)
    (format t "~&~%Did this recreate our pipeline? ~A~%" (if (same pipeline plan) "YES" "NO"))
    (encode-json (solve system problem tuple))))
