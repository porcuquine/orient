(defpackage :orient
  (:use :common-lisp :it.bese.FiveAm :fset :gmap)
  (:shadow :join :restrict :relation :tuple)
  ;; Use same shadowing imports as FSET-USER does.
  (:shadowing-import-from :fset
			  ;; Shadowed type/constructor names
			  #:set #:map
			  ;; Shadowed set operations
			  #:union #:intersection #:set-difference #:complement
			  ;; Shadowed sequence operations
			  #:first #:last #:subseq #:reverse #:sort #:stable-sort
			  #:reduce
			  #:find #:find-if #:find-if-not
			  #:count #:count-if #:count-if-not
			  #:position #:position-if #:position-if-not
			  #:remove #:remove-if #:remove-if-not
			  #:substitute #:substitute-if #:substitute-if-not
			  #:some #:every #:notany #:notevery)
  (:export :aif :apply-transformation :ask :attributes :awhen :component :constraint-system  :defconstraint-system :display :tuple :tuples
	   :create-tuple-report-step
	   :describe-transformation-calculation :defschema
	   :deftransformation :deftransformation= :extract
	   :find-component :find-schema :find-system :find-transformation
	   :forget :generate-directed-graph :it
	   :tref :join :lookup-description :make-relation
	   :make-signature :make-tuple
	   :orient-tests :plan :plan-for :pipeline-signature :rel :relation :remove-attributes :rename :report-data :report-solution-for :same
	   :schema :schema-parameters :schema-description :sig :signature :signature-input :signature-output :solve :solve-for
	   :synthesize-report-steps :symbolconc :sys :system :system-components
	   :system-data :system-schema
	   :tpl :transformation :transformation-signature :tref :trem :try-with :use-construction :use-attribute
	   :where :with-construction :write-dot-format
	   :*current-construction* :*trace-plan* :-> :=> :~> :=== :== &all :!>))
